baud=19200
src=main
avrType=atmega168
avrFreq=16000000L # 4MHz for accurate baudrate timing
programmerDev=/dev/ttyUSB0
programmerType=arduino
avra_lib=/usr/share/avra/

cflags=-g -DF_CPU=$(avrFreq) -Wall -Os -Werror -Wextra

memoryTypes=calibration eeprom efuse flash fuse hfuse lfuse lock signature application apptable boot prodsig usersig

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
