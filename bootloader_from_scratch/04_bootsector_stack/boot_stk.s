;we're not using org here since we're demonstrating stack only.

mov ah, 0x0e ;tty mode

mov bp, 0x8000 ;base ptr of stack which is far away from 0x7c00 to prevent overriting.

mov sp, bp ;this means stack is empty.

;adding stuff to our stack
push 'a'
push 'b'
push 'c'

; always remember that stack grows downwards such and sp ptr points to most recent entry which is the bottom-most entry.


;We can only pop full words (i.e, 16-bit) so we need to use 16-bit registers
;by the way, byte=8bits , word=16bits , double-word=32bits and quad-word=64bits

pop bx ;16-bit register
mov al, bl ;moving the lower part of bx into al (higher part of bx is bh).
int 0x10 ;prints the most recent element added into stack.



;feeling nice? well just to stress you more try to access some other entry from the stack

;I guess, we should try once more to print the same entry that got printed at line 20
pop bx
mov al, bl
int 0x10
;got your output right? or messed something?




jmp $ ;execute this line infinitely

times 510-($-$$) db 0 ;do you remember why do we do this?
dw 0xaa55 ;and what's this used for?
