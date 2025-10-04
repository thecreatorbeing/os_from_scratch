[org 0x7c00] ; global offset

; calling print
mov bx, HELLO
call print

mov bx, NEWLINE
call print

mov dx, 0xbaba 
call print_hex

mov bx, NEWLINE
call print

mov dx, 0xDEAD
call print_hex


;jmp $ ; infinite loop

; include external code, but keep in mind that our whole bootloader code must fit within 512 bytes, no less - no more!
%include "print.s"

; data
HELLO:
    db "Hello-FigOS", 0x00

NEWLINE:
    db 0x0a, 0x0d ; these two makes '\n'

; padding to exactly make our bootloader 512 bytes long
times 510-($-$$) db 0
dw 0xaa55
