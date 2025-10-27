# Atmel 8-bit AVR programs on Arduino Nano
These are programs developed during lab sessions as part of my Computer Systems module at King's College London, taught by Josh Murphy. (Lab 3 is missing for now)
## Things to know:
- Clock Speed (theoretical): 20MHz
- Clock speed (actual): 16MHz

## How to run
### Prequisites:
- Make
- AVR assembler e.g. AVRWin for Windows

Change the filename in Makefile to the name of the file to be flashed into the arduino
e.g.
```makefile
FILE=blink_delay
```
Make sure to exclude the file extension (.s)

Then run
```makefile
make run
```

To remove the excess files from the current directory, run
```make
make clean
```