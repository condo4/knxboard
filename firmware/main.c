#include <main.h>
#include <main.c>
#include <stdio.h>
#include <stdbool.h>
#include <errno.h>
#include <sys/unistd.h>
#include <knx_stack.h>
#include <object_device.h>
#include <console.h>




int main(void)
{
    static uint32_t last_tick = 0;
    HAL_Init();
    MX_GPIO_Init();

    console_init();
    knx_init();

    SystemClock_Config(); /* Switch to HSE clock only when phy is ready */

    uint16_t addr = device_induvidual_address();
    printf("\n\n/// Start KnxBoard %s %s %i.%i.%i \\\\\\\n", __DATE__, __TIME__, addr >> 12, (addr >> 8) & 0x0F, addr & 0xFF);


    while (1){
        knx_loop();

        if(HAL_GetTick() > (last_tick + 1000) || last_tick >  HAL_GetTick()) /* Meas each 1s */
        {
            last_tick = HAL_GetTick();
            //printf("Tick: %i\n", last_tick / 1000);
        }
    }
}
