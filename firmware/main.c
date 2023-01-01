#include <main.h>
#include <main.c>

void _close(void)
{
}

void _lseek(void)
{

}
void _read(void)
{
}
void _write(void)
{
}

int main(void){
    static uint32_t last_tick = 0;
    HAL_Init();
    MX_DMA_Init();
    MX_USART1_UART_Init();
    MX_USART2_UART_Init();
    SystemClock_Config();
    MX_GPIO_Init();
    MX_ADC1_Init();
    
    HAL_GPIO_WritePin(KNX_PROG_LED_GPIO_Port, KNX_PROG_LED_Pin, GPIO_PIN_SET);
    
    while (1){
        
        if(HAL_GetTick() > (last_tick + 500) || last_tick >  HAL_GetTick())/* Meas each 5s */
        {
            last_tick = HAL_GetTick();
            HAL_GPIO_TogglePin(KNX_PROG_LED_GPIO_Port, KNX_PROG_LED_Pin);
        }
    }
}
