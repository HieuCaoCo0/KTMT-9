.Model small
.Stack 100H
.Data
.Code
Main proc
    mov ax, @data
    mov ds, ax
    
    mov dl, 'A'
    mov cx, 26
    Lap:
        mov ah, 2
        int 21h
        inc dl
        loop Lap
    
    mov ah, 4ch
    int 21h
Main endp
END MAIN