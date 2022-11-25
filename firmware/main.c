#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>

int main(void) {
	rcc_periph_clock_enable(RCC_GPIOB);
	gpio_mode_setup(KNXGPIOLED_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, KNXGPIOLED_PIN);
	gpio_set(KNXGPIOLED_PORT, KNXGPIOLED_PIN);
	while(1) {
		/* wait a little bit */
		for (int i = 0; i < LITTLE_BIT; i++) {
			__asm__("nop");
		}
		gpio_toggle(KNXGPIOLED_PORT, KNXGPIOLED_PIN);
	}
}
