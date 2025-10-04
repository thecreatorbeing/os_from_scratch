fig_os:
	gcc -m64 -ffreestanding -c kernel.c -o kernel.o
	nasm kernel_entry.s -felf64 -o kernel_entry.o
	ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary
	nasm bootloader.s -fbin -o bootloader.bin
	cat bootloader.bin kernel.bin > fig_os.bin
	rm -f bootloader.bin kernel.bin kernel.o kernel_entry.o

clean:
	rm -f fig_os.bin
