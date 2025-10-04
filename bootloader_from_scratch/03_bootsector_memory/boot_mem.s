;if you don't do below thing, the <-f bin> we are passing to nasm will default org to 0x00 (no offset)
[org 0x7c00] ;this is the address where bootsector memory starts so any address we need to refer must have to be offset-ed by this value	


mov ah, 0x0e ;enable tty


;for pre-empting OS we must make sure that below registers have correct values (not a concern right now!)
mov al, "F"
int 0x10 ;interrupt for printing
mov al, "I"
int 0x10
mov al, "G"
int 0x10
mov al, "-"
int 0x10
mov al, "O"
int 0x10
mov al, "S"
int 0x10
mov al, 0xA
int 0x10
mov al, 0xD
int 0x10
mov al, [my_char] ;this is why offset using org (at the top) is important!
int 0x10


jmp $ ;infinite loop


my_char: ;you won't be able to access this without giving offset as said in top comment
    db "X" ;define byte which stores "X" char


;adding zeroes to make the total length of code 512 bytes
times 510-($-$$) db 0; until here, we have 512-bytes of code and below line adds 2 byte


dw 0xaa55 ;ending with this means "This is a bootloader code"
