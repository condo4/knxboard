#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>



static void setup_knx_led(void)
{
	rcc_periph_clock_enable(KNXGPIOLED_RCC);
	gpio_mode_setup(KNXGPIOLED_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, KNXGPIOLED_PIN);
}

static void setup_debug_uart(void)
{
	rcc_periph_clock_enable(KNXGPIOLED_RCC);
	gpio_mode_setup(KNXGPIOLED_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, KNXGPIOLED_PIN);
}



int main(void) {
	setup_knx_led();

	while(1) {
		/* wait a little bit */
		for (int i = 0; i < LITTLE_BIT * 10; i++) {
			__asm__("nop");
		}
		gpio_set(KNXGPIOLED_PORT, KNXGPIOLED_PIN);
		for (int i = 0; i < LITTLE_BIT / 2; i++) {
			__asm__("nop");
		}
		gpio_clear(KNXGPIOLED_PORT, KNXGPIOLED_PIN);
	}
}
