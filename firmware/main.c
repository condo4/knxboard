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
    HAL_Init();
    MX_DMA_Init();
    MX_USART1_UART_Init();
    MX_USART2_UART_Init();
    SystemClock_Config();
    MX_GPIO_Init();
    MX_ADC1_Init();
    
    while (1){
    }
}
