mov ah, 0x0e ;tty mode

mov al, [secret]
int 0x10 ;won't work because we need offset e.g, using org

mov bx, 0x7c0 ;segment automatically <<4, don't forget
mov ds, bx ;we can only mov data into cs,ds,es,gs,ss registers from other general purpose registers, not direct values.

; [WARNING] :- from now-on, all memory will be offset by ds automatically

mov al, [secret]
int 0x10

mov al, [es:secret]
int 0x10 ; Wait! es is probably still 0x000.

mov bx, 0x7c0
mov es, bx
mov al, [es:secret] 
int 0x10 ; does it work now?



jmp $ ; infinite loop


secret:
    db "X"

times 510 - ($-$$) db 0
dw 0xaa55
