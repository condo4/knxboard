#include <main.h>
#include <main.c>
#include <stdio.h>
#include <errno.h>
#include <sys/unistd.h>

int _write(int file, char *ptr, int len)
{
    static const char ret = '\r';
    if (file == STDOUT_FILENO || file == STDERR_FILENO)
    {
        int i = 0;
        for (i = 0; i < len; i++)
        {
            if (ptr[i] == '\n')
            {
                HAL_UART_Transmit(&huart2, &ret, 1, HAL_MAX_DELAY);
            }
            HAL_UART_Transmit(&huart2, &ptr[i], 1, HAL_MAX_DELAY);
        }
        return i;
    }
    errno = EIO;
    return -1;
}


static unsigned char rx_byte;
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
    printf("> 0x%x\n", rx_byte);
    if(HAL_UART_Receive_IT(&huart1, (unsigned char *)(&rx_byte), 1) != HAL_OK)
    {
        printf("!!! Error on start_next_telegram, Can't HAL_UART_Receive_IT in start_tpuart_reception\n");
    }
}

int main(void){
    static const uint8_t reset_service = 0x1;
    static const uint8_t state_service = 0xD;
    static uint32_t last_tick = 0;
    static const uint8_t buffer[] = "A";
    HAL_Init();
    SystemClock_Config();
    //MX_DMA_Init();
    MX_USART1_UART_Init();
    MX_USART2_UART_Init();
    MX_GPIO_Init();
    //MX_ADC1_Init();


    HAL_GPIO_WritePin(KNX_PROG_LED_GPIO_Port, KNX_PROG_LED_Pin, GPIO_PIN_SET);
    printf("state: %i %i: ", HAL_GPIO_ReadPin(KNX_RESETB_GPIO_Port, KNX_RESETB_Pin), HAL_GPIO_ReadPin(KNX_SAVEB_GPIO_Port, KNX_SAVEB_Pin));

    if(HAL_UART_Receive_IT(&huart1, (unsigned char *)(&rx_byte), 1) != HAL_OK)
    {
        printf("!!! Error on tpuart_usart_setup, Can't HAL_UART_Receive_IT in start_tpuart_reception\n");
    }

    //printf("reset: ");
    //HAL_UART_Transmit(&huart1, &reset_service, 1, HAL_MAX_DELAY);


    while (1){
        if(HAL_GetTick() > (last_tick + 1000) || last_tick >  HAL_GetTick()) /* Meas each 1s */
        {
            printf("state: %i %i: ", HAL_GPIO_ReadPin(KNX_RESETB_GPIO_Port, KNX_RESETB_Pin), HAL_GPIO_ReadPin(KNX_SAVEB_GPIO_Port, KNX_SAVEB_Pin));
            //HAL_UART_Transmit(&huart1, &state_service, 1, HAL_MAX_DELAY);

            last_tick = HAL_GetTick();
            HAL_GPIO_TogglePin(KNX_PROG_LED_GPIO_Port, KNX_PROG_LED_Pin);
            printf("Tick: %i\n", last_tick / 1000);
        }
    }
}
