CROSS_COMPILE = riscv64-unknown-elf-

CFLAGS = -mcmodel=medany -nostdlib -fno-builtin -march=rv64gc -mabi=lp64f -g -Wall

all: kernel.bin

kernel.elf: boot.c main.c start.s
	$(CROSS_COMPILE)gcc $(CFLAGS) -T kernel.ld boot.c main.c start.s -o kernel.elf

kernel.bin: kernel.elf
	$(CROSS_COMPILE)objcopy -O binary kernel.elf kernel.bin

qemu: kernel.elf
	qemu-system-riscv64 -M virt \
		-bios default -nographic \
		-serial mon:stdio \
		-kernel kernel.elf \
		--no-reboot

clean:
	rm kernel.elf kernel.bin

