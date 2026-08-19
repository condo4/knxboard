# KnxBoard

A compact 4-layer PCB that connects an STM32 microcontroller to the KNX home automation bus via the NCN5130 transceiver IC.

## Overview

KnxBoard integrates an STM32G491KEU6 (ARM Cortex-M4, 170 MHz) with an NCN5130MNTWG KNX TP transceiver. The NCN5130 handles the KNX physical and MAC layers and provides on-board power regulation from the KNX bus voltage, so the board requires no external power supply when connected to a KNX installation.

**Board version:** V5.0  
**PCB size:** 35.75 × 33.75 mm, 4 layers, 1.6 mm thickness  
**Manufactured by:** JLCPCB

## Key Components

| Reference | Part | Description |
|-----------|------|-------------|
| IC1 | STM32G491KEU6 | ARM Cortex-M4, 170 MHz, 512 KB Flash, 112 KB SRAM, UFQFPN32 |
| IC2 | NCN5130MNTWG | KNX certified TP transceiver (TP1-256), 9600 Bd, integrated DC-DC |
| Y1 | 16 MHz crystal | MCU clock source |
| D1 | SS16T3G | Schottky diode |
| D2 | SMAJ40CA | 40 V bidirectional TVS, KNX bus protection |
| D3 | LED | KNX programming indicator |
| SW1 | Push button | KNX programming button |

## Connectors

| Reference | Function |
|-----------|----------|
| J1 | KNX bus (2-pin) |
| J2 | SWD debug/programming (2×3) |
| J3 | RS485 / 1-Wire interface (10-pin) |
| J4 | Auxiliary / expansion (10-pin) |

## MCU Pin Assignment

| Signal | Pin | Peripheral | Description |
|--------|-----|------------|-------------|
| KNX_TX | PA2 | LPUART1_TX | KNX data transmit to NCN5130 |
| KNX_RX | PA3 | LPUART1_RX | KNX data receive from NCN5130 |
| KNX_PROG_BTN | PA0 | GPIO_Input | Programming mode button |
| KNX_SAVEB | PA1 | GPIO_Input | Save-B input from NCN5130 |
| KNX_PROG_LED | PF1 | GPIO_Output | Programming mode LED |
| RS437/W1_TX | PA9 | USART1_TX | RS485 / 1-Wire transmit |
| RS437/W1_RX | PA10 | USART1_RX | RS485 / 1-Wire receive |
| DEBUG_TX | PB3 | USART2_TX | Debug UART transmit |
| DEBUG_RX | PA15 | USART2_RX | Debug UART receive |
| SWDIO | PA13 | SYS_JTMS | SWD data |
| SWCLK | PA14 | SYS_JTCK | SWD clock |

ADC2 monitors internal signals (bus voltage/current supervision via NCN5130).

## Power Architecture

The NCN5130 converts KNX bus voltage (21–29 V DC) internally:

- **DC-DC1:** Fixed 3.3 V — powers the STM32 and board logic
- **DC-DC2:** Adjustable 1.2–21 V — configurable auxiliary rail
- **Linear regulator:** 20 V — internal NCN5130 supply

The board draws up to 40 mA from the KNX bus.

## PCB Stackup

| Layer | Function |
|-------|----------|
| F.Cu | Signal + components (all 44 footprints on front) |
| In1.Cu | Ground plane |
| In2.Cu | Power plane (3.3 V / 12 V) |
| B.Cu | Signal |

## Firmware

The `CubeMX/` directory contains the STM32CubeMX project (`CubeMX.ioc`) used to generate HAL initialization code.

- **Toolchain:** GCC / Makefile
- **HAL package:** STM32Cube FW_G4 V1.5.1
- **Active peripherals:** LPUART1 (KNX), USART1 (RS485/1-Wire), USART2 (debug), TIM6, ADC2, SWD

## Repository Structure

```
KnxBoard/
├── KnxBoard.kicad_sch       # Schematic
├── KnxBoard.kicad_pcb       # PCB layout
├── KnxBoard.kicad_pro       # KiCad project
├── CubeMX/                  # STM32CubeMX project
│   └── CubeMX.ioc
├── Library.pretty/          # Custom KiCad footprints
│   ├── NCN5130MNTWG.kicad_mod
│   └── STM32G491KEU6.kicad_mod
├── datasheet/               # Component datasheets
├── JLCPCB_KNXBOARD_V5.0_1.zip  # Gerbers / manufacturing files
└── KnxBoard-backups/        # KiCad auto-backups
```

## Tools

- [KiCad 9](https://www.kicad.org/) — schematic and PCB design
- [STM32CubeMX 6.8](https://www.st.com/en/development-tools/stm32cubemx.html) — MCU peripheral configuration
- [STM32CubeIDE](https://www.st.com/en/development-tools/stm32cubeide.html) or `arm-none-eabi-gcc` — firmware build

## References

- [NCN5130 Datasheet](datasheet/NCN5130-D.PDF)
- [STM32G491KE Datasheet](datasheet/STM32G491KE_Datasheet.pdf)
- [STM32G491KE Reference Manual](datasheet/STM32G491KE_RefManual.pdf)
