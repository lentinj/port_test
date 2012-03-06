CPU=at90usb162 # Target is a Minimus
#CPU=atmega32u2 # Target is a Minimus 32
CC=avr-gcc
CFLAGS=-g -Os -Wall -mcall-prologues -mmcu=$(CPU)
OBJ2HEX=avr-objcopy
DFU=dfu-programmer
TARGET=port_test

upload : hex
	$(DFU) $(CPU) erase
	$(DFU) $(CPU) flash $(TARGET).hex
	$(DFU) $(CPU) start

hex : $(TARGET).hex

%.obj : %.o
	$(CC) $(CFLAGS) $< -o $@

%.hex : %.obj
	$(OBJ2HEX) -R .eeprom -O ihex $< $@

clean :
	rm -f *.hex *.obj *.o
