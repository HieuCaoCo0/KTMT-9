.Model small
.Stack 100H
.data
.code
Main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 256
    mov dl, 0
    
    Lap:
        mov ah, 2
        int 21h
        
        inc dl
        loop Lap
    
    
    mov ax, 4ch
    int 21h
Main endp
END MAIN