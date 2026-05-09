.model small
.stack 100h
.data

    ; =========================================
    ;   MENU CHINH (CHUA DANG NHAP)
    ; =========================================
    m1  db 13,10,'  +=====================================+$'
    m2  db 13,10,'  |    ** HE THONG NGAN HANG ATM **     |$'
    m3  db 13,10,'  +=====================================+$'
    m4  db 13,10,'  |  [1]  Dang ky tai khoan             |$'
    m5  db 13,10,'  |  [2]  Dang nhap                     |$'
    m6  db 13,10,'  |  [3]  Doi mat khau                  |$'
    m7  db 13,10,'  |  [4]  Thoat                         |$'
    m8  db 13,10,'  +=====================================+$'
    m9  db 13,10,'  >>  Chon chuc nang: $'

    ; =========================================
    ;   MENU GIAO DICH (SAU DANG NHAP)
    ; =========================================
    b1  db 13,10,'  +=====================================+$'
    b2  db 13,10,'  |      ** MENU GIAO DICH ATM **       |$'
    b3  db 13,10,'  +=====================================+$'
    b4  db 13,10,'  |  [1]  Kiem tra so du                |$'
    b5  db 13,10,'  |  [2]  Rut tien                      |$'
    b6  db 13,10,'  |  [3]  Gui tien                      |$'
    b7  db 13,10,'  |  [4]  Dang xuat                     |$'
    b8  db 13,10,'  +=====================================+$'
    b9  db 13,10,'  >>  Chon giao dich: $'

    ; =========================================
    ;   BIEN LAI
    ; =========================================
    r1  db 13,10,'  +-------------------------------------+$'
    r2  db 13,10,'  |         BIEN LAI GIAO DICH          |$'
    r3  db 13,10,'  +-------------------------------------+$'
    r4G db 13,10,'  |  Loai GD  : GUI TIEN                |$'
    r4R db 13,10,'  |  Loai GD  : RUT TIEN                |$'
    r4S db 13,10,'  |  Loai GD  : KIEM TRA SO DU          |$'
    r5  db 13,10,'  |  So tien  : $'
    r6  db 13,10,'  |  So du CL : $'
    r7  db 13,10,'  +-------------------------------------+$'
    r8  db 13,10,'  |      Cam on quy khach!              |$'
    r9  db 13,10,'  +-------------------------------------+$'

    ; =========================================
    ;   THONG BAO NHAP LIEU
    ; =========================================
    tbUser    db 13,10,'  >> Username      : $'
    tbPass    db 13,10,'  >> Password      : $'
    tbNewPass db 13,10,'  >> Password moi  : $'
    tbNhapSo  db 13,10,'  >> So tien (x1000 VND): $'
    tbSoDu    db 13,10,'  |  So du hien tai: $'
    tbDonVi   db ' (x1000 VND)$'
    pressContinue db 13,10,13,10,'  [ Nhan phim bat ky de tiep tuc... ]$'

    ; =========================================
    ;   THONG BAO KET QUA
    ; =========================================
    dkThanhCong  db 13,10,'  [OK] Dang ky thanh cong!$'
    dnThanhCong  db 13,10,'  [OK] Dang nhap thanh cong!$'
    dxThanhCong  db 13,10,'  [OK] Da dang xuat.$'
    doiOK        db 13,10,'  [OK] Doi mat khau thanh cong!$'
    tbRutOK      db 13,10,'  [OK] Rut tien thanh cong!$'
    tbGuiOK      db 13,10,'  [OK] Gui tien thanh cong!$'
    saiThongTin  db 13,10,'  [!!] Sai username hoac password!$'
    chuaDK       db 13,10,'  [!!] Chua co tai khoan! Hay dang ky truoc.$'
    tbKhongDu    db 13,10,'  [!!] So du khong du!$'
    tbSoKhongHop db 13,10,'  [!!] So tien khong hop le (phai > 0)!$'

    ; =========================================
    ;   DU LIEU TAI KHOAN & TRANG THAI
    ; =========================================
    daDangKy   db 0
    daDangNhap db 0

    username   db 20 dup('$')
    password   db 20 dup('$')
    inputUser  db 20 dup('$')
    inputPass  db 20 dup('$')
    newPass    db 20 dup('$')
    inputSo    db 10 dup('$')

    ; So du 16-bit, don vi: 1000 VND
    soDu       dw 0

.code

; =============================================
;  XOA MAN HINH (INT 10h)
; =============================================
XoaManHinh proc
    mov ah, 06h
    mov al, 0
    mov bh, 07h
    mov cx, 0000h
    mov dx, 184Fh
    int 10h
    mov ah, 02h
    mov bh, 0
    mov dx, 0000h
    int 10h
    ret
XoaManHinh endp

; =============================================
;  CHO NHAN PHIM BAT KY
; =============================================
ChoNhan proc
    lea dx, pressContinue
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    ret
ChoNhan endp

; =============================================
;  LAM SACH BUFFER (DI = buffer, CX = size)
; =============================================
LamSachBuffer proc
    push ax
    push cx
    push di
LSB_Loop:
    mov byte ptr [di], '$'
    inc di
    loop LSB_Loop
    pop di
    pop cx
    pop ax
    ret
LamSachBuffer endp

; =============================================
;  NHAP CHUOI (SI = buffer dich)
; =============================================
NhapChuoi proc
NC_Nhap:
    mov ah, 1
    int 21h
    cmp al, 13
    je  NC_Xong
    mov [si], al
    inc si
    jmp NC_Nhap
NC_Xong:
    mov [si], '$'
    ret
NhapChuoi endp

; =============================================
;  SO SANH CHUOI: SI vs DI
;  Ket qua: AL=1 bang nhau, AL=0 khac nhau
; =============================================
SoSanh proc
SS_Lap:
    mov al, [si]
    mov bl, [di]
    cmp al, bl
    jne SS_Khac
    cmp al, '$'
    je  SS_Bang
    inc si
    inc di
    jmp SS_Lap
SS_Bang:
    mov al, 1
    ret
SS_Khac:
    mov al, 0
    ret
SoSanh endp

; =============================================
;  COPY CHUOI: SI -> DI
; =============================================
CopyChuoi proc
CC_Loop:
    mov al, [si]
    mov [di], al
    cmp al, '$'
    je  CC_Done
    inc si
    inc di
    jmp CC_Loop
CC_Done:
    ret
CopyChuoi endp

; =============================================
;  CHUOI -> SO NGUYEN
;  Vao: SI tro toi chuoi (ket thuc bang '$')
;  Ra:  AX = gia tri so
;       CF = 0: hop le, CF = 1: loi
; =============================================
ChuoiToSo proc
    push bx
    push cx
    xor ax, ax
    xor cx, cx
CTS_Loop:
    mov bl, [si]
    cmp bl, '$'
    je  CTS_KiemTra
    cmp bl, '0'
    jb  CTS_Loi
    cmp bl, '9'
    ja  CTS_Loi
    sub bl, '0'
    ; ax = ax * 10 + bl
    push bx
    mov bx, 10
    mul bx
    pop bx
    xor bh, bh
    add ax, bx
    inc si
    inc cx
    jmp CTS_Loop
CTS_KiemTra:
    cmp cx, 0
    je  CTS_Loi
    clc
    jmp CTS_Xong
CTS_Loi:
    stc
CTS_Xong:
    pop cx
    pop bx
    ret
ChuoiToSo endp

; =============================================
;  IN SO NGUYEN AX RA MAN HINH
; =============================================
InSo proc
    push ax
    push bx
    push cx
    push dx
    mov cx, 0
    mov bx, 10
    cmp ax, 0
    jne IS_Chia
    ; truong hop ax = 0
    mov dl, '0'
    mov ah, 2
    int 21h
    jmp IS_Done
IS_Chia:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne IS_Chia
IS_In:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop IS_In
IS_Done:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
InSo endp

; =============================================
;  IN DONG CUOI BIEN LAI (so du con lai)
; =============================================
InBienLaiSoDu proc
    lea dx, r6
    mov ah, 9
    int 21h
    mov ax, soDu
    call InSo
    lea dx, tbDonVi
    mov ah, 9
    int 21h
    lea dx, r7
    mov ah, 9
    int 21h
    lea dx, r8
    mov ah, 9
    int 21h
    lea dx, r9
    mov ah, 9
    int 21h
    ret
InBienLaiSoDu endp

; =============================================
;  HIEN THI MENU CHINH
; =============================================
HienThiMenuChinh proc
    call XoaManHinh
    lea dx, m1
    mov ah, 9
    int 21h
    lea dx, m2
    mov ah, 9
    int 21h
    lea dx, m3
    mov ah, 9
    int 21h
    lea dx, m4
    mov ah, 9
    int 21h
    lea dx, m5
    mov ah, 9
    int 21h
    lea dx, m6
    mov ah, 9
    int 21h
    lea dx, m7
    mov ah, 9
    int 21h
    lea dx, m8
    mov ah, 9
    int 21h
    lea dx, m9
    mov ah, 9
    int 21h
    ret
HienThiMenuChinh endp

; =============================================
;  HIEN THI MENU GIAO DICH
; =============================================
HienThiMenuGD proc
    call XoaManHinh
    lea dx, b1
    mov ah, 9
    int 21h
    lea dx, b2
    mov ah, 9
    int 21h
    lea dx, b3
    mov ah, 9
    int 21h
    lea dx, b4
    mov ah, 9
    int 21h
    lea dx, b5
    mov ah, 9
    int 21h
    lea dx, b6
    mov ah, 9
    int 21h
    lea dx, b7
    mov ah, 9
    int 21h
    lea dx, b8
    mov ah, 9
    int 21h
    lea dx, b9
    mov ah, 9
    int 21h
    ret
HienThiMenuGD endp

; =============================================
;  MAIN
; =============================================
main proc
    mov ax, @data
    mov ds, ax

; ---- MENU CHINH ----
MenuChinh:
    call HienThiMenuChinh
    mov ah, 1
    int 21h
    cmp al, '1'
    je  DangKy
    cmp al, '2'
    je  DangNhap
    cmp al, '3'
    je  DoiMatKhau
    cmp al, '4'
    je  Thoat
    jmp MenuChinh

; ---- MENU GIAO DICH ----
MenuGiaoDich:
    call HienThiMenuGD
    mov ah, 1
    int 21h
    cmp al, '1'
    je  KiemTraSoDu
    cmp al, '2'
    je  RutTien
    cmp al, '3'
    je  GuiTien
    cmp al, '4'
    je  DangXuat
    jmp MenuGiaoDich

; =============================================
;  DANG KY
; =============================================
DangKy:
    call XoaManHinh

    lea di, username
    mov cx, 20
    call LamSachBuffer
    lea di, password
    mov cx, 20
    call LamSachBuffer

    lea dx, tbUser
    mov ah,9
    int 21h
    lea si, username
    call NhapChuoi

    lea dx, tbPass
    mov ah,9
    int 21h
    lea si, password
    call NhapChuoi

    mov soDu, 0
    mov daDangKy, 1
    lea dx, dkThanhCong
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuChinh

; =============================================
;  DANG NHAP
; =============================================
DangNhap:
    cmp daDangKy, 1
    jne ChuaCoTK

    call XoaManHinh
    lea di, inputUser
    mov cx, 20
    call LamSachBuffer
    lea di, inputPass
    mov cx, 20
    call LamSachBuffer

    lea dx, tbUser
    mov ah,9
    int 21h
    lea si, inputUser
    call NhapChuoi

    lea dx, tbPass
    mov ah,9
    int 21h
    lea si, inputPass
    call NhapChuoi

    lea si, username
    lea di, inputUser
    call SoSanh
    cmp al, 1
    jne SaiTK

    lea si, password
    lea di, inputPass
    call SoSanh
    cmp al, 1
    jne SaiTK

    mov daDangNhap, 1
    lea dx, dnThanhCong
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

SaiTK:
    lea dx, saiThongTin
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuChinh

ChuaCoTK:
    call XoaManHinh
    lea dx, chuaDK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuChinh

; =============================================
;  DOI MAT KHAU
; =============================================
DoiMatKhau:
    cmp daDangKy, 1
    jne ChuaCoTK

    call XoaManHinh
    lea di, inputPass
    mov cx, 20
    call LamSachBuffer
    lea di, newPass
    mov cx, 20
    call LamSachBuffer

    lea dx, tbPass
    mov ah, 9
    int 21h
    lea si, inputPass
    call NhapChuoi

    lea si, password
    lea di, inputPass
    call SoSanh
    cmp al, 1
    jne SaiTK

    lea dx, tbNewPass
    mov ah, 9
    int 21h
    lea si, newPass
    call NhapChuoi

    lea si, newPass
    lea di, password
    call CopyChuoi

    lea dx, doiOK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuChinh

; =============================================
;  DANG XUAT
; =============================================
DangXuat:
    mov daDangNhap, 0
    lea dx, dxThanhCong
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuChinh

; =============================================
;  KIEM TRA SO DU
; =============================================
KiemTraSoDu:
    call XoaManHinh

    lea dx, r1
    mov ah, 9
    int 21h
    lea dx, r2
    mov ah, 9
    int 21h
    lea dx, r3
    mov ah, 9
    int 21h
    lea dx, r4S
    mov ah, 9
    int 21h

    lea dx, tbSoDu
    mov ah, 9
    int 21h
    mov ax, soDu
    call InSo
    lea dx, tbDonVi
    mov ah, 9
    int 21h

    lea dx, r7
    mov ah, 9
    int 21h
    lea dx, r8
    mov ah, 9
    int 21h
    lea dx, r9
    mov ah, 9
    int 21h

    call ChoNhan
    jmp MenuGiaoDich

; =============================================
;  RUT TIEN
; =============================================
RutTien:
    call XoaManHinh

    ; hien so du truoc khi rut
    lea dx, tbSoDu
    mov ah, 9
    int 21h
    mov ax, soDu
    call InSo
    lea dx, tbDonVi
    mov ah, 9
    int 21h

    ; nhap so tien
    lea dx, tbNhapSo
    mov ah, 9
    int 21h
    lea di, inputSo
    mov cx, 10
    call LamSachBuffer
    lea si, inputSo
    call NhapChuoi

    ; doi chuoi -> so -> BX (luu so tien)
    lea si, inputSo
    call ChuoiToSo
    jc  RT_SoLoi
    cmp ax, 0
    je  RT_SoLoi
    mov bx, ax         ; BX = so tien muon rut

    ; kiem tra so du
    cmp soDu, bx
    jb  RT_KhongDu

    ; tru so du
    sub soDu, bx

    ; in bien lai
    lea dx, r1
    mov ah, 9
    int 21h
    lea dx, r2
    mov ah, 9
    int 21h
    lea dx, r3
    mov ah, 9
    int 21h
    lea dx, r4R
    mov ah, 9
    int 21h

    lea dx, r5
    mov ah, 9
    int 21h
    mov ax, bx
    call InSo
    lea dx, tbDonVi
    mov ah, 9
    int 21h

    call InBienLaiSoDu

    lea dx, tbRutOK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

RT_KhongDu:
    lea dx, tbKhongDu
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

RT_SoLoi:
    lea dx, tbSoKhongHop
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

; =============================================
;  GUI TIEN
; =============================================
GuiTien:
    call XoaManHinh

    ; hien so du truoc khi gui
    lea dx, tbSoDu
    mov ah, 9
    int 21h
    mov ax, soDu
    call InSo
    lea dx, tbDonVi
    mov ah, 9
    int 21h

    ; nhap so tien
    lea dx, tbNhapSo
    mov ah, 9
    int 21h
    lea di, inputSo
    mov cx, 10
    call LamSachBuffer
    lea si, inputSo
    call NhapChuoi

    ; doi chuoi -> so -> BX
    lea si, inputSo
    call ChuoiToSo
    jc  GT_SoLoi
    cmp ax, 0
    je  GT_SoLoi
    mov bx, ax         ; BX = so tien gui

    ; cong vao so du
    add soDu, bx

    ; in bien lai
    lea dx, r1
    mov ah, 9
    int 21h
    lea dx, r2
    mov ah, 9
    int 21h
    lea dx, r3
    mov ah, 9
    int 21h
    lea dx, r4G
    mov ah, 9
    int 21h

    lea dx, r5
    mov ah, 9
    int 21h
    mov ax, bx
    call InSo
    lea dx, tbDonVi
    mov ah, 9
    int 21h

    call InBienLaiSoDu

    lea dx, tbGuiOK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

GT_SoLoi:
    lea dx, tbSoKhongHop
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

; =============================================
;  THOAT
; =============================================
Thoat:
    call XoaManHinh
    mov ah, 4ch
    int 21h

main endp

end main