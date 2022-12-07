MCU=STM32L432
#MCU=STM32G491


PREFIX?=arm-none-eabi-
CC=$(PREFIX)gcc
OBJCOPY=$(PREFIX)objcopy
OD=bin
TARGETS=stm32/$(MCUTYPE)

include Scripts/$(MCU).mk

all: outdir $(OD)/stm32/knxboard.elf $(OD)/stm32/knxboard.bin $(OD)/stm32/knxboard.hex

SFLAGS= --static -nostartfiles -std=c11 -g3 -Os
SFLAGS+= -fno-common -ffunction-sections -fdata-sections
SFLAGS+= -I./libopencm3/include -L./libopencm3/lib
LFLAGS+=-Wl,--start-group -lc -lgcc -lnosys -Wl,--end-group
LFLAGS+= -DKNXGPIOLED_PIN=$(KNXGPIOLED_PIN) -DKNXGPIOLED_PORT=$(KNXGPIOLED_PORT) -DKNXGPIOLED_RCC=$(KNXGPIOLED_RCC)
M4FH_FLAGS= $(SFLAGS) -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16

$(OD)/stm32/knxboard.elf: main.c libopencm3/lib/libopencm3_stm32$(MCUTYPE).a
	@echo "  stm32$(MCUTYPE) -> Creating $(OD)/stm32/knxboardv4.elf"
	$(CC) $(M4FH_FLAGS) -D$(MCUFLAG) -DLITTLE_BIT=$(MCULITTLE_BIT) $(LFLAGS) main.c -T Scripts/$(MCULDSCRIPT) -lopencm3_stm32$(MCUTYPE) -o $(OD)/stm32/knxboard.elf  -Xlinker -Map=$(OD)/stm32/knxboard.map
	$(PREFIX)size $(OD)/stm32/knxboard.elf

libopencm3/Makefile:
	@echo "Initializing libopencm3 submodule"
	git submodule update --init

libopencm3/lib/libopencm3_%.a: libopencm3/Makefile
	$(MAKE) TARGETS="$(TARGETS)" -C libopencm3

%.bin: %.elf
	@#printf "  OBJCOPY $(*).bin\n"
	$(OBJCOPY) -Obinary $(*).elf $(*).bin

%.hex: %.elf
	@#printf "  OBJCOPY $(*).hex\n"
	$(OBJCOPY) -Oihex $(*).elf $(*).hex

outdir:
	mkdir -p $(OD)/stm32

clean:
	rm -fr bin
	$(MAKE) TARGETS="$(TARGETS)" -C libopencm3 clean

install: outdir $(OD)/stm32/knxboard.elf $(OD)/stm32/knxboard.bin $(OD)/stm32/knxboard.hex
	st-flash write bin/stm32/knxboard.bin 0x8000000
	st-flash reset

.PHONY: realall.really outdir clean all
$(V).SILENT:
