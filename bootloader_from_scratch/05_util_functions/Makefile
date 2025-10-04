bootloader: #no need to add Fig_print.s since we imported it in bootloader.s
	nasm -fbin bootloader.s -o bootloader.bin

debug:
	nasm -fbin -g bootloader.s -o bootloader.bin

clean:
	rm -f bootloader.bin
