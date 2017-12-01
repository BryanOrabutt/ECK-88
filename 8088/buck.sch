EESchema Schematic File Version 2
LIBS:8088
LIBS:74xx
LIBS:adc-dac
LIBS:analog_switches
LIBS:atmel
LIBS:audio
LIBS:cmos4000
LIBS:conn
LIBS:contrib
LIBS:cypress
LIBS:device
LIBS:digital-audio
LIBS:display
LIBS:dsp
LIBS:intel
LIBS:interface
LIBS:linear
LIBS:memory
LIBS:microchip
LIBS:microcontrollers
LIBS:motorola
LIBS:opto
LIBS:philips
LIBS:power
LIBS:regul
LIBS:siliconi
LIBS:texas
LIBS:transistors
LIBS:valves
LIBS:xilinx
LIBS:Darlington
LIBS:regulators
LIBS:buck
LIBS:8088-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L INDUCTOR_SMALL L1
U 1 1 59BCA171
P 6650 3050
F 0 "L1" H 6650 3150 50  0000 C CNN
F 1 "22uH" H 6650 3000 50  0000 C CNN
F 2 "footprints:SRR1208-220ML" H 6650 3050 50  0001 C CNN
F 3 "" H 6650 3050 50  0000 C CNN
	1    6650 3050
	1    0    0    -1  
$EndComp
$Comp
L D_Schottky_Small D38
U 1 1 59BCA1CC
P 6350 3500
F 0 "D38" H 6300 3580 50  0000 L CNN
F 1 "STPS5L60U" H 6070 3420 50  0000 L CNN
F 2 "Diodes_SMD:D_SMA_Handsoldering" V 6350 3500 50  0001 C CNN
F 3 "" V 6350 3500 50  0000 C CNN
	1    6350 3500
	0    1    1    0   
$EndComp
$Comp
L CP1_Small C5
U 1 1 59BCA249
P 7400 3250
F 0 "C5" H 7410 3320 50  0000 L CNN
F 1 "220uF" H 7410 3170 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_5x5.3" H 7400 3250 50  0001 C CNN
F 3 "" H 7400 3250 50  0000 C CNN
	1    7400 3250
	1    0    0    -1  
$EndComp
$Comp
L C_Small C4
U 1 1 59BCA2E3
P 7000 3250
F 0 "C4" H 7010 3320 50  0000 L CNN
F 1 "100nF" H 7010 3170 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7000 3250 50  0001 C CNN
F 3 "" H 7000 3250 50  0000 C CNN
	1    7000 3250
	1    0    0    -1  
$EndComp
$Comp
L C_Small C8
U 1 1 59BCA32F
P 6600 2600
F 0 "C8" H 6610 2670 50  0000 L CNN
F 1 "4.7uF" H 6610 2520 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 6600 2600 50  0001 C CNN
F 3 "" H 6600 2600 50  0000 C CNN
	1    6600 2600
	1    0    0    -1  
$EndComp
$Comp
L C_Small C7
U 1 1 59BCA35D
P 6200 2600
F 0 "C7" H 6210 2670 50  0000 L CNN
F 1 "4.7uF" H 6210 2520 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 6200 2600 50  0001 C CNN
F 3 "" H 6200 2600 50  0000 C CNN
	1    6200 2600
	1    0    0    -1  
$EndComp
$Comp
L C_Small C6
U 1 1 59BCA3E0
P 5200 2650
F 0 "C6" H 5210 2720 50  0000 L CNN
F 1 "10nF" H 5210 2570 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5200 2650 50  0001 C CNN
F 3 "" H 5200 2650 50  0000 C CNN
	1    5200 2650
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R38
U 1 1 59BCA482
P 5500 4000
F 0 "R38" H 5530 4020 50  0000 L CNN
F 1 "10K±0.1%" V 5400 3800 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 5500 4000 50  0001 C CNN
F 3 "" H 5500 4000 50  0000 C CNN
	1    5500 4000
	0    -1   -1   0   
$EndComp
$Comp
L R_Small R37
U 1 1 59BCA4EE
P 4450 4000
F 0 "R37" H 4480 4020 50  0000 L CNN
F 1 "30.9K±0.1%" V 4350 3750 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 4450 4000 50  0001 C CNN
F 3 "" H 4450 4000 50  0000 C CNN
	1    4450 4000
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR044
U 1 1 59BCA682
P 7400 2950
F 0 "#PWR044" H 7400 2800 50  0001 C CNN
F 1 "+5V" H 7400 3090 50  0000 C CNN
F 2 "" H 7400 2950 50  0000 C CNN
F 3 "" H 7400 2950 50  0000 C CNN
	1    7400 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR045
U 1 1 59BCC39B
P 6400 2750
F 0 "#PWR045" H 6400 2500 50  0001 C CNN
F 1 "GND" H 6400 2600 50  0000 C CNN
F 2 "" H 6400 2750 50  0000 C CNN
F 3 "" H 6400 2750 50  0000 C CNN
	1    6400 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR046
U 1 1 59BCC8AD
P 6350 4000
F 0 "#PWR046" H 6350 3750 50  0001 C CNN
F 1 "GND" H 6350 3850 50  0000 C CNN
F 2 "" H 6350 4000 50  0000 C CNN
F 3 "" H 6350 4000 50  0000 C CNN
	1    6350 4000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR047
U 1 1 59BCCEA8
P 4250 3850
F 0 "#PWR047" H 4250 3700 50  0001 C CNN
F 1 "+5V" H 4250 3990 50  0000 C CNN
F 2 "" H 4250 3850 50  0000 C CNN
F 3 "" H 4250 3850 50  0000 C CNN
	1    4250 3850
	1    0    0    -1  
$EndComp
NoConn ~ 4700 3150
NoConn ~ 4700 3250
NoConn ~ 5750 3350
Wire Wire Line
	6050 3150 5750 3150
Wire Wire Line
	6350 3400 6350 3050
Wire Wire Line
	5750 3050 6400 3050
Connection ~ 6350 3050
Connection ~ 6050 2400
Wire Wire Line
	6600 2400 6600 2500
Connection ~ 6600 2400
Wire Wire Line
	6200 2500 6200 2400
Connection ~ 6200 2400
Wire Wire Line
	6200 2700 6200 2750
Wire Wire Line
	6600 2750 6600 2700
Wire Wire Line
	6200 2750 6600 2750
Connection ~ 6400 2750
Wire Wire Line
	5300 2650 5850 2650
Wire Wire Line
	5850 2650 5850 3050
Connection ~ 5850 3050
Wire Wire Line
	5100 2650 4700 2650
Wire Wire Line
	4700 2650 4700 3050
Wire Wire Line
	7400 2950 7400 3150
Wire Wire Line
	6350 4000 6350 3600
Wire Wire Line
	7400 4000 7400 3350
Wire Wire Line
	4550 4000 5400 4000
Wire Wire Line
	5600 4000 7400 4000
Wire Wire Line
	4350 4000 4250 4000
Wire Wire Line
	4250 4000 4250 3850
Wire Wire Line
	5750 3250 5900 3250
Wire Wire Line
	5900 3250 5900 3450
$Comp
L GND #PWR048
U 1 1 59BCCFEE
P 5900 3450
F 0 "#PWR048" H 5900 3200 50  0001 C CNN
F 1 "GND" H 5900 3300 50  0000 C CNN
F 2 "" H 5900 3450 50  0000 C CNN
F 3 "" H 5900 3450 50  0000 C CNN
	1    5900 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3350 4600 3350
Wire Wire Line
	4600 3350 4600 4000
Connection ~ 4600 4000
Wire Wire Line
	4700 3500 4700 3600
$Comp
L GND #PWR049
U 1 1 59BCDF6C
P 4700 3600
F 0 "#PWR049" H 4700 3350 50  0001 C CNN
F 1 "GND" H 4700 3450 50  0000 C CNN
F 2 "" H 4700 3600 50  0000 C CNN
F 3 "" H 4700 3600 50  0000 C CNN
	1    4700 3600
	1    0    0    -1  
$EndComp
$Comp
L TPS5430 U16
U 1 1 59BCE361
P 5250 3200
F 0 "U16" H 5500 2800 60  0000 C CNN
F 1 "TPS5430" H 5100 3500 60  0000 C CNN
F 2 "Housings_SOIC:TI_SO-PowerPAD-8" H 4350 2650 60  0001 C CNN
F 3 "" H 4350 2650 60  0001 C CNN
	1    5250 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 1900 6050 3150
Connection ~ 6350 4000
Wire Wire Line
	7000 3350 7000 4000
Connection ~ 7000 4000
Wire Wire Line
	6050 2400 6600 2400
Wire Wire Line
	7000 3050 7000 3150
Wire Wire Line
	6900 3050 7400 3050
Connection ~ 7000 3050
Connection ~ 7400 3050
Text HLabel 6200 3000 1    60   Input ~ 0
PH
Wire Wire Line
	6200 3050 6200 3000
Connection ~ 6200 3050
Text GLabel 6050 1900 1    60   Input ~ 0
P_IN
$EndSCHEMATC
