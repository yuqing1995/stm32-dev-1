COMPILER_COMMAND=arm-none-eabi-gcc
MACHINE=Cortex-m4
COMPILER_FLAG= -c -mcpu=$(MACHINE) -mthumb -std=gnu11 -Wall -o0
LINK_FLAG= -nostdlib -T stm32-ls.ld -Wl,-Map=final.map

all: main.o led.o stm32-startup.o final.elf

main.o:main.c
	$(COMPILER_COMMAND) $(COMPILER_FLAG) -o $@ $^

led.o:led.c
	$(COMPILER_COMMAND) $(COMPILER_FLAG) -o $@ $^

stm32-startup.o:stm32-startup.c
	$(COMPILER_COMMAND) $(COMPILER_FLAG) -o $@ $^

final.elf:main.o led.o stm32-startup.o
	$(COMPILER_COMMAND) $(LINK_FLAG) -o $@ $^

clean:
	rm -rf *.o *.elf *.map