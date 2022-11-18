#include <stdbool.h>

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



/* SERVICES FROM HOST CONTROLLER */
void send_to_controler(size_t size)
{
    // TODO
}

void U_Reset__req()
{
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
    m_send_msg[4] = state;
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

/*  SERVICES TO HOST CONTROLLER */

/*      DLL (LAYER 2) SERVICES (DEVICE IS TRANSPARENT) */
void L_Data_Standard__ind(bool not_repeted, unsigned char priority, unsigned char *data, unsigned char size)
{

}

void L_Data_Extended__ind(bool not_repeted, unsigned char priority, unsigned char *data, unsigned char size)
{

}

void L_Poll_Data__ind(unsigned char *data, unsigned char size)
{

}

/*      ACKNOWLEDGE SERVICES (DEVICE IS TRANSPARENT IN BUS MONITOR MODE) */
void L_Ackn__ind(unsigned char ack)
{

}

void L_Data__con(bool confirmation)
{

}

/*      CONTROL SERVICES – DEVICE SPECIFIC */

void U_Reset__ind() // Called from hardware
{
    m_state = STATE_NORMAL;
    // TODO
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

void unsigned char recive_frame_size()
{
    if(m_recive_msg[0] & 0x01 == 0x01)
    {
        /* Not L_Data, L_Poll nor L_Ackn */
        if(m_recive_msg[0] == 0x4B)
        {
            /* U_SystemStat.ind */
            return 2;
        }
        else
        {
            return 1;
        }
    }
    else if(m_recive_msg[0] & 0x10 == 0x00)
    {
        /* L_Ackn */
        return 1;
    }
    else if(m_recive_msg[0] == 0xF0)
    {
        /* L_Poll_Data.ind */
        // TODO
        return 0;
    }
    else if(m_recive_msg[0] & 0x80 == 0x80)
    {
        /* L_Data_Standard.ind */
        // TODO
        return 0;
    }
    else
    {
        /* L_Data_Extended.ind */
        // TODO
        return 0;
    }
}


void recive_from_controler(unsigned char byte)
{
    m_recive_msg[m_rx_index++] = byte;
    /* Just check if we need to ACK */
    if(m_rx_index == 4) //TODO
    {
        // TODO
        U_Ackn__req(/* nack */ true, /* busy */ false, /* addressed */ true);
    }

    if(m_rx_index < recive_frame_size())
    {
        /* Wait for more bytes */
        return;
    }

    /* Frame is complete */
    /*      DLL (LAYER 2) SERVICES (DEVICE IS TRANSPARENT) */
    if(m_recive_msg[0] & 0xD3 == 0x90)
    {
        L_Data_Standard__ind((m_recive_msg[0] & 0x20) >> 5, (m_recive_msg[0] & 0x0C) >> 2, &m_recive_msg[1], m_rx_index - 1);
    }
    else if(m_recive_msg[0] & 0xD3 == 0x10)
    {
        L_Data_Extended__ind((m_recive_msg[0] & 0x20) >> 5, (m_recive_msg[0] & 0x0C) >> 2, &m_recive_msg[1], m_rx_index - 1);
    }
    else if(m_recive_msg[0] == 0xF0)
    {
        L_Poll_Data__ind(m_recive_msg[1], m_rx_index - 1);
    }
    /*  ACKNOWLEDGE SERVICES (DEVICE IS TRANSPARENT IN BUS MONITOR MODE) */
    else if(m_recive_msg[0] & 0x33 == 0x00)
    {
        L_Ackn__ind(m_recive_msg[0]);
    }
    else if(m_recive_msg[0] & 0x7F == 0x0B)
    {
        L_Data__con(m_recive_msg[0] & 0x80 >> 7);
    }
    /*  CONTROL SERVICES – DEVICE SPECIFIC */
    else if(m_recive_msg[0] == 0x03)
    {
        U_Reset__ind();
    }
    else if(m_recive_msg[0] & 0x07 == 0x07)
    {
        U_State__ind(
            m_recive_msg[0] & 0x80 >> 7,
            m_recive_msg[0] & 0x40 >> 6,
            m_recive_msg[0] & 0x20 >> 5,
            m_recive_msg[0] & 0x10 >> 4,
            m_recive_msg[0] & 0x08 >> 3,
        );
    }
    else if(m_recive_msg[0] & 0x17 == 0x13)
    {
        U_FrameState__ind(
            m_recive_msg[0] & 0x80 >> 7,
            m_recive_msg[0] & 0x40 >> 6,
            m_recive_msg[0] & 0x20 >> 5,
            m_recive_msg[0] & 0x08 >> 3,
        );
    }
    else if(m_recive_msg[0] & 0x83 == 0x01)
    {
        U_Configure__ind(
            m_recive_msg[0] & 0x20 >> 5,
            m_recive_msg[0] & 0x10 >> 4,
            m_recive_msg[0] & 0x08 >> 3,
            m_recive_msg[0] & 0x04 >> 2,
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
