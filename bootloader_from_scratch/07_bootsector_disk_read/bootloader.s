[org 0x7c00]

mov bp, 0x8000 ; set stack safely away from us
mov sp, bp

mov bx, 0x9000 ; es:bx = 0x0000:0x9000 = 0x9000
mov dh, 2 ; read 2 sectors
; BIOS sets 'dl' for boot disk number

call disk_read ; from disk.s

mov dx, [0x9000] ; retrieve first loaded word, 0xdada
call print_hex

mov bx, NEWLINE
call print

mov dx, [0x9000+512] ; 1st word from 2nd loaded sector, 0xbaba
call print_hex

jmp $

%include "../05_util_functions/print.s"
%include "./disk.s"

NEWLINE: db 0x0a, 0x0d

times 510 - ($-$$) db 0
dw 0xaa55



times 256 dw 0xdada ; sector 2 = 512 bytes
times 256 dw 0xbaba ; sector 3 = 512 bytes
