bootloader: 
	nasm -f bin bootloader.s -o bootloader.bin

clean:
	rm -f bootloader.bin

# after that run it on qemu like:
# 	qemu-system-x86_64 bootloader.bin (optional flags:- --nographic --curses)
