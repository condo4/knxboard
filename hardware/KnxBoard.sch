EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "KnxBoard"
Date "2021-11-04"
Rev "3"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_ST_STM32L4:STM32L432KCUx U2
U 1 1 618445E2
P 8550 3600
F 0 "U2" V 8600 3600 50  0000 C CNN
F 1 "STM32L432KCUx" V 8500 3600 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-32-1EP_5x5mm_P0.5mm_EP3.45x3.45mm" H 8150 2700 50  0001 R CNN
F 3 "https://www.mouser.fr/ProductDetail/STMicroelectronics/STM32L432KCU6?qs=sGAEpiMZZMueQxo7L%2FBPyGlkDlHQ8XwjqFkWSLh2yvA%3D" H 8550 3600 50  0001 C CNN
F 4 "5.8" H 8550 3600 50  0001 C CNN "Price"
	1    8550 3600
	1    0    0    -1  
$EndComp
$Comp
L KNX_NCN5130:NCN5130 U1
U 1 1 6184BA14
P 3150 3650
F 0 "U1" H 3550 3850 50  0000 L CNN
F 1 "NCN5130" H 3450 3750 50  0000 L CNN
F 2 "Package_DFN_QFN:QFN-40-1EP_6x6mm_P0.5mm_EP4.6x4.6mm_ThermalVias" H 3500 5300 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/onsemi/NCN5130MNTWG?qs=sGAEpiMZZMsyYdr3R27aV%2FyfBetTZLuYah%252BU%2FGK00PQ%3D" H 3150 3650 50  0001 C CNN
F 4 "7.31" H 3150 3650 50  0001 C CNN "Price"
	1    3150 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:D_TVS_ALT D2
U 1 1 6184D5D5
P 1150 3750
F 0 "D2" V 1150 3830 50  0000 L CNN
F 1 "1SMA40CA" V 1195 3830 50  0001 L CNN
F 2 "Diode_SMD:D_SMA" H 1150 3750 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Bourns/SMAJ40CA?qs=A3H9pljuJ8S9ch8FWCUIag%3D%3D" H 1150 3750 50  0001 C CNN
F 4 "0.3" H 1150 3750 50  0001 C CNN "Price"
	1    1150 3750
	0    1    1    0   
$EndComp
$Comp
L Device:D D1
U 1 1 6184E20B
P 1400 3200
F 0 "D1" H 1400 3075 50  0000 C CNN
F 1 "SS16" H 1400 3074 50  0001 C CNN
F 2 "Diode_SMD:D_SMA" H 1400 3200 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/onsemi/SS16T3G?qs=xZq1yRCsb1c8788h1nFazA%3D%3D" H 1400 3200 50  0001 C CNN
F 4 "0.36" H 1400 3200 50  0001 C CNN "Price"
	1    1400 3200
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 6184EC54
P 2250 3200
F 0 "R1" V 2135 3200 50  0000 C CNN
F 1 "27R 1W" V 2134 3200 50  0001 C CNN
F 2 "Resistor_SMD:R_0612_1632Metric" V 2180 3200 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/KOA-Speer/WK73R2BTTD27R0F?qs=sGAEpiMZZMvdGkrng054t6odK5HnpZ6cfyF1%252BzoyWdM%3D" H 2250 3200 50  0001 C CNN
F 4 "0.382" H 2250 3200 50  0001 C CNN "Price"
	1    2250 3200
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 6184F7B9
P 1950 3300
F 0 "C1" V 2000 3400 50  0000 C CNN
F 1 "47nF 50V" V 1789 3300 50  0001 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1988 3150 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL10B473KB8NNND?qs=sGAEpiMZZMvsSlwiRhF8qlxW52pIu5FNnJM8feowB3A%3D" H 1950 3300 50  0001 C CNN
F 4 "0.085" H 1950 3300 50  0001 C CNN "Price"
	1    1950 3300
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 618500A3
P 2300 3600
F 0 "C2" V 2350 3700 50  0000 C CNN
F 1 "220nF 50V" V 2139 3600 50  0001 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2338 3450 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL10A224KB8NNNC?qs=sGAEpiMZZMvsSlwiRhF8qtsGU%2FCnaNeQ2pAx%2FyO8BDlqGcrTKW51Mg%3D%3D" H 2300 3600 50  0001 C CNN
F 4 "0.136" H 2300 3600 50  0001 C CNN "Price"
	1    2300 3600
	0    1    1    0   
$EndComp
$Comp
L Device:C C3
U 1 1 618508BD
P 1600 4150
F 0 "C3" H 1650 4250 50  0000 L CNN
F 1 "100nF 50V" H 1715 4105 50  0001 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1638 4000 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL10B104KB8NFNC?qs=sGAEpiMZZMvsSlwiRhF8qunkWFWGyo%252Bv1GZw38BXXfVnkeSfSD0rvg%3D%3D" H 1600 4150 50  0001 C CNN
F 4 "0.09" H 1600 4150 50  0001 C CNN "Price"
	1    1600 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3100 2600 3100
Wire Wire Line
	2600 3100 2600 3000
Wire Wire Line
	2600 3000 2750 3000
$Comp
L power:GND #PWR0101
U 1 1 61851FBF
P 2600 3000
F 0 "#PWR0101" H 2600 2750 50  0001 C CNN
F 1 "GND" V 2605 2872 50  0000 R CNN
F 2 "" H 2600 3000 50  0001 C CNN
F 3 "" H 2600 3000 50  0001 C CNN
	1    2600 3000
	0    1    1    0   
$EndComp
Connection ~ 2600 3000
Wire Wire Line
	2750 3200 2400 3200
Wire Wire Line
	2750 3300 2100 3300
Wire Wire Line
	1800 3300 1800 3200
Wire Wire Line
	1800 3200 2100 3200
Wire Wire Line
	2750 3500 1800 3500
Wire Wire Line
	1800 3500 1800 3300
Connection ~ 1800 3300
Wire Wire Line
	2750 3800 2650 3800
Wire Wire Line
	2750 3700 2150 3700
Wire Wire Line
	2150 3700 2150 3600
Wire Wire Line
	2450 3600 2750 3600
Wire Wire Line
	2750 3400 1600 3400
Wire Wire Line
	1600 3400 1600 4000
Wire Wire Line
	1550 3200 1800 3200
Connection ~ 1800 3200
Wire Wire Line
	1600 4300 1850 4300
Connection ~ 1600 4300
$Comp
L power:GND #PWR0102
U 1 1 61861B09
P 1850 4300
F 0 "#PWR0102" H 1850 4050 50  0001 C CNN
F 1 "GND" H 1855 4127 50  0000 C CNN
F 2 "" H 1850 4300 50  0001 C CNN
F 3 "" H 1850 4300 50  0001 C CNN
	1    1850 4300
	1    0    0    -1  
$EndComp
Connection ~ 1850 4300
$Comp
L Device:CP C4
U 1 1 6186317F
P 1850 4150
F 0 "C4" H 1900 4250 50  0000 L CNN
F 1 "100uF 35V" H 1968 4105 50  0001 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 1888 4000 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Nichicon/UUR1V101MCL6GS?qs=huzeVNXgovWypttWSImRTA%3D%3D" H 1850 4150 50  0001 C CNN
F 4 "0.46" H 1850 4150 50  0001 C CNN "Price"
	1    1850 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 61866ABB
P 5800 5050
F 0 "#PWR0103" H 5800 4800 50  0001 C CNN
F 1 "GND" H 5805 4877 50  0000 C CNN
F 2 "" H 5800 5050 50  0001 C CNN
F 3 "" H 5800 5050 50  0001 C CNN
	1    5800 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3700 5350 3700
Wire Wire Line
	4500 3600 5350 3600
Wire Wire Line
	5350 3600 5350 3700
Connection ~ 5350 3700
Wire Wire Line
	4500 3500 5350 3500
Wire Wire Line
	5350 3500 5350 3600
Connection ~ 5350 3600
Wire Wire Line
	4500 3400 5350 3400
Wire Wire Line
	5350 3400 5350 3500
Connection ~ 5350 3500
Wire Wire Line
	4500 3100 5350 3100
Wire Wire Line
	5350 3100 5350 3400
Connection ~ 5350 3400
Text GLabel 4800 3200 2    50   Input ~ 0
TXD
Text GLabel 4800 3300 2    50   Input ~ 0
RXD
Wire Wire Line
	4500 3300 4800 3300
Wire Wire Line
	4500 3200 4800 3200
$Comp
L Device:C C6
U 1 1 6186BB40
P 5800 3350
F 0 "C6" H 5850 3250 50  0000 L CNN
F 1 "100nF 6.3V" H 5915 3305 50  0001 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5838 3200 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL05B104KQ5NNNC?qs=sGAEpiMZZMvsSlwiRhF8qgRqqbZZ6yqB0z3c2XTK6uY%3D" H 5800 3350 50  0001 C CNN
F 4 "0.085" H 5800 3350 50  0001 C CNN "Price"
	1    5800 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3000 5800 3000
Wire Wire Line
	5800 3000 5800 3200
Wire Wire Line
	5800 3500 5800 3700
Wire Wire Line
	5800 3700 5350 3700
$Comp
L power:+3.3V #PWR0104
U 1 1 6186DC48
P 5800 1450
F 0 "#PWR0104" H 5800 1300 50  0001 C CNN
F 1 "+3.3V" H 5815 1623 50  0000 C CNN
F 2 "" H 5800 1450 50  0001 C CNN
F 3 "" H 5800 1450 50  0001 C CNN
	1    5800 1450
	1    0    0    -1  
$EndComp
Connection ~ 5800 3000
$Comp
L power:GND #PWR0105
U 1 1 6186EC06
P 2650 2550
F 0 "#PWR0105" H 2650 2300 50  0001 C CNN
F 1 "GND" H 2655 2377 50  0000 C CNN
F 2 "" H 2650 2550 50  0001 C CNN
F 3 "" H 2650 2550 50  0001 C CNN
	1    2650 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 6186F111
P 2650 2300
F 0 "C5" V 2700 2400 50  0000 C CNN
F 1 "100nF 6.3V" V 2489 2300 50  0001 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2688 2150 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL05B104KQ5NNNC?qs=sGAEpiMZZMvsSlwiRhF8qgRqqbZZ6yqB0z3c2XTK6uY%3D" H 2650 2300 50  0001 C CNN
F 4 "0.085" H 2650 2300 50  0001 C CNN "Price"
	1    2650 2300
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0106
U 1 1 6186FA8D
P 2650 1950
F 0 "#PWR0106" H 2650 1800 50  0001 C CNN
F 1 "+3.3V" H 2665 2123 50  0000 C CNN
F 2 "" H 2650 1950 50  0001 C CNN
F 3 "" H 2650 1950 50  0001 C CNN
	1    2650 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 2550 2650 2450
Wire Wire Line
	2650 2150 2650 2050
Wire Wire Line
	2650 2050 3150 2050
Wire Wire Line
	3150 2050 3150 2600
Connection ~ 2650 2050
Wire Wire Line
	2650 2050 2650 1950
Wire Wire Line
	3350 2600 3350 1650
Wire Wire Line
	3350 1650 3250 1650
$Comp
L power:GND #PWR0107
U 1 1 61874588
P 2900 1800
F 0 "#PWR0107" H 2900 1550 50  0001 C CNN
F 1 "GND" H 2905 1627 50  0000 C CNN
F 2 "" H 2900 1800 50  0001 C CNN
F 3 "" H 2900 1800 50  0001 C CNN
	1    2900 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1650 2950 1650
$Comp
L power:+12V #PWR0108
U 1 1 618781E5
P 2450 4600
F 0 "#PWR0108" H 2450 4450 50  0001 C CNN
F 1 "+12V" V 2465 4728 50  0000 L CNN
F 2 "" H 2450 4600 50  0001 C CNN
F 3 "" H 2450 4600 50  0001 C CNN
	1    2450 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C11
U 1 1 618789A8
P 2600 5050
F 0 "C11" H 2650 4950 50  0000 L CNN
F 1 "10uF 6.3V ESR < 0.1ohm" H 2715 5005 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2638 4900 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL21A106KOQNNNG?qs=sGAEpiMZZMvsSlwiRhF8qiamir66WTSkBRoD9MoKPnM%3D" H 2600 5050 50  0001 C CNN
F 4 "0.093" H 2600 5050 50  0001 C CNN "Price"
	1    2600 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 6187C172
P 2750 5750
F 0 "#PWR0109" H 2750 5500 50  0001 C CNN
F 1 "GND" H 2755 5577 50  0000 C CNN
F 2 "" H 2750 5750 50  0001 C CNN
F 3 "" H 2750 5750 50  0001 C CNN
	1    2750 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 6187C9A4
P 2900 4750
F 0 "R4" H 2830 4750 50  0000 R CNN
F 1 "67.7K 1/16w" V 2784 4750 50  0001 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2830 4750 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/YAGEO/RT0402DRD0765K7L?qs=sGAEpiMZZMvdGkrng054t3BBvhlgtHH%252BtjKzUSY4INg%3D" H 2900 4750 50  0001 C CNN
F 4 "0.229" H 2900 4750 50  0001 C CNN "Price"
	1    2900 4750
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 6187D49C
P 2900 5250
F 0 "R5" H 2830 5250 50  0000 R CNN
F 1 "590K 1/16w" V 2784 5250 50  0001 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2830 5250 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/YAGEO/RC0402FR-7W590KL?qs=sGAEpiMZZMvdGkrng054t7z4BkURc4Lzj7x5DDUO50HtiNtLvpmoRg%3D%3D" H 2900 5250 50  0001 C CNN
F 4 "0.085" H 2900 5250 50  0001 C CNN "Price"
	1    2900 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2450 4600 2600 4600
Wire Wire Line
	2600 4900 2600 4600
Wire Wire Line
	2900 5400 2900 5750
Wire Wire Line
	2600 5200 2600 5750
Wire Wire Line
	2600 5750 2750 5750
Wire Wire Line
	2900 5100 2900 5000
Wire Wire Line
	3150 4250 3150 5000
Connection ~ 2900 5000
Wire Wire Line
	2900 5000 2900 4900
Wire Wire Line
	2900 5000 3150 5000
Wire Wire Line
	2900 4600 3350 4600
Wire Wire Line
	3350 4600 3350 4250
$Comp
L Device:R R3
U 1 1 61893132
P 3350 4850
F 0 "R3" H 3300 4800 50  0000 R CNN
F 1 "1R 1/16W" V 3234 4850 50  0001 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3280 4850 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/YAGEO/RC0402JR-7W1RL?qs=sGAEpiMZZMvdGkrng054t7z4BkURc4LzmTZ%252BszbcK0CwSPwirxw0Ig%3D%3D" H 3350 4850 50  0001 C CNN
F 4 "0.085" H 3350 4850 50  0001 C CNN "Price"
	1    3350 4850
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 4700 3350 4600
Connection ~ 3350 4600
Wire Wire Line
	3250 4250 3250 5000
Wire Wire Line
	3250 5000 3350 5000
$Comp
L power:GND #PWR0110
U 1 1 6189732E
P 3450 4400
F 0 "#PWR0110" H 3450 4150 50  0001 C CNN
F 1 "GND" H 3455 4227 50  0000 C CNN
F 2 "" H 3450 4400 50  0001 C CNN
F 3 "" H 3450 4400 50  0001 C CNN
	1    3450 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4400 3450 4250
$Comp
L Device:L L2
U 1 1 61899E7C
P 3550 4850
F 0 "L2" H 3600 4950 50  0000 L CNN
F 1 "220uH" H 3603 4805 50  0001 L CNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 3550 4850 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Taiyo-Yuden/LB2518T221M?qs=I6KAKw0tg2yY77OJYA9jag%3D%3D" H 3550 4850 50  0001 C CNN
F 4 "0.15" H 3550 4850 50  0001 C CNN "Price"
	1    3550 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 4250 3550 4700
Wire Wire Line
	3550 5000 3350 5000
Connection ~ 3350 5000
Wire Wire Line
	3650 4250 3650 4350
Wire Wire Line
	2650 4350 2650 3900
Wire Wire Line
	2650 4350 3650 4350
Connection ~ 2650 3800
$Comp
L Device:L L1
U 1 1 618A5317
P 3750 4850
F 0 "L1" H 3800 4950 50  0000 L CNN
F 1 "220uH" H 3803 4805 50  0001 L CNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 3750 4850 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Taiyo-Yuden/LB2518T221M?qs=I6KAKw0tg2yY77OJYA9jag%3D%3D" H 3750 4850 50  0001 C CNN
F 4 "0.15" H 3750 4850 50  0001 C CNN "Price"
	1    3750 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 618A5F60
P 3950 4850
F 0 "R2" H 3950 4700 50  0000 R CNN
F 1 "1R 1/16W" V 3834 4850 50  0001 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3880 4850 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/YAGEO/RC0402JR-7W1RL?qs=sGAEpiMZZMvdGkrng054t7z4BkURc4LzmTZ%252BszbcK0CwSPwirxw0Ig%3D%3D" H 3950 4850 50  0001 C CNN
F 4 "0.085" H 3950 4850 50  0001 C CNN "Price"
	1    3950 4850
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 4250 3750 4700
Wire Wire Line
	3750 5000 3950 5000
$Comp
L power:GND #PWR0111
U 1 1 618AD20E
P 3850 4400
F 0 "#PWR0111" H 3850 4150 50  0001 C CNN
F 1 "GND" H 3855 4227 50  0000 C CNN
F 2 "" H 3850 4400 50  0001 C CNN
F 3 "" H 3850 4400 50  0001 C CNN
	1    3850 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4400 3850 4250
Wire Wire Line
	3950 5000 4050 5000
Wire Wire Line
	4050 5000 4050 4250
Connection ~ 3950 5000
$Comp
L power:+3.3V #PWR0112
U 1 1 618B2A9B
P 4850 4600
F 0 "#PWR0112" H 4850 4450 50  0001 C CNN
F 1 "+3.3V" V 4865 4728 50  0000 L CNN
F 2 "" H 4850 4600 50  0001 C CNN
F 3 "" H 4850 4600 50  0001 C CNN
	1    4850 4600
	0    1    1    0   
$EndComp
$Comp
L Device:C C10
U 1 1 618B48AC
P 4350 5050
F 0 "C10" H 4400 4950 50  0000 L CNN
F 1 "10uF 6.3V ESR < 0.1ohm" H 4465 5005 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4388 4900 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL21A106KOQNNNG?qs=sGAEpiMZZMvsSlwiRhF8qiamir66WTSkBRoD9MoKPnM%3D" H 4350 5050 50  0001 C CNN
F 4 "0.093" H 4350 5050 50  0001 C CNN "Price"
	1    4350 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 618B70E0
P 4350 5750
F 0 "#PWR0113" H 4350 5500 50  0001 C CNN
F 1 "GND" H 4355 5577 50  0000 C CNN
F 2 "" H 4350 5750 50  0001 C CNN
F 3 "" H 4350 5750 50  0001 C CNN
	1    4350 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5200 4350 5750
Wire Wire Line
	4350 4900 4350 4600
Wire Wire Line
	3950 4250 3950 4600
Connection ~ 4350 4600
Connection ~ 3950 4600
Wire Wire Line
	3950 4600 3950 4700
$Comp
L Device:C C8
U 1 1 618DAA47
P 3550 1450
F 0 "C8" V 3600 1550 50  0000 C CNN
F 1 "10pF 6.3V" V 3389 1450 50  0001 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3588 1300 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL05C100JB5NNND?qs=sGAEpiMZZMvsSlwiRhF8qtsGU%2FCnaNeQ66S3DVI%2F3ncF6iPW2vLKAA%3D%3D" H 3550 1450 50  0001 C CNN
F 4 "0.085" H 3550 1450 50  0001 C CNN "Price"
	1    3550 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 618DFD93
P 3850 1450
F 0 "C9" V 3900 1550 50  0000 C CNN
F 1 "10pF 6.3V" V 3689 1450 50  0001 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3888 1300 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL05C100JB5NNND?qs=sGAEpiMZZMvsSlwiRhF8qtsGU%2FCnaNeQ66S3DVI%2F3ncF6iPW2vLKAA%3D%3D" H 3850 1450 50  0001 C CNN
F 4 "0.085" H 3850 1450 50  0001 C CNN "Price"
	1    3850 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal_GND24 X1
U 1 1 618E2A33
P 3700 1900
F 0 "X1" H 3894 1946 50  0000 L CNN
F 1 "FA-238" H 3894 1855 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_SeikoEpson_FA238-4Pin_3.2x2.5mm" H 3700 1900 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Epson-Timing/FA-238-160000MD30X-W3?qs=f9yNj16SXrIs1foPi9xf%2Fw%3D%3D" H 3700 1900 50  0001 C CNN
F 4 "0.53" H 3700 1900 50  0001 C CNN "Price"
	1    3700 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2600 3650 2250
Wire Wire Line
	3650 2250 3550 2250
Wire Wire Line
	3550 2250 3550 1900
Connection ~ 3550 1900
Wire Wire Line
	3750 2600 3750 2250
Wire Wire Line
	3750 2250 3850 2250
Wire Wire Line
	3850 2250 3850 1900
Connection ~ 3850 1900
Wire Wire Line
	3550 1600 3550 1900
Wire Wire Line
	3850 1600 3850 1900
Wire Wire Line
	3700 2100 3450 2100
Wire Wire Line
	3450 2100 3450 1700
Wire Wire Line
	3450 1700 3700 1700
$Comp
L power:GND #PWR0114
U 1 1 61905C46
P 3450 2100
F 0 "#PWR0114" H 3450 1850 50  0001 C CNN
F 1 "GND" H 3455 1927 50  0000 C CNN
F 2 "" H 3450 2100 50  0001 C CNN
F 3 "" H 3450 2100 50  0001 C CNN
	1    3450 2100
	1    0    0    -1  
$EndComp
Connection ~ 3450 2100
Wire Wire Line
	3850 1300 3550 1300
Wire Wire Line
	3550 1300 3450 1300
Wire Wire Line
	3450 1300 3450 1700
Connection ~ 3550 1300
Connection ~ 3450 1700
Wire Wire Line
	3850 2600 3850 2350
Wire Wire Line
	3850 2350 4050 2350
Wire Wire Line
	4050 2350 4050 2600
$Comp
L power:GND #PWR0115
U 1 1 61910365
P 4050 2300
F 0 "#PWR0115" H 4050 2050 50  0001 C CNN
F 1 "GND" H 4055 2127 50  0000 C CNN
F 2 "" H 4050 2300 50  0001 C CNN
F 3 "" H 4050 2300 50  0001 C CNN
	1    4050 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 2350 4050 2300
Connection ~ 4050 2350
Text GLabel 4900 2500 2    50   Input ~ 0
CLK16
Wire Wire Line
	3950 2600 3950 2500
Wire Wire Line
	3950 2500 4900 2500
Wire Wire Line
	1850 3800 1850 4000
Wire Wire Line
	1850 4300 2100 4300
Wire Wire Line
	1850 3800 2100 3800
$Comp
L Device:C C41
U 1 1 6192B77E
P 2100 4150
F 0 "C41" H 2150 4250 50  0000 L CNN
F 1 "1uF 35V ESR < 2ohm" H 2215 4105 50  0001 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2138 4000 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL10A105KL8NNNC?qs=sGAEpiMZZMvsSlwiRhF8qtsBU8Zhqm2RLIDZDghI9lGzj%2FYVDbgmuQ%3D%3D" H 2100 4150 50  0001 C CNN
F 4 "0.14" H 2100 4150 50  0001 C CNN "Price"
	1    2100 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4000 2100 3800
Connection ~ 2100 3800
Wire Wire Line
	2100 3800 2650 3800
$Comp
L Device:C C20
U 1 1 619333DE
P 7100 3100
F 0 "C20" H 7150 3000 50  0000 L CNN
F 1 "100nF 6.3V" H 7215 3055 50  0001 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7138 2950 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL05B104KQ5NNNC?qs=sGAEpiMZZMvsSlwiRhF8qgRqqbZZ6yqB0z3c2XTK6uY%3D" H 7100 3100 50  0001 C CNN
F 4 "0.085" H 7100 3100 50  0001 C CNN "Price"
	1    7100 3100
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 61933FA8
P 7450 3100
F 0 "SW2" V 7450 3248 50  0000 L CNN
F 1 "SW_Push" V 7495 3248 50  0001 L CNN
F 2 "Button_Switch_SMD:SW_SPST_SKQG_WithStem" H 7450 3300 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/ALPS/SKQGABE010?qs=N5Jky1br14NGdH0AMYxewQ%3D%3D" H 7450 3300 50  0001 C CNN
F 4 "0.497" H 7450 3100 50  0001 C CNN "Price"
	1    7450 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 2900 7450 2900
Wire Wire Line
	7100 2900 7100 2950
Connection ~ 7450 2900
Wire Wire Line
	7450 2900 7100 2900
Wire Wire Line
	7100 3300 7100 3250
Wire Wire Line
	7450 3300 7100 3300
$Comp
L Device:R R20
U 1 1 6193D876
P 7750 3300
F 0 "R20" V 7635 3300 50  0000 C CNN
F 1 "10K 1/16w" V 7634 3300 50  0001 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7680 3300 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/YAGEO/AC0402FR-0710KL?qs=sGAEpiMZZMvdGkrng054t1dXgLbs7QPXqM4ukGPhfK4%3D" H 7750 3300 50  0001 C CNN
F 4 "0.085" H 7750 3300 50  0001 C CNN "Price"
	1    7750 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 3300 7900 3300
Wire Wire Line
	7600 3300 7450 3300
Connection ~ 7450 3300
Wire Wire Line
	5800 3700 5800 4000
Connection ~ 5800 3700
Wire Wire Line
	8550 2700 8550 1700
Wire Wire Line
	8650 1700 8550 1700
Connection ~ 8550 1700
$Comp
L Device:L L3
U 1 1 61971AD5
P 8650 2250
F 0 "L3" H 8700 2350 50  0000 L CNN
F 1 "220uH" H 8703 2205 50  0001 L CNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 8650 2250 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Taiyo-Yuden/LB2518T221M?qs=I6KAKw0tg2yY77OJYA9jag%3D%3D" H 8650 2250 50  0001 C CNN
F 4 "0.15" H 8650 2250 50  0001 C CNN "Price"
	1    8650 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 1700 8650 2100
Wire Wire Line
	8650 4600 8650 4850
Wire Wire Line
	8650 4850 8550 4850
Connection ~ 5800 4850
Wire Wire Line
	5800 4850 5800 5050
Wire Wire Line
	8550 4600 8550 4850
Connection ~ 8550 4850
Wire Wire Line
	8550 4850 8450 4850
Wire Wire Line
	8450 4600 8450 4850
Connection ~ 8450 4850
Wire Wire Line
	8450 4850 5800 4850
$Comp
L Device:C C21
U 1 1 6198BBBC
P 8050 2250
F 0 "C21" H 8100 2150 50  0000 L CNN
F 1 "100nF 6.3V" H 8165 2205 50  0001 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8088 2100 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL05B104KQ5NNNC?qs=sGAEpiMZZMvsSlwiRhF8qgRqqbZZ6yqB0z3c2XTK6uY%3D" H 8050 2250 50  0001 C CNN
F 4 "0.085" H 8050 2250 50  0001 C CNN "Price"
	1    8050 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C22
U 1 1 6198D665
P 7800 2250
F 0 "C22" H 7850 2150 50  0000 L CNN
F 1 "10uF 6.3V ESR < 0.1ohm" H 7915 2205 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7838 2100 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL21A106KOQNNNG?qs=sGAEpiMZZMvsSlwiRhF8qiamir66WTSkBRoD9MoKPnM%3D" H 7800 2250 50  0001 C CNN
F 4 "0.093" H 7800 2250 50  0001 C CNN "Price"
	1    7800 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 6198F700
P 7950 2550
F 0 "#PWR0116" H 7950 2300 50  0001 C CNN
F 1 "GND" H 7955 2377 50  0000 C CNN
F 2 "" H 7950 2550 50  0001 C CNN
F 3 "" H 7950 2550 50  0001 C CNN
	1    7950 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2550 7800 2550
Wire Wire Line
	7800 2550 7800 2400
Wire Wire Line
	7950 2550 8050 2550
Wire Wire Line
	8050 2550 8050 2400
Connection ~ 7950 2550
Wire Wire Line
	8050 2100 8050 1700
Connection ~ 8050 1700
Wire Wire Line
	7800 2100 7800 1700
$Comp
L Device:R R21
U 1 1 619A8084
P 7500 4000
F 0 "R21" V 7385 4000 50  0000 C CNN
F 1 "100R" V 7384 4000 50  0001 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7430 4000 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/YAGEO/RC0402FR-7W100RL?qs=sGAEpiMZZMvdGkrng054t7z4BkURc4LzB6DhCpshsTqMLDuSYo8aVg%3D%3D" H 7500 4000 50  0001 C CNN
F 4 "0.085" H 7500 4000 50  0001 C CNN "Price"
	1    7500 4000
	0    1    1    0   
$EndComp
$Comp
L Device:LED LD1
U 1 1 619A91B8
P 6950 4000
F 0 "LD1" H 6943 4125 50  0000 C CNN
F 1 "LED" H 6943 4126 50  0001 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 6950 4000 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Wurth-Elektronik/150060RS55040?qs=8Aam6%252B7C6HHnMZFlrlTntA%3D%3D" H 6950 4000 50  0001 C CNN
F 4 "0.152" H 6950 4000 50  0001 C CNN "Price"
	1    6950 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 4000 7650 4000
Wire Wire Line
	7350 4000 7100 4000
Wire Wire Line
	6800 4000 6150 4000
Connection ~ 5800 4000
Wire Wire Line
	5800 4000 5800 4850
Wire Wire Line
	7100 3300 6150 3300
Wire Wire Line
	6150 3300 6150 4000
Connection ~ 7100 3300
Connection ~ 6150 4000
Wire Wire Line
	6150 4000 5800 4000
$Comp
L Switch:SW_Push SW1
U 1 1 619C29D7
P 9850 2400
F 0 "SW1" V 9850 2548 50  0000 L CNN
F 1 "SW_Push" V 9895 2548 50  0001 L CNN
F 2 "Button_Switch_SMD:SW_SPST_SKQG_WithStem" H 9850 2600 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/ALPS/SKQGABE010?qs=N5Jky1br14NGdH0AMYxewQ%3D%3D" H 9850 2600 50  0001 C CNN
F 4 "0.497" H 9850 2400 50  0001 C CNN "Price"
	1    9850 2400
	0    1    1    0   
$EndComp
$Comp
L Device:C C23
U 1 1 619C32B3
P 9600 2400
F 0 "C23" H 9650 2300 50  0000 L CNN
F 1 "100nF 6.3V" H 9715 2355 50  0001 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9638 2250 50  0001 C CNN
F 3 "https://www.mouser.fr/ProductDetail/Samsung-Electro-Mechanics/CL05B104KQ5NNNC?qs=sGAEpiMZZMvsSlwiRhF8qgRqqbZZ6yqB0z3c2XTK6uY%3D" H 9600 2400 50  0001 C CNN
F 4 "0.085" H 9600 2400 50  0001 C CNN "Price"
	1    9600 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 1700 9850 1700
Wire Wire Line
	9850 1700 9850 2150
Connection ~ 8650 1700
Wire Wire Line
	9600 2250 9600 2150
Wire Wire Line
	9600 2150 9850 2150
Connection ~ 9850 2150
Wire Wire Line
	9850 2150 9850 2200
Wire Wire Line
	9850 4100 9850 2700
Wire Wire Line
	9600 2550 9600 2700
Wire Wire Line
	9600 2700 9850 2700
Connection ~ 9850 2700
Wire Wire Line
	9850 2700 9850 2600
Text GLabel 9450 2900 2    50   Input ~ 0
CLK16
Wire Wire Line
	9450 2900 9050 2900
Wire Wire Line
	5800 1450 5800 1700
$Comp
L power:VDD #PWR0117
U 1 1 619F1F6B
P 6350 1450
F 0 "#PWR0117" H 6350 1300 50  0001 C CNN
F 1 "VDD" H 6365 1623 50  0000 C CNN
F 2 "" H 6350 1450 50  0001 C CNN
F 3 "" H 6350 1450 50  0001 C CNN
	1    6350 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 1700 8050 1700
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 61A02D3B
P 6050 1700
F 0 "JP1" H 6050 1843 50  0000 C CNN
F 1 "Jumper_2_Open" H 6050 1844 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6050 1700 50  0001 C CNN
F 3 "~" H 6050 1700 50  0001 C CNN
	1    6050 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 1700 6350 1700
Wire Wire Line
	6350 1700 6350 1450
Connection ~ 7800 1700
Wire Wire Line
	5800 1700 5850 1700
Connection ~ 5800 1700
Wire Wire Line
	5800 1700 5800 3000
Wire Wire Line
	6250 1700 6350 1700
Connection ~ 6350 1700
Text GLabel 9300 3800 2    50   Input ~ 0
RXD
Text GLabel 9300 3900 2    50   Input ~ 0
TXD
Wire Wire Line
	9050 3800 9300 3800
Wire Wire Line
	9050 3900 9300 3900
Text GLabel 9300 4200 2    50   Input ~ 0
SWDIO
Text GLabel 9300 4300 2    50   Input ~ 0
SWCLK
Wire Wire Line
	9050 4300 9300 4300
Wire Wire Line
	9050 4200 9300 4200
Text GLabel 10850 4450 0    50   Input ~ 0
SWCLK
Text GLabel 10850 4550 0    50   Input ~ 0
SWDIO
Text GLabel 10850 4650 0    50   Input ~ 0
TXD
Text GLabel 10850 4750 0    50   Input ~ 0
RXD
Text GLabel 9300 3100 2    50   Input ~ 0
UART_TX
Text GLabel 9300 4400 2    50   Input ~ 0
UART_RX
Wire Wire Line
	9050 3100 9300 3100
Wire Wire Line
	9050 4400 9300 4400
Text GLabel 10850 4350 0    50   Input ~ 0
UART_TX
Text GLabel 10850 4250 0    50   Input ~ 0
UART_RX
NoConn ~ 3250 2600
NoConn ~ 4500 3800
Wire Wire Line
	3450 2600 3450 2450
Wire Wire Line
	7100 2900 7100 2450
Connection ~ 7100 2900
Text GLabel 4650 2600 3    50   Input ~ 0
SAVEB
Wire Wire Line
	3550 2600 3550 2550
Wire Wire Line
	3550 2550 4650 2550
Wire Wire Line
	4650 2550 4650 2600
Wire Wire Line
	9050 4000 9750 4000
Wire Wire Line
	9750 4000 9750 4650
Text GLabel 9050 4650 0    50   Input ~ 0
SAVEB
$Comp
L Connector_Generic:Conn_01x12 J2
U 1 1 6184D817
P 10950 2900
F 0 "J2" H 11030 2846 50  0000 L CNN
F 1 "Conn_01x12" H 11030 2801 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 10950 2900 50  0001 C CNN
F 3 "~" H 10950 2900 50  0001 C CNN
	1    10950 2900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x12 J3
U 1 1 6184ECC0
P 10950 1500
F 0 "J3" H 11030 1446 50  0000 L CNN
F 1 "Conn_01x12" H 11030 1401 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 10950 1500 50  0001 C CNN
F 3 "~" H 10950 1500 50  0001 C CNN
	1    10950 1500
	1    0    0    -1  
$EndComp
Text GLabel 9300 3700 2    50   Input ~ 0
PA8
Text GLabel 9300 3600 2    50   Input ~ 0
PA7
Text GLabel 9300 3500 2    50   Input ~ 0
PA6
Text GLabel 9300 3400 2    50   Input ~ 0
PA5
Text GLabel 9300 3300 2    50   Input ~ 0
PA4
Text GLabel 9300 3200 2    50   Input ~ 0
PA3
Text GLabel 9300 3000 2    50   Input ~ 0
PA1
Text GLabel 10750 3500 0    50   Input ~ 0
PA8
Text GLabel 10750 3400 0    50   Input ~ 0
PA7
Text GLabel 10750 3300 0    50   Input ~ 0
PA6
Text GLabel 10750 3200 0    50   Input ~ 0
PA5
Text GLabel 10750 3100 0    50   Input ~ 0
PA4
Text GLabel 10750 3000 0    50   Input ~ 0
PA3
Text GLabel 10750 2900 0    50   Input ~ 0
UART_TX
Text GLabel 10750 2800 0    50   Input ~ 0
PA1
Text GLabel 10750 2700 0    50   Input ~ 0
CLK16
Wire Wire Line
	9050 3700 9300 3700
Wire Wire Line
	9050 3600 9300 3600
Wire Wire Line
	9050 3500 9300 3500
Wire Wire Line
	9050 3400 9300 3400
Wire Wire Line
	9050 3300 9300 3300
Wire Wire Line
	9050 3200 9300 3200
Wire Wire Line
	9050 3000 9300 3000
Text GLabel 9750 4650 2    50   Input ~ 0
PA11
Text GLabel 10750 2600 0    50   Input ~ 0
PA11
Text GLabel 7100 2450 2    50   Input ~ 0
NRST
Text GLabel 10850 4150 0    50   Input ~ 0
NRST
Text GLabel 10750 2500 0    50   Input ~ 0
NRST
Text GLabel 8050 4400 0    50   Input ~ 0
PB7
Text GLabel 8050 4300 0    50   Input ~ 0
PB6
Text GLabel 8050 4200 0    50   Input ~ 0
PB5
Text GLabel 8050 4100 0    50   Input ~ 0
PB4
Text GLabel 8050 3900 0    50   Input ~ 0
PB1
Text GLabel 8050 3800 0    50   Input ~ 0
PB0
Text GLabel 8050 3600 0    50   Input ~ 0
PC15
Text GLabel 8050 3500 0    50   Input ~ 0
PC14
Text GLabel 9850 4100 2    50   Input ~ 0
Prog
Text GLabel 7200 4000 1    50   Input ~ 0
Led
$Comp
L power:GND #PWR0118
U 1 1 618B4284
P 10750 1100
F 0 "#PWR0118" H 10750 850 50  0001 C CNN
F 1 "GND" V 10750 900 50  0000 C CNN
F 2 "" H 10750 1100 50  0001 C CNN
F 3 "" H 10750 1100 50  0001 C CNN
	1    10750 1100
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR0119
U 1 1 618B7FAC
P 10750 1000
F 0 "#PWR0119" H 10750 850 50  0001 C CNN
F 1 "+12V" V 10765 1128 50  0000 L CNN
F 2 "" H 10750 1000 50  0001 C CNN
F 3 "" H 10750 1000 50  0001 C CNN
	1    10750 1000
	0    -1   -1   0   
$EndComp
Text GLabel 10750 1300 0    50   Input ~ 0
PC14
Text GLabel 10750 1400 0    50   Input ~ 0
PC15
Text GLabel 10750 1500 0    50   Input ~ 0
PB0
Text GLabel 10750 1600 0    50   Input ~ 0
PB1
Text GLabel 10750 1700 0    50   Input ~ 0
Led
Text GLabel 10750 1800 0    50   Input ~ 0
PB4
Text GLabel 10750 1900 0    50   Input ~ 0
PB5
Text GLabel 10750 2000 0    50   Input ~ 0
PB6
Text GLabel 10750 2100 0    50   Input ~ 0
PB7
Text GLabel 10750 2400 0    50   Input ~ 0
Prog
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 618C9594
P 600 3700
F 0 "J4" H 708 3789 50  0000 C CNN
F 1 "Conn_01x02_Male" H 708 3790 50  0001 C CNN
F 2 "KnxBoard:KNX_Connector" H 600 3700 50  0001 C CNN
F 3 "~" H 600 3700 50  0001 C CNN
	1    600  3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 3700 1050 3600
Wire Wire Line
	800  3700 1050 3700
Wire Wire Line
	800  3800 1050 3800
Wire Wire Line
	1050 3800 1050 3900
Wire Wire Line
	1050 4300 1600 4300
Wire Wire Line
	1150 3600 1050 3600
Connection ~ 1050 3600
Wire Wire Line
	1050 3600 1050 3200
Connection ~ 1050 3900
Wire Wire Line
	1050 3900 1050 4300
Wire Wire Line
	1050 3900 1150 3900
Wire Wire Line
	1050 3200 1250 3200
$Comp
L power:VDD #PWR0120
U 1 1 61915F52
P 10850 4850
F 0 "#PWR0120" H 10850 4700 50  0001 C CNN
F 1 "VDD" V 10865 5023 50  0000 C CNN
F 2 "" H 10850 4850 50  0001 C CNN
F 3 "" H 10850 4850 50  0001 C CNN
	1    10850 4850
	0    -1   -1   0   
$EndComp
$Comp
L power:VDD #PWR0121
U 1 1 619174D7
P 10750 1200
F 0 "#PWR0121" H 10750 1050 50  0001 C CNN
F 1 "VDD" V 10765 1373 50  0000 C CNN
F 2 "" H 10750 1200 50  0001 C CNN
F 3 "" H 10750 1200 50  0001 C CNN
	1    10750 1200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2900 1650 2900 1800
Wire Wire Line
	8050 1700 8450 1700
Wire Wire Line
	8650 2700 8650 2400
Wire Wire Line
	8450 2700 8450 1700
Connection ~ 8450 1700
Wire Wire Line
	8450 1700 8550 1700
Text Label 1050 4300 2    50   ~ 0
KNX-
Text Label 1050 3200 2    50   ~ 0
KNX+
Wire Wire Line
	4350 4600 4850 4600
Wire Wire Line
	2900 5750 2750 5750
Connection ~ 2750 5750
Wire Wire Line
	2900 4600 2600 4600
Connection ~ 2900 4600
Connection ~ 2600 4600
Wire Wire Line
	3450 2450 7100 2450
Wire Wire Line
	9050 4100 9850 4100
Wire Wire Line
	9050 4650 9750 4650
$Comp
L Device:R R6
U 1 1 61939817
P 3100 1650
F 0 "R6" V 2985 1650 50  0000 C CNN
F 1 "NOTMOUNT" V 2984 1650 50  0001 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3030 1650 50  0001 C CNN
F 3 "~" H 3100 1650 50  0001 C CNN
	1    3100 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 3900 2650 3900
Connection ~ 2650 3900
Wire Wire Line
	2650 3900 2650 3800
Wire Wire Line
	3950 4600 4350 4600
$Comp
L power:GND #PWR0122
U 1 1 61978B29
P 10850 4050
F 0 "#PWR0122" H 10850 3800 50  0001 C CNN
F 1 "GND" V 10855 3877 50  0000 C CNN
F 2 "" H 10850 4050 50  0001 C CNN
F 3 "" H 10850 4050 50  0001 C CNN
	1    10850 4050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 619F3DC0
P 2750 4100
F 0 "#PWR0123" H 2750 3850 50  0001 C CNN
F 1 "GND" H 2755 3927 50  0000 C CNN
F 2 "" H 2750 4100 50  0001 C CNN
F 3 "" H 2750 4100 50  0001 C CNN
	1    2750 4100
	1    0    0    -1  
$EndComp
Text Label 1850 3800 0    50   ~ 0
Vfilt
Text Label 3850 1650 0    50   ~ 0
CLK1
Text Label 3550 2250 0    50   ~ 0
CLK0
$Comp
L power:+3.3V #PWR0124
U 1 1 61A2FF1C
P 4500 3900
F 0 "#PWR0124" H 4500 3750 50  0001 C CNN
F 1 "+3.3V" V 4515 4028 50  0000 L CNN
F 2 "" H 4500 3900 50  0001 C CNN
F 3 "" H 4500 3900 50  0001 C CNN
	1    4500 3900
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x10 J1
U 1 1 61884CDE
P 11050 4350
F 0 "J1" H 11130 4342 50  0000 L CNN
F 1 "Conn_01x10" H 11130 4251 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical" H 11050 4350 50  0001 C CNN
F 3 "~" H 11050 4350 50  0001 C CNN
	1    11050 4350
	1    0    0    -1  
$EndComp
NoConn ~ 10850 3950
$EndSCHEMATC