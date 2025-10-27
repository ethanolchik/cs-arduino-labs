PORT=com5
FILE=blink_delay

build: clean
	avr-as -g -mmcu=atmega328p -o $(FILE).o $(FILE).s
	avr-ld -o $(FILE).elf $(FILE).o
	avr-objcopy -O ihex -R .eeprom $(FILE).elf $(FILE).hex

run: clean
	$(MAKE) build
	avrdude -p m328p -c arduino -P $(PORT) -b 115200 -D -U flash:w:$(FILE).hex:i

clean:
	rm -f $(FILE).o $(FILE).elf $(FILE).hex