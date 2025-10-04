fig_os:
	rm -rf build && \
	mkdir build && \
	gcc -m64 -ffreestanding -c kernel/kernel.c -o kernel.o && \
	nasm boot/kernel_entry.s -felf64 -o kernel_entry.o && \
	ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary && \
	cd boot/ && \
	nasm bootloader.s -fbin -o ../bootloader.bin && \
	cd .. && \
	cat bootloader.bin kernel.bin > build/fig_os.bin && \
	rm -f bootloader.bin kernel.bin kernel.o kernel_entry.o ;

clean:
	rm -rf build/
