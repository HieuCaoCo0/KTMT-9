.Model small
.Stack 100H
.Data
    crlf db 13, 10, '$'
    tong db 'Tong: $'
    hieu db 'Hieu; $'
    tich db 'Tich: $'
    thuong db 'Thuong: $'
    a db ?
    b db ?
.Code
Main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov a, al
    
    lea dx, crlf
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov b, al
           
    ; Tinh tong       
    lea dx, tong
    mov ah, 9
    int 21h
    
    mov al, a
    add al, b
    mov dl, al
    mov ah, 2
    int 21
    
    lea dx crlf
    mov ah, 9
    int 21h
    
    lea dx, hieu
    mov ah, 9
    int 21h
    mov al, a
    sub al, b
    mov dl, al
    mov ah, 2
    int 21
    lea dx crlf
    mov ah, 9
    int 21h
    
    lea dx, tich
    mov ah, 9
    int 21h
    mov al, a
    mul b
    mov dx, ax
    mov ah, 9
    int 21h
    lea dx crlf
    mov ah, 9
    int 21h
    
    lea dx, thuong
    mov ah, 9
    int 21h
    mov al, a
    div b
    mov dl, al
    mov ah, 2
    int 21
    lea dx crlf
    mov ah, 9
    int 21h
    
    
    mov ax, 4ch
    int 21h
Main endp
END MAIN