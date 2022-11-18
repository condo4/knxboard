PREFIX?=arm-none-eabi-
CC=$(PREFIX)gcc
OBJCOPY=$(PREFIX)objcopy
OD=bin
TARGETS = stm32/g4

all: realall.really

SFLAGS= --static -nostartfiles -std=c11 -g3 -Os
SFLAGS+= -fno-common -ffunction-sections -fdata-sections
SFLAGS+= -I./libopencm3/include -L./libopencm3/lib
LFLAGS+=-Wl,--start-group -lc -lgcc -lnosys -Wl,--end-group

M4FH_FLAGS= $(SFLAGS) -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16

BOARDS_ELF+=$(OD)/stm32/knxboardv4.elf
BOARDS_BIN+=$(OD)/stm32/knxboardv4.bin
BOARDS_HEX+=$(OD)/stm32/knxboardv4.hex
$(OD)/stm32/knxboardv4.elf: main.c libopencm3/lib/libopencm3_$(5).a
	@echo "  $(5) -> Creating $(OD)/stm32/knxboardv4.elf"
	$(CC) -DRCC_LED1=RCC_GPIOB -DPORT_LED1=GPIOB -DPIN_LED1=GPIO3 \
		$(M4FH_FLAGS) -DSTM32G4 -DLITTLE_BIT=400000 $(LFLAGS) main.c -T ld.STM32G491 -lopencm3_stm32g4 -o $(OD)/stm32/knxboardv4.elf

realall.really: outdir $(BOARDS_ELF) $(BOARDS_BIN) $(BOARDS_HEX)

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
	$(RM) $(BOARDS_ELF) $(BOARDS_BIN) $(BOARDS_HEX)
	$(MAKE) TARGETS="$(TARGETS)" -C libopencm3 clean

.PHONY: realall.really outdir clean all
$(V).SILENT:
