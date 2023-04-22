#include <stdbool.h>
#include <stddef.h>
#include <main.h>
#include <usart.h>
#include <tim.h>
#include <console.h>
#include <layer1_physical.h>
#include <layer2_data_link.h>
#include <object_device.h>
#include <debug.h>
#include <stdio.h>

#ifdef DEBUG_LAYER_PHYSICAL
#define DEBUG
#endif

#define STATE_RESET         0
// Entered after Power On Reset (POR) or in response to a U_Reset__req() service issued by the host controller. In this
// state NCN5130 gets initialized, all features disabled and services are ignored and not executed.

// Entered after Reset State or when VBUS, VFILT or Xtal are not operating correctly (operation of VBUS, VFILT and
// XTAL can be verified by means of the System Status Service, p37). Communication with KNX bus is not allowed.
// U_SystemStat.ind can be used to verify this state (code 00).
#define STATE_POWER_UP      1
#define STATE_POWER_UP_STOP 2

// This state is useful for setting−up NCN5130 safely or temporarily interrupting reception from the KNX bus.
// U_SystemStat.ind can be used to verify this state (code 10).
#define STATE_STOP          3

// NCN5130 remains in this state until it detects silence on the KNX bus for at least 40 Tbits.
// Although the receiver of NCN5130 is on, no frames are transmitted to the host controller.
// U_SystemStat.ind can be used to verify this state (code 01).
#define STATE_SYNC          4

// In this state the device is fully functional. Communication with the KNX bus is allowed.
// U_SystemStat.ind can be used to verify this state (code 11).
#define STATE_NORMAL        5

static unsigned char m_state = STATE_RESET;
static unsigned char m_send_msg[4];
static unsigned char m_recive_msg[64];
static unsigned char m_rx_index = 0;


#define RX_BUS_BUSY -1
#define RX_BUS_FREE 0
#define RX_FRAME_IN_PROPGRESS 1;
static int m_rx_state = RX_BUS_BUSY;
static unsigned char m_rx_byte;
static bool m_need_confirmation = false;




/* SERVICES FROM HOST CONTROLLER */
void send_to_controler(size_t size)
{
    int i;
    for(i=0; i < size; i++)
    {
#ifdef DEBUG
        console_print_char('>');
        console_print_hex(m_send_msg[i]);
        console_print_string("\r\n");
#endif
        HAL_UART_Transmit(&huart1, &m_send_msg[i], 1, HAL_MAX_DELAY);
    }
}

void U_Reset__req()
{
#ifdef DEBUG
    console_print_string("U_Reset__req\r\n");
#endif
    m_state = STATE_RESET;
    m_send_msg[0] = 0x01;
    send_to_controler(1);
}

void U_State__req()
{
    m_send_msg[0] = 0x02;
    send_to_controler(1);
}

void U_SetBusy__req()
{
    m_send_msg[0] = 0x03;
    send_to_controler(1);
}

void U_QuitBusy__req()
{
    m_send_msg[0] = 0x04;
    send_to_controler(1);
}

void U_Busmon__req()
{
    m_send_msg[0] = 0x05;
    send_to_controler(1);
}

void U_SetAddress__req(unsigned char addr_low, unsigned char addr_hight)
{
    m_send_msg[0] = 0xF1;
    m_send_msg[1] = addr_hight;
    m_send_msg[2] = addr_low;
    send_to_controler(4);
}

void U_SetRepetition__req(unsigned char rep_cntrs)
{
    m_send_msg[0] = 0xF2;
    m_send_msg[1] = rep_cntrs;
    send_to_controler(4);
}

void U_L_DataOffset__req(unsigned char index)
{
    m_send_msg[0] = 0x08 | (index & 0x07);
    send_to_controler(1);
}

void U_SystemStat__req()
{
    m_send_msg[0] = 0x0D;
    send_to_controler(1);
}

void U_StopMode__req()
{
    m_send_msg[0] = 0x0E;
    send_to_controler(1);
}

void U_ExitStopMode__req()
{
    m_send_msg[0] = 0x0F;
    send_to_controler(1);
}

void U_Ackn__req(bool nack, bool busy, bool addressed)
{
    m_send_msg[0] = 0x10 | (nack << 2) | (busy << 1) | addressed;
    send_to_controler(1);
}

void U_Configure__req(bool auto_polling, bool crc_ccitt, bool frame_end_marker)
{
    m_send_msg[0] = 0x18 | (auto_polling << 2) | (crc_ccitt << 1) | frame_end_marker;
    send_to_controler(1);
}

void U_IntRegWr__req(unsigned char address, unsigned char data)
{
    m_send_msg[0] = 0x28 | (address & 0x3);
    m_send_msg[1] = data;
    send_to_controler(2);
}

void U_IntRegRd__req(unsigned char address)
{
    m_send_msg[0] = 0x38 | (address & 0x3);
    send_to_controler(1);
}

void U_PollingState__req(unsigned char slot, unsigned char addr_hight, unsigned char addr_low, unsigned char state)
{
    m_send_msg[0] = 0xE0 | (slot & 0x0F);
    m_send_msg[1] = addr_hight;
    m_send_msg[2] = addr_low;
    m_send_msg[3] = state;
    send_to_controler(4);
}


void U_L_DataStart__req(unsigned char ctrl)
{
    m_send_msg[0] = 0x80;
    m_send_msg[1] = ctrl;
    send_to_controler(2);
}

void U_L_DataCont__req(unsigned char index, unsigned char data)
{
    m_send_msg[0] = 0x81 | (index & 0x3F);
    m_send_msg[1] = data;
    send_to_controler(2);
}

void U_L_DataEnd__req(unsigned char index, unsigned char fcs)
{
    m_send_msg[0] = 0x40 | (index & 0x3F);
    m_send_msg[1] = fcs;
    send_to_controler(2);
}


/*      CONTROL SERVICES – DEVICE SPECIFIC */

void U_Reset__ind() // Called from hardware
{
#ifdef DEBUG
    console_print_string("U_Reset__ind\r\n");
#endif
    m_state = STATE_NORMAL;
    m_rx_state = RX_BUS_FREE;
    Ph_Reset__con(p_ok);
}



void U_State__ind(bool slave_collision, bool receive_error, bool transmit_error, bool protocol_error, bool temperature_warning)
{
    // TODO:
}

void U_FrameState__ind(bool bit_error, bool crc_or_lenght_error, bool timing_error)
{
    // TODO:
}

void U_Configure__ind(bool auto_ack, bool auto_poll, bool crc_ccitt, bool frame_end_marker)
{
    // TODO:
}

void U_FrameEnd__ind()
{
    // TODO:
}

void U_StopMode__ind()
{
    m_state = STATE_STOP;
    // TODO
}

void U_SystemStat__ind(unsigned char byte)
{
    // TODO:
}


void device_prog_mode_change(bool newvalue)
{
    printf((newvalue) ? ("Mode Prog: ON\n") : ("Mode Prog: OFF\n"));
    HAL_GPIO_WritePin(KNX_PROG_LED_GPIO_Port, KNX_PROG_LED_Pin,
                      (newvalue) ? (GPIO_PIN_SET) : (GPIO_PIN_RESET));
}

uint32_t millis() {
    return HAL_GetTick();
}

void recive_from_controler(unsigned char byte)
{
    if(htim6.Instance->CR1 && TIM_CR1_CEN)
    {
        HAL_TIM_Base_Stop(&htim6);
    }
    m_recive_msg[m_rx_index++] = byte;

#ifdef DEBUG
    console_print_hex(byte);
    console_print_char(' ');
#endif

    /* DLL (LAYER 2) SERVICES (DEVICE IS TRANSPARENT) */
    if((m_recive_msg[0] & 0xD3) == 0x90)
    {
        __HAL_TIM_SET_COUNTER(&htim6, 1);
        HAL_TIM_Base_Start_IT(&htim6);
        return;
    }
    else if((m_recive_msg[0] & 0xD3) == 0x10)
    {
        __HAL_TIM_SET_COUNTER(&htim6, 1);
        HAL_TIM_Base_Start_IT(&htim6);
        return;
    }
    else if(m_recive_msg[0] == 0xF0)
    {
        /* TODO */
        printf("TODO: recive_from_controler %i\n", __LINE__);
        //L_Poll_Data__ind(&m_recive_msg[1], m_rx_index - 1);
    }
    /*  ACKNOWLEDGE SERVICES (DEVICE IS TRANSPARENT IN BUS MONITOR MODE) */
    else if((m_recive_msg[0] & 0x33) == 0x00)
    {
        //L_Ackn__ind(m_recive_msg[0]);
    }
    else if((m_recive_msg[0] & 0x7F) == 0x0B)
    {
        // TODO: L_Data__con(m_recive_msg[0] & 0x80 >> 7);
        printf("TODO: recive_from_controler %i\n", __LINE__);
    }
    /*  CONTROL SERVICES – DEVICE SPECIFIC */
    else if(m_recive_msg[0] == 0x03)
    {
        U_Reset__ind();
    }
    else if((m_recive_msg[0] & 0x07) == 0x07)
    {
        U_State__ind(
            m_recive_msg[0] & 0x80 >> 7,
            m_recive_msg[0] & 0x40 >> 6,
            m_recive_msg[0] & 0x20 >> 5,
            m_recive_msg[0] & 0x10 >> 4,
            m_recive_msg[0] & 0x08 >> 3
        );
    }
    else if((m_recive_msg[0] & 0x17) == 0x13)
    {
        U_FrameState__ind(
            m_recive_msg[0] & 0x80 >> 7,
            m_recive_msg[0] & 0x40 >> 6,
            m_recive_msg[0] & 0x20 >> 5/*,
            m_recive_msg[0] & 0x08 >> 3*/
        );
    }
    else if((m_recive_msg[0] & 0x83) == 0x01)
    {
        U_Configure__ind(
            m_recive_msg[0] & 0x20 >> 5,
            m_recive_msg[0] & 0x10 >> 4,
            m_recive_msg[0] & 0x08 >> 3,
            m_recive_msg[0] & 0x04 >> 2
        );
    }
    else if(m_recive_msg[0] == 0xCB)
    {
        U_FrameEnd__ind();
    }
    else if(m_recive_msg[0] == 0x2B)
    {
        U_StopMode__ind();
    }
    if(m_recive_msg[0] == 0x4B)
    {
        U_SystemStat__ind(m_recive_msg[1]);
    }

    /* Ready for next frame */
    m_rx_index = 0;
}

void EOF_TIMER_PeriodElapsedCallback(TIM_HandleTypeDef* htim)
{
    if(htim == &htim6)
    {
        if(htim6.Instance->CR1 && TIM_CR1_CEN)
        {
#ifdef DEBUG
            console_print_string("/\r\n");
#endif
            HAL_TIM_Base_Stop(&htim6);
            __HAL_TIM_SET_COUNTER(&htim6, 1);

            if((m_recive_msg[0] & 0xD3) == 0x90)
            {
                /* Standard Frame recived */
                L_Data__ind(
                    1,
                    ((m_recive_msg[5] & 0x80) >> 7),
                    ((m_recive_msg[3] << 8) | m_recive_msg[4]),
                    ((m_recive_msg[0] & 0x80) >> 7),
                    &m_recive_msg[5],
                    (m_recive_msg[5] & 0x0F) + 2,
                    (m_recive_msg[0] & 0x0C) >> 2,
                    ((m_recive_msg[1] << 8) | m_recive_msg[2])
                );
            }

            m_rx_index = 0;
        }
    }
}



void NCN5130_RxCpltCallback(UART_HandleTypeDef *huart)
{
    if(huart == &huart1)
    {
        recive_from_controler(m_rx_byte);
        if(HAL_UART_Receive_IT(&huart1, (unsigned char *)(&m_rx_byte), 1) != HAL_OK)
        {
            printf("!!! Error on start_next_telegram, Can't HAL_UART_Receive_IT in start_tpuart_reception\n");
        }
    }
}

void NCN5130_TxCpltCallback(UART_HandleTypeDef *huart)
{
    Ph_Data__con(p_ok);
}

void Ph_Init(void)
{
    MX_TIM6_Init();
    MX_USART1_UART_Init();

    htim6.PeriodElapsedCallback = EOF_TIMER_PeriodElapsedCallback;
    huart1.RxCpltCallback = NCN5130_RxCpltCallback;
    huart1.TxCpltCallback = NCN5130_TxCpltCallback;

    __HAL_TIM_SET_COUNTER(&htim6, 1);
    HAL_TIM_Base_Start_IT(&htim6); /* Don't understand why we need this */

    while(HAL_GPIO_ReadPin(KNX_SAVEB_GPIO_Port, KNX_SAVEB_Pin) == 0)
    {
        // Wait for SAVEB
    }

    /* Start UART Reader */
    if(HAL_UART_Receive_IT(&huart1, (unsigned char *)(&m_rx_byte), 1) != HAL_OK)
    {
        printf("!!! Error on tpuart_usart_setup, Can't HAL_UART_Receive_IT in start_tpuart_reception\n");
    }
}

void Ph_Loop(void)
{
    static bool knx_btn_state = false;

    if (HAL_GPIO_ReadPin(KNX_PROG_BTN_GPIO_Port, KNX_PROG_BTN_Pin) == GPIO_PIN_RESET)
    {
        if (!knx_btn_state)
        {
            knx_btn_state = true;
            device_prog_mode_set(!device_prog_mode());
        }
    }
    else
    {
        if (knx_btn_state)
        {
            knx_btn_state = false;
        }
    }
}

void Ph_Reset__req()
{
    U_Reset__req();
}


void Ph_Data__con(P_Status p_status)
{
    console_print_char('+');
    L_Data__con(0,0,0,0,0,0,0,l_ok);
}

void Ph_Data__req(Ph_Data_Req_Class p_class, uint8_t p_data)
{
    /* Since NCN5130 Buffering of Sent Data Frames, consider always free*/
    /* Start to transmit first byte */
    switch(p_class)
    {
        case Req_start_of_Frame:
        case Req_inner_Frame_char:
            /* TODO:
             * Send a Byte to the Bus,
             * when it's OK, call Ph_Data__Confirm
             * Ph_Data__Confirm will send the next one
             */
            m_send_msg[0] = p_data;
            m_need_confirmation = true;
            console_print_char('>');
            console_print_hex(p_data);
            HAL_UART_Transmit_IT(&huart1, &m_send_msg[0], 1);
            break;
        case Req_ack_char:
            U_Ackn__req(/* nack */ true, /* busy */ false, /* addressed */ true);
            break;
        case Req_poll_data_char:
            /* TODO */
            break;
        case Req_fill_char:
            /* TODO */
            break;
    }
}
