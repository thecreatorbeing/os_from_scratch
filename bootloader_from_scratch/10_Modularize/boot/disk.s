;load 'dh' no. of sectors from drive 'dl' into ES:BX
disk_read:
    pusha ;this pushes 'dx' as well then why did I pushed 'dx' again in below line?

    ;specific registers needs to be setup in order to read from disk
    ;this includes 'dx' as well.
    push dx

    mov ah, 0x02 ; ah = int 0x13 function (0x02 = read)
    mov al, dh   ; al = no. of sectors to be red
    mov cl, 0x02 ; cl = sector (0x01 ... 0x11) 
    ; in above instruction cl stores sector where 0x01 means bootsector and 0x02 means 1st available sector.

    mov ch, 0x00 ; ch = cylinder (0x0 .. 0x3FF, upper 2 bits in 'cl')
    ; 'dl' = drive no. (our caller sets it as param & gets it from BIOS)
    ; (0 = floppy, 1 = floppy2, 0x80 = HDD, 0x81 = HDD2)

    mov dh, 0x00 ; dh = head no. (0x00 ... 0x0F)


    ; [es:bx] = ptr to buffer where data will be stored
    ; caller sets it up for us, and it is standard location for int 0x13
    int 0x13 ; BIOS interrupt
    jc disk_error ; if error (stored in carry bit)


    pop dx
    cmp al, dh ; BIOS sets 'al' to no. of sectors red
    jne sectors_error
    popa
    ret

disk_error:
    mov bx, DISK_ERROR
    call print
    mov bx, __N_LINE ; newline
    call print
    mov dh, ah ; ah = error code, dl = disk drive that dropped error
    call print_hex
    jmp disk_loop

sectors_error:
    mov bx, SECTORS_ERROR
    call print

disk_loop:
    jmp $


DISK_ERROR: db "Disk read error", 0x00
SECTORS_ERROR: db "Incorrect number of sectors read", 0x00
__N_LINE: db 0x0a, 0x0d ; newline
