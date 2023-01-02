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

int main(void){
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

    while (1){
        if(HAL_GetTick() > (last_tick + 1000) || last_tick >  HAL_GetTick()) /* Meas each 1s */
        {
            last_tick = HAL_GetTick();
            HAL_GPIO_TogglePin(KNX_PROG_LED_GPIO_Port, KNX_PROG_LED_Pin);
            printf("Tick: %i\n", last_tick / 1000);
        }
    }
}
