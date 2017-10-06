baud=19200
src=main
avrType=atmega168
avrFreq=16000000L
programmerDev=/dev/ttyUSB0	# please update according to your system
programmerType=arduino
avra_lib=/usr/share/avra/

.PHONY: help clean hex flash

help:
	@echo 'clean        Delete automatically created files.'
	@echo 'flash        Program $(src).hex to controller flash memory.'
	@echo 'hex      Create all hex files for flash, eeprom and fuses.'

clean: 
	rm $(src).s.*
	date

hex:
	avra $(src).s -I $(avra_lib)

flash: hex
	avrdude -p$(avrType) -c$(programmerType) -P$(programmerDev) -b$(baud) -v -U flash:w:$(src).s.hex:i
	date
