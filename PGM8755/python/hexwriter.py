#!/usr/bin/env python3

import serial, sys, getopt

usage = '''\nhexwriter [OPTION] -f FILE\nDefault operation is to use 115200 baud on /dev/ttyUSB0\nOPTIONS:\n-h displays usage\n-b baud rate\n-d device handle\n-f file name'''

try:
	opts, args = getopt.getopt(sys.argv[1:], 'b:d:f:h', ['baud=', 'device=', 'file=', 'help'])
	
except getopt.GetoptError:
	print(usage)
	sys.exit(2)

baud_rate = 115200
dev = '/dev/ttyUSB0'
filename = ''

for opt, arg in opts:
	if opt in ('-h', '--help'):
		print(usage)
		sys.exit(2)
	elif opt in ('-b', '--baud'):
		baud_rate = arg
	elif opt in ('-d', '--device'):
		dev = arg
	elif opt in ('-f', '--file'):
		filename = arg
	else:
		print(usage)
		sys.exit(2)

if filename == '':
	raise Exception("No file given\n%s" % (usage))
	sys.exit(2)

ser = serial.Serial()
ser.baudrate = baud_rate
ser.port = dev

try:
	ser.open()
except SerialException:
	print('Could not open device: %s' % (dev))
	sys.exit(2)

try:
	f = open(filename, 'rb')
except IOError:
	print("Could not read file: %s" % (filename))
	sys.exit(2)

with f:
	byte = f.read(1)
	while byte != b"":
		ser.write(byte)
		byte = f.read(1)

