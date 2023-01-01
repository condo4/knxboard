# BOARD= KNXBOARDV1 KNXBOARDV4 NUCLEOL432
ifndef BOARD
BOARD=KNXBOARDV4
$(info BOARD is not set, use default $(BOARD))
else
$(info BOARD is $(BOARD))
endif

include Core/$(BOARD).mk

PREFIX?=arm-none-eabi-
CC=$(PREFIX)gcc
AS=$(PREFIX)as
SZ=$(PREFIX)size
OBJCOPY=$(PREFIX)objcopy
BUILD_DIR = build
CP = $(PREFIX)objcopy
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S

DEBUG = 1
OPT = -Og
MCU = -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard
C_DEFS = -DUSE_HAL_DRIVER -D$(MCUFLAG) -DBOARD=$(BOARD)
C_INCLUDES = -I$(wildcard Core/$(BOARD)/Core/Inc) -I$(wildcard Core/$(BOARD)/Core/Src) -I$(wildcard Core/$(BOARD)/Drivers/*_HAL_Driver/Inc) -I$(wildcard Core/$(BOARD)/Drivers/CMSIS/Device/ST/*/Include) -I$(wildcard Core/$(BOARD)/Drivers/CMSIS/Include)
AS_INCLUDES = 
ASFLAGS  = $(MCU) $(AS_DEFS) $(AS_INCLUDES)
CFLAGS  += $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT)
CFLAGS  += -Wall -fdata-sections -ffunction-sections
CFLAGS  += -MMD -MP -MF"$(@:%.o=%.d)"
LDSCRIPT = $(wildcard Core/$(BOARD)/*.ld)
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections


SOURCE_CORE  = $(wildcard Core/$(BOARD)/Core/Src/s*.c)
DRIVER_CORE  = $(wildcard Core/$(BOARD)/Drivers/*/Src/*_hal*.c)
MAIN_CORE    = main.c
ASM_SOURCES =  $(wildcard Core/$(BOARD)/startup_s*.s)


OBJECTS  = $(addprefix $(BUILD_DIR)/,$(SOURCE_CORE:.c=.o))
OBJECTS += $(addprefix $(BUILD_DIR)/,$(DRIVER_CORE:.c=.o))
OBJECTS += $(addprefix $(BUILD_DIR)/,$(MAIN_CORE:.c=.o))
ASM_OBJECTS = $(addprefix $(BUILD_DIR)/,$(ASM_SOURCES:.s=.o))
DIRECTORES = $(sort $(dir $(OBJECTS)))

all: $(DIRECTORES) $(OBJECTS) $(BUILD_DIR)/knxboard.elf $(BUILD_DIR)/knxboard.bin $(BUILD_DIR)/knxboard.hex


$(DIRECTORES):
	mkdir -p $@

#all: $(BUILD_DIR) $(BUILD_DIR)/knxboard.elf $(BUILD_DIR)/knxboard.bin $(BUILD_DIR)/knxboard.hex


#vpath %.c $(sort $(dir $(SOURCE_CORE)))
# list of ASM program objects
#OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
#vpath %.s $(sort $(dir $(ASM_SOURCES)))

$(info ASM_OBJECTS $(ASM_OBJECTS))
$(info ASM_SOURCES $(ASM_SOURCES))


$(BUILD_DIR)/%.o: %.c 
	$(CC) -c $(CFLAGS) $< -o $@

$(ASM_OBJECTS): $(ASM_SOURCES) $(DIRECTORES)
	$(AS) -c $(ASFLAGS) $< -o $@


$(BUILD_DIR)/knxboard.elf: $(OBJECTS) $(ASM_OBJECTS) Makefile
	$(info BUILD knxboard.elf)
	$(CC) $(OBJECTS) $(ASM_OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/knxboard.hex: $(BUILD_DIR)/knxboard.elf
	$(info BUILD knxboard.hex)
	$(HEX) $< $@
	
$(BUILD_DIR)/knxboard.bin: $(BUILD_DIR)/knxboard.elf
	$(info BUILD knxboard.bin)
	$(BIN) $< $@

#$(BUILD_DIR)/Core/$(BOARD)/Core/Src/%.o: %.c Makefile | $(BUILD_DIR) 
#	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

#$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
#	$(AS) -c $(CFLAGS) $< -o $@



#SFLAGS= --static -nostartfiles -std=c11 -g3 -Os
#SFLAGS+= -fno-common -ffunction-sections -fdata-sections
#LFLAGS+= -lc -lgcc -lnosys
#CFLAGS= $(SFLAGS) $(C_INCLUDES) -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16

#$(OD)/stm32/knxboard.elf: main.c libopencm3/lib/libopencm3_stm32$(MCUTYPE).a
#	@echo "  stm32$(MCUTYPE) -> Creating $(OD)/stm32/knxboardv4.elf"
#	$(CC) $(M4FH_FLAGS) -D$(MCUFLAG) -DLITTLE_BIT=$(MCULITTLE_BIT) $(LFLAGS) main.c -T Scripts/$(MCULDSCRIPT) -lopencm3_stm32$(MCUTYPE) -o $(OD)/stm32/knxboard.elf  -Xlinker -Map=$(OD)/stm32/knxboard.map
#	$(PREFIX)size $(OD)/stm32/knxboard.elf

#%.bin: %.elf
#	@#printf "  OBJCOPY $(*).bin\n"
#	$(OBJCOPY) -Obinary $(*).elf $(*).bin

#%.hex: %.elf
#	@#printf "  OBJCOPY $(*).hex\n"
#	$(OBJCOPY) -Oihex $(*).elf $(*).hex


clean:
	rm -fr build

install: $(BUILD_DIR)/knxboard.bin
	st-flash write $(BUILD_DIR)/knxboard.bin 0x8000000
	st-flash reset
