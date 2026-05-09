.model small
.stack 100h
.data
    crlf db 13,10,'$'

    menu db '1. Dang ky',13,10
         db '2. Dang nhap',13,10
         db '3. Doi mat khau',13,10
         db '4. Thoat',13,10
         db 'Chon: $'

    tbUser db 13,10,'Nhap username: $'
    tbPass db 13,10,'Nhap password: $'

    dkThanhCong db 13,10,'Dang ky thanh cong!$'
    dnThanhCong db 13,10,'Dang nhap thanh cong!$'
    saiThongTin db 13,10,'Sai username hoac password!$'
    chuaDK db 13,10,'Chua co tai khoan!$'
    doiOK db 13,10,'Doi mat khau thanh cong!$'

    username db 20 dup('$')
    password db 20 dup('$')

    inputUser db 20 dup('$')
    inputPass db 20 dup('$')
    newPass db 20 dup('$')

    daDangKy db 0

.code

; ================= MAIN =================
main proc
    mov ax, @data
    mov ds, ax

    MenuChinh:
    
        lea dx, crlf
        mov ah, 9
        int 21h
    
        lea dx, menu
        mov ah, 9
        int 21h
    
        mov ah, 1
        int 21h
    
        cmp al, '1'
        je DangKy
    
        cmp al, '2'
        je DangNhap
    
        cmp al, '3'
        je DoiMatKhau
    
        cmp al, '4'
        je Thoat
    
        jmp MenuChinh

; ================= DANG KY =================
    DangKy:
    
        ; nhap username
        lea dx, tbUser
        mov ah, 9
        int 21h
    
        lea si, username
        call NhapChuoi
    
        ; nhap password
        lea dx, tbPass
        mov ah, 9
        int 21h
    
        lea si, password
        call NhapChuoi
    
        mov daDangKy, 1
    
        lea dx, dkThanhCong
        mov ah, 9
        int 21h
    
        jmp MenuChinh

; ================= DANG NHAP =================
    DangNhap:
    
        cmp daDangKy, 1
        jne ChuaCoTK
    
        ; nhap user
        lea dx, tbUser
        mov ah, 9
        int 21h
    
        lea si, inputUser
        call NhapChuoi
    
        ; nhap pass
        lea dx, tbPass
        mov ah, 9
        int 21h
    
        lea si, inputPass
        call NhapChuoi
    
        ; so sanh username
        lea si, username
        lea di, inputUser
        call SoSanh
        cmp al, 1
        jne SaiTK
    
        ; so sanh password
        lea si, password
        lea di, inputPass
        call SoSanh
        cmp al, 1
        jne SaiTK
    
        lea dx, dnThanhCong
        mov ah, 9
        int 21h
    
        jmp MenuChinh
    
    SaiTK:
        lea dx, saiThongTin
        mov ah, 9
        int 21h
        jmp MenuChinh
    
    ChuaCoTK:
        lea dx, chuaDK
        mov ah, 9
        int 21h
        jmp MenuChinh

; ================= DOI MAT KHAU =================
    DoiMatKhau:
    
        cmp daDangKy, 1
        jne ChuaCoTK
    
        ; nhap password cu
        lea dx, tbPass
        mov ah, 9
        int 21h
    
        lea si, inputPass
        call NhapChuoi
    
        ; kiem tra password cu
        lea si, password
        lea di, inputPass
        call SoSanh
    
        cmp al, 1
        jne SaiTK
    
        ; nhap password moi
        lea dx, crlf
        mov ah, 9
        int 21h
    
        mov dx, offset tbPass
        mov ah, 9
        int 21h
    
        lea si, newPass
        call NhapChuoi
    
        ; copy sang password
        lea si, newPass
        lea di, password
        call CopyChuoi
    
        lea dx, doiOK
        mov ah, 9
        int 21h
    
        jmp MenuChinh

; ================= THOAT =================
    Thoat:
        mov ah, 4ch
        int 21h
    
    main endp

; ================= NHAP CHUOI =================
NhapChuoi proc
    mov cx, 0

    Nhap:
        mov ah, 1
        int 21h
    
        cmp al, 13
        je KetThuc
    
        mov [si], al
        inc si
        inc cx
        jmp Nhap
    
    KetThuc:
        mov [si], '$'
        ret
NhapChuoi endp

; ================= SO SANH CHUOI =================
; AL = 1 neu bang nhau
; AL = 0 neu khac
SoSanh proc

    LapSS:
        mov al, [si]
        mov bl, [di]
    
        cmp al, bl
        jne Khac
    
        cmp al, '$'
        je Bang
    
        inc si
        inc di
        jmp LapSS
    
    Bang:
        mov al, 1
        ret
    
    Khac:
        mov al, 0
        ret

SoSanh endp

; ================= COPY CHUOI =================
CopyChuoi proc

    Copy:
        mov al, [si]
        mov [di], al
    
        cmp al, '$'
        je Done
    
        inc si
        inc di
        jmp Copy
    
    Done:
        ret

CopyChuoi endp

end main