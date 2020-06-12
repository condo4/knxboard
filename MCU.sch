EESchema Schematic File Version 4
LIBS:KnxBoard-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_ST_STM32L4:STM32L432KCUx U1
U 1 1 5EC6C522
P 4550 2800
F 0 "U1" H 4550 3250 50  0000 C CNN
F 1 "STM32L432KCUx" V 4550 2750 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-32-1EP_5x5mm_P0.5mm_EP3.45x3.45mm" H 4150 1900 50  0001 R CNN
F 3 "https://www.mouser.fr/ProductDetail/STMicroelectronics/STM32L432KCU6?qs=dTJS0cRn7oiybcTRwI97Tw%3D%3D" H 4550 2800 50  0001 C CNN
F 4 "4.85" H 4550 2800 50  0001 C CNN "Price"
	1    4550 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5EC6D407
P 3550 1250
F 0 "C3" H 3665 1296 50  0000 L CNN
F 1 "47uF" H 3665 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3588 1100 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Taiyo-Yuden/LMK212BBJ476MG-T?qs=sGAEpiMZZMvsSlwiRhF8qqz126ahU0Dj1uiGAU4j4%2FSwQwkmd0IxEg%3D%3D" H 3550 1250 50  0001 C CNN
F 4 "3.3V" H 3550 1250 50  0001 C CNN "Rating"
F 5 "0.82" H 3550 1250 50  0001 C CNN "Price"
	1    3550 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5EC6D9F1
P 4050 1250
F 0 "C4" H 4165 1296 50  0000 L CNN
F 1 "100nF" H 4165 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4088 1100 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/AVX/06035G104ZAT2A?qs=sGAEpiMZZMvsSlwiRhF8qtXiuYMmFthM6IJ8r2mw%252BQI%3D" H 4050 1250 50  0001 C CNN
F 4 "3.3V" H 4050 1250 50  0001 C CNN "Rating"
F 5 "0.09" H 4050 1250 50  0001 C CNN "Price"
	1    4050 1250
	1    0    0    -1  
$EndComp
Text HLabel 900  1100 0    50   Input ~ 0
VDD_3.3V
Wire Wire Line
	4450 1100 4550 1100
Connection ~ 4450 1100
$Comp
L power:+3V3 #PWR3.3V04
U 1 1 5EC7DA8A
P 3800 1100
F 0 "#PWR3.3V04" H 3800 950 50  0001 C CNN
F 1 "+3V3" H 3815 1273 50  0000 C CNN
F 2 "" H 3800 1100 50  0001 C CNN
F 3 "" H 3800 1100 50  0001 C CNN
	1    3800 1100
	1    0    0    -1  
$EndComp
Text HLabel 900  3800 0    50   Input ~ 0
GND
$Comp
L power:GND #PWR05
U 1 1 5EC8AE4D
P 4550 3900
F 0 "#PWR05" H 4550 3650 50  0001 C CNN
F 1 "GND" H 4555 3727 50  0000 C CNN
F 2 "" H 4550 3900 50  0001 C CNN
F 3 "" H 4550 3900 50  0001 C CNN
	1    4550 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3800 4550 3800
Wire Wire Line
	4550 3800 4550 3900
Connection ~ 4550 3800
Wire Wire Line
	4550 3800 4650 3800
Connection ~ 3550 1100
Connection ~ 4050 1100
Connection ~ 3800 1100
Wire Wire Line
	4050 1100 4450 1100
Wire Wire Line
	3800 1100 4050 1100
Wire Wire Line
	3550 1100 3800 1100
$Comp
L Device:L L1
U 1 1 5EC8F987
P 4650 1500
F 0 "L1" H 4703 1546 50  0000 L CNN
F 1 "33uH" H 4703 1455 50  0000 L CNN
F 2 "Inductor_SMD:L_Taiyo-Yuden_NR-40xx" H 4650 1500 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/?qs=PzICbMaShUcIK8Guk0jpFw%3D%3D" H 4650 1500 50  0001 C CNN
F 4 "Ir > 150mA Isat > 550mA" H 4650 1500 50  0001 C CNN "Rating"
F 5 "0.41" H 4650 1500 50  0001 C CNN "Price"
F 6 "L" H 4650 1500 50  0001 C CNN "STKNX"
	1    4650 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1100 4650 1100
Wire Wire Line
	4650 1100 4650 1350
Connection ~ 4550 1100
Text HLabel 5050 2100 2    50   BiDi ~ 0
PA0
Text HLabel 5050 2200 2    50   BiDi ~ 0
PA1
Text HLabel 5050 2300 2    50   Output ~ 0
UART_TX
Text HLabel 5050 2400 2    50   BiDi ~ 0
PA3
Text HLabel 5050 2500 2    50   BiDi ~ 0
PA4
Text HLabel 5050 2600 2    50   BiDi ~ 0
PA5
Text HLabel 5050 2700 2    50   BiDi ~ 0
PA6
Text HLabel 5050 2800 2    50   BiDi ~ 0
PA7
Text HLabel 5050 2900 2    50   Input ~ 0
KNX_RX
Text HLabel 5050 3000 2    50   Output ~ 0
KNX_TX
Text HLabel 5050 3100 2    50   Input ~ 0
KNX_OK
Text HLabel 5050 3200 2    50   Input ~ 0
VCC_OK
Text HLabel 5050 3300 2    50   Input ~ 0
KNX_PROG_BTN
Text HLabel 5050 3400 2    50   BiDi ~ 0
SWDIO
Text HLabel 5050 3500 2    50   Input ~ 0
SWCLK
Text HLabel 5050 3600 2    50   Input ~ 0
UART_RX
Text HLabel 4050 3600 0    50   BiDi ~ 0
PB7
$Comp
L Switch:SW_Push SW2
U 1 1 5EC962DB
P 3200 2300
F 0 "SW2" V 3154 2448 50  0000 L CNN
F 1 "SW" V 3245 2448 50  0000 L CNN
F 2 "Button_Switch_SMD:SW_SPST_SKQG_WithStem" H 3200 2500 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/ALPS/SKQGABE010?qs=N5Jky1br14NGdH0AMYxewQ%3D%3D" H 3200 2500 50  0001 C CNN
F 4 "0.5" H 3200 2300 50  0001 C CNN "Price"
	1    3200 2300
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 5EC9714F
P 2750 2300
F 0 "C2" H 2865 2346 50  0000 L CNN
F 1 "100nF" H 2865 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2788 2150 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/AVX/06035G104ZAT2A?qs=sGAEpiMZZMvsSlwiRhF8qtXiuYMmFthM6IJ8r2mw%252BQI%3D" H 2750 2300 50  0001 C CNN
F 4 "3.3V" H 2750 2300 50  0001 C CNN "Rating"
F 5 "0.09" H 2750 2300 50  0001 C CNN "Price"
	1    2750 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2100 3200 2100
Wire Wire Line
	3200 2100 2750 2100
Wire Wire Line
	2750 2100 2750 2150
Connection ~ 3200 2100
Wire Wire Line
	2750 2450 2750 2500
Wire Wire Line
	2750 2500 3200 2500
Wire Wire Line
	2750 2500 2550 2500
Wire Wire Line
	2550 2500 2550 1650
Wire Wire Line
	2550 1650 3550 1650
Wire Wire Line
	3550 1650 3550 1400
Connection ~ 2750 2500
Text HLabel 4050 3500 0    50   BiDi ~ 0
PB6
Text HLabel 4050 3400 0    50   BiDi ~ 0
PB5
Text HLabel 4050 3300 0    50   BiDi ~ 0
PB4
Text HLabel 4050 3200 0    50   BiDi ~ 0
KNX_PROG_LED
Text HLabel 4050 3100 0    50   BiDi ~ 0
PB1
Text HLabel 4050 3000 0    50   BiDi ~ 0
PB0
$Comp
L Oscillator:SG-3030CM X1
U 1 1 5EC9AF36
P 2100 2700
F 0 "X1" H 1871 2746 50  0000 R CNN
F 1 "SG-3030CM" H 1871 2655 50  0000 R CNN
F 2 "Oscillator:Oscillator_SMD_SeikoEpson_SG3030CM" H 2100 2350 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Epson-Timing/SG-3030CM-327680KBROHS?qs=sFmtmVcT%2FfvMvdzcXdd8BQ%3D%3D" H 2000 2700 50  0001 C CNN
F 4 "1.32" H 2100 2700 50  0001 C CNN "Price"
	1    2100 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2700 2400 2700
Wire Wire Line
	2550 2500 2550 3000
Wire Wire Line
	2550 3000 2100 3000
Connection ~ 2550 2500
Wire Wire Line
	2550 3800 2550 3000
Connection ~ 4450 3800
Wire Wire Line
	4450 3800 2550 3800
Connection ~ 2550 3000
Wire Wire Line
	900  3800 2550 3800
Connection ~ 2550 3800
Wire Wire Line
	900  1100 2200 1100
Connection ~ 2200 1100
Wire Wire Line
	2200 1100 3550 1100
Wire Wire Line
	2000 2400 2000 2300
Wire Wire Line
	2000 2300 2200 2300
Wire Wire Line
	2200 2300 2200 1100
Text HLabel 4050 2800 0    50   BiDi ~ 0
PC15
Wire Wire Line
	3550 1650 4050 1650
Wire Wire Line
	4050 1650 4050 1400
Connection ~ 3550 1650
$Comp
L Device:R R2
U 1 1 5ECAF689
P 3650 2500
F 0 "R2" V 3443 2500 50  0000 C CNN
F 1 "10K" V 3534 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3580 2500 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Vishay-Dale/CRCW040210K0FKEDC?qs=sGAEpiMZZMvdGkrng054t0DrEhLhGh8ghRTPC4LoFoV0V5heIyAs3Q%3D%3D" H 3650 2500 50  0001 C CNN
F 4 "0.09" H 3650 2500 50  0001 C CNN "Price"
	1    3650 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 2500 4050 2500
Connection ~ 3200 2500
Wire Wire Line
	3200 2500 3500 2500
Text HLabel 3200 2000 1    50   Input ~ 0
Reset
Wire Wire Line
	3200 2000 3200 2100
Wire Wire Line
	2200 2300 2200 2400
Connection ~ 2200 2300
Wire Wire Line
	4650 1650 4650 1900
Wire Wire Line
	4550 1100 4550 1900
Wire Wire Line
	4450 1100 4450 1900
$EndSCHEMATC
