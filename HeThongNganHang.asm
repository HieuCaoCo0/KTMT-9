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
    m6  db 13,10,'  |  [3]  Thoat                         |$'
    m7  db 13,10,'  +=====================================+$'
    m8  db 13,10,'  >>  Chon chuc nang: $'

    ; =========================================
    ;   MENU GIAO DICH (SAU DANG NHAP)
    ; =========================================
    b1  db 13,10,'  +=====================================+$'
    b2  db 13,10,'  |      ** MENU GIAO DICH ATM **       |$'
    b3  db 13,10,'  +=====================================+$'
    b4  db 13,10,'  |  [1]  Kiem tra so du                |$'
    b5  db 13,10,'  |  [2]  Rut tien                      |$'
    b6  db 13,10,'  |  [3]  Gui tien                      |$'
    b7  db 13,10,'  |  [4]  Chuyen Khoan                  |$'
    b8  db 13,10,'  |  [5]  Doi mat khau                  |$'
    b9  db 13,10,'  |  [6]  Dang xuat                     |$'
    b10 db 13,10,'  +=====================================+$'
    b11 db 13,10,'  >>  Chon giao dich: $'

    ; =========================================
    ;   BIEN LAI
    ; =========================================
    r1  db 13,10,'  +-------------------------------------+$'
    r2  db 13,10,'  |         BIEN LAI GIAO DICH          |$'
    r3  db 13,10,'  +-------------------------------------+$'
    r4G db 13,10,'  |  Loai GD  : GUI TIEN                |$'
    r4R db 13,10,'  |  Loai GD  : RUT TIEN                |$'
    r4S db 13,10,'  |  Loai GD  : KIEM TRA SO DU          |$'
    r4C db 13,10,'  |  Loai GD  : CHUYEN KHOAN            |$'
    r5  db 13,10,'  |  So tien  : $'
    r6  db 13,10,'  |  So du CL : $'
    r7  db 13,10,'  +-------------------------------------+$'
    r8  db 13,10,'  |      Cam on quy khach!              |$'
    r9  db 13,10,'  +-------------------------------------+$'
    rTo db 13,10,'  |  Chuyen den: $'

    ; =========================================
    ;   THONG BAO NHAP LIEU
    ; =========================================
    tbUser      db 13,10,'  >> Username        : $'
    tbPass      db 13,10,'  >> Password        : $'
    tbNewPass   db 13,10,'  >> Password moi    : $'
    tbNhapSo    db 13,10,'  >> So tien (x1000 VND): $'
    tbSoDu      db 13,10,'  |  So du hien tai  : $'
    tbDonVi     db ' (x1000 VND)$'
    tbDesToUser db 13,10,'  >> Username nguoi nhan: $'
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
    tbCKOK       db 13,10,'  [OK] Chuyen khoan thanh cong!$'
    saiThongTin  db 13,10,'  [!!] Sai username hoac password!$'
    chuaDK       db 13,10,'  [!!] Chua co tai khoan! Hay dang ky truoc.$'
    tbKhongDu    db 13,10,'  [!!] So du khong du!$'
    tbSoKhongHop db 13,10,'  [!!] So tien khong hop le (phai > 0)!$'
    tbDayTK      db 13,10,'  [!!] He thong da day (toi da 5 tai khoan)!$'
    tbTrungTen   db 13,10,'  [!!] Username da ton tai!$'
    tbKhongTimTK db 13,10,'  [!!] Khong tim thay tai khoan nguoi nhan!$'
    tbCKChinhMinh db 13,10,'  [!!] Khong the chuyen khoan cho chinh minh!$'
    tbDanhSachTK  db 13,10,'  Danh sach tai khoan hien co:$'
    tbMuiTen      db 13,10,'    -> $'

    ; =========================================
    ;   DU LIEU TAI KHOAN NHIEU TAI KHOAN
    ;   Toi da MAX_TK tai khoan
    ;   Moi tai khoan: username (20 byte) + password (20 byte) + soDu (2 byte word)
    ; =========================================
    MAX_TK       equ 5
    RECORD_SIZE  equ 42        ; 20 + 20 + 2 = 42 bytes moi tai khoan

    ; Mang luu tru: moi record = [username 20B][password 20B][soDu 2B]
    tkUsername   db MAX_TK * 20 dup('$')
    tkPassword   db MAX_TK * 20 dup('$')
    tkSoDu       dw MAX_TK dup(0)

    soLuongTK    db 0          ; so tai khoan da dang ky
    currentTK    db 0          ; chi so tai khoan dang dang nhap (0-based)
    daDangNhap   db 0

    ; Buffer tam thoi
    inputUser    db 20 dup('$')
    inputPass    db 20 dup('$')
    newPass      db 20 dup('$')
    inputSo      db 10 dup('$')
    destUser     db 20 dup('$')

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
    push bx             ; bao ton BX (BL dung lam counter o noi goi)
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
    pop bx
    mov al, 1
    ret
SS_Khac:
    pop bx
    mov al, 0
    ret
SoSanh endp

; =============================================
;  COPY CHUOI: SI -> DI (ket thuc bang '$')
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
;  IN CHUOI TAI DIA CHI SI (den '$')
; =============================================
InChuoi proc
    push ax
    push dx
    push si
IC_Loop:
    mov dl, [si]
    cmp dl, '$'
    je  IC_Done
    mov ah, 2
    int 21h
    inc si
    jmp IC_Loop
IC_Done:
    pop si
    pop dx
    pop ax
    ret
InChuoi endp

; =============================================
;  LAY DIA CHI USERNAME CUA TAI KHOAN thu BX (0-based)
;  Ra: SI = dia chi username[BX]
; =============================================
LayAddrUsername proc
    push ax
    push dx
    mov ax, bx
    mov dx, 20
    mul dx
    lea si, tkUsername
    add si, ax
    pop dx
    pop ax
    ret
LayAddrUsername endp

; =============================================
;  LAY DIA CHI PASSWORD CUA TAI KHOAN thu BX (0-based)
;  Ra: DI = dia chi password[BX]
; =============================================
LayAddrPassword proc
    push ax
    push dx
    mov ax, bx
    mov dx, 20
    mul dx
    lea di, tkPassword
    add di, ax
    pop dx
    pop ax
    ret
LayAddrPassword endp

; =============================================
;  TIM TAI KHOAN THEO USERNAME (SI = chuoi can tim)
;  Ra: BX = chi so tim thay, CF=0
;      CF=1 neu khong tim thay
; =============================================
; =============================================
;  TIM TAI KHOAN THEO USERNAME
;  Vao: SI = dia chi chuoi username can tim
;  Ra:  BX = chi so tim thay, CF=0 neu thay
;       CF=1 neu khong tim thay
; =============================================
TimTaiKhoan proc
    push ax
    push cx
    push di
    ; luu dia chi chuoi can tim vao DI
    mov di, si
    xor bx, bx
    xor cx, cx
    mov cl, soLuongTK
TTK_Loop:
    cmp bx, cx
    jge TTK_KhongThay
    ; SI = &tkUsername[BX]
    call LayAddrUsername
    ; So sanh: SI=tkUsername[BX], DI=chuoi can tim
    push di
    call SoSanh
    pop di
    cmp al, 1
    je  TTK_Thay
    inc bx
    jmp TTK_Loop
TTK_Thay:
    pop di
    pop cx
    pop ax
    clc
    ret
TTK_KhongThay:
    pop di
    pop cx
    pop ax
    stc
    ret
TimTaiKhoan endp

; =============================================
;  IN DONG CUOI BIEN LAI (so du con lai)
; =============================================
InBienLaiSoDu proc
    push ax
    push bx
    push si
    lea dx, r6
    mov ah, 9
    int 21h
    ; lay sodu cua tai khoan hien tai
    xor bh, bh
    mov bl, currentTK
    ; tkSoDu[BX] = tkSoDu + BX*2
    push bx
    shl bx, 1
    mov ax, tkSoDu[bx]
    pop bx
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
    pop si
    pop bx
    pop ax
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
    lea dx, b10
    mov ah, 9
    int 21h
    lea dx, b11
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
    je  ChuyenKhoan
    cmp al, '5'
    je  DoiMatKhau
    cmp al, '6'
    je  DangXuat
    jmp MenuGiaoDich

; =============================================
;  DANG KY
; =============================================
DangKy:
    ; Kiem tra da day chua
    xor ah, ah
    mov al, soLuongTK
    cmp al, MAX_TK
    jge DK_Day

    call XoaManHinh

    ; Lam sach buffer nhap
    lea di, inputUser
    mov cx, 20
    call LamSachBuffer
    lea di, inputPass
    mov cx, 20
    call LamSachBuffer

    ; Nhap username
    lea dx, tbUser
    mov ah, 9
    int 21h
    lea si, inputUser
    call NhapChuoi

    ; Kiem tra username da ton tai chua
    lea si, inputUser
    call TimTaiKhoan
    jnc DK_TrungTen         ; CF=0 tuc la tim thay -> trung ten

    ; Nhap password
    lea dx, tbPass
    mov ah, 9
    int 21h
    lea si, inputPass
    call NhapChuoi

    ; Luu vao mang tai khoan
    ; chi so moi = soLuongTK
    xor bh, bh
    mov bl, soLuongTK

    ; Copy username vao tkUsername[BL]
    call LayAddrUsername    ; SI = &tkUsername[BL]
    lea di, inputUser
    ; doi cho: can copy inputUser -> SI
    ; dung CopyChuoi: SI->DI, ta can inputUser->tkUsername[BL]
    ; tuc: nguon = inputUser (SI), dich = tkUsername[BL] (DI)
    ; nhung LayAddrUsername dat vao SI, ta can dat vao DI
    mov di, si
    lea si, inputUser
    call CopyChuoi

    ; Copy password vao tkPassword[BL]
    call LayAddrPassword    ; DI = &tkPassword[BL]
    lea si, inputPass
    call CopyChuoi

    ; Dat so du = 0
    shl bx, 1
    mov tkSoDu[bx], 0

    ; Tang so luong tai khoan
    inc soLuongTK

    lea dx, dkThanhCong
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuChinh

DK_Day:
    call XoaManHinh
    lea dx, tbDayTK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuChinh

DK_TrungTen:
    lea dx, tbTrungTen
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuChinh

; =============================================
;  DANG NHAP
; =============================================
DangNhap:
    xor ah, ah
    mov al, soLuongTK
    cmp al, 0
    je  ChuaCoTK

    call XoaManHinh
    lea di, inputUser
    mov cx, 20
    call LamSachBuffer
    lea di, inputPass
    mov cx, 20
    call LamSachBuffer

    lea dx, tbUser
    mov ah, 9
    int 21h
    lea si, inputUser
    call NhapChuoi

    lea dx, tbPass
    mov ah, 9
    int 21h
    lea si, inputPass
    call NhapChuoi

    ; Tim tai khoan theo username
    lea si, inputUser
    call TimTaiKhoan
    jc  SaiTK               ; Khong tim thay

    ; BX = chi so tai khoan, kiem tra password
    ; So sanh inputPass vs tkPassword[BX]
    push bx
    call LayAddrPassword    ; DI = &tkPassword[BX]
    lea si, inputPass
    ; SoSanh: SI=inputPass, DI=tkPassword[BX]
    call SoSanh
    pop bx
    cmp al, 1
    jne SaiTK

    ; Dang nhap thanh cong
    mov currentTK, bl
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

SaiTK1:
    lea dx, saiThongTin
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

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

    ; So sanh password cu
    xor bh, bh
    mov bl, currentTK
    call LayAddrPassword    ; DI = &tkPassword[currentTK]
    lea si, inputPass
    call SoSanh
    cmp al, 1
    jne SaiTK1

    lea dx, tbNewPass
    mov ah, 9
    int 21h
    lea si, newPass
    call NhapChuoi

    ; Copy password moi vao tkPassword[currentTK]
    xor bh, bh
    mov bl, currentTK
    call LayAddrPassword    ; DI = &tkPassword[currentTK]
    lea si, newPass
    call CopyChuoi

    lea dx, doiOK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

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

    ; In so du
    lea dx, tbSoDu
    mov ah, 9
    int 21h
    xor bh, bh
    mov bl, currentTK
    shl bx, 1
    mov ax, tkSoDu[bx]
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

    ; Hien so du
    lea dx, tbSoDu
    mov ah, 9
    int 21h
    xor bh, bh
    mov bl, currentTK
    shl bx, 1
    mov ax, tkSoDu[bx]
    call InSo
    lea dx, tbDonVi
    mov ah, 9
    int 21h

    ; Nhap so tien
    lea dx, tbNhapSo
    mov ah, 9
    int 21h
    lea di, inputSo
    mov cx, 10
    call LamSachBuffer
    lea si, inputSo
    call NhapChuoi

    lea si, inputSo
    call ChuoiToSo
    jc  RT_SoLoi
    cmp ax, 0
    je  RT_SoLoi
    mov bx, ax              ; BX = so tien rut

    ; Kiem tra so du: BX = so tien rut
    push bx                 ; luu so tien rut
    xor bh, bh
    mov bl, currentTK
    shl bx, 1               ; BX = offset vao tkSoDu
    mov ax, tkSoDu[bx]      ; AX = so du hien tai
    pop bx                  ; BX = so tien rut
    cmp ax, bx
    jb  RT_KhongDu

    ; Tru so du
    push bx                 ; luu so tien rut
    xor bh, bh
    mov bl, currentTK
    shl bx, 1
    pop ax                  ; AX = so tien rut
    sub tkSoDu[bx], ax
    mov bx, ax              ; BX = so tien rut (cho bien lai)

    ; In bien lai
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

    ; Hien so du
    lea dx, tbSoDu
    mov ah, 9
    int 21h
    xor bh, bh
    mov bl, currentTK
    shl bx, 1
    mov ax, tkSoDu[bx]
    call InSo
    lea dx, tbDonVi
    mov ah, 9
    int 21h

    ; Nhap so tien
    lea dx, tbNhapSo
    mov ah, 9
    int 21h
    lea di, inputSo
    mov cx, 10
    call LamSachBuffer
    lea si, inputSo
    call NhapChuoi

    lea si, inputSo
    call ChuoiToSo
    jc  GT_SoLoi
    cmp ax, 0
    je  GT_SoLoi
    mov bx, ax              ; BX = so tien gui

    ; Cong vao so du
    push bx                 ; luu so tien
    xor bh, bh
    mov bl, currentTK
    shl bx, 1
    pop ax                  ; ax = so tien gui
    add tkSoDu[bx], ax
    mov bx, ax              ; tra lai bx = so tien (cho bien lai)

    ; In bien lai
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
;  CHUYEN KHOAN
; =============================================
ChuyenKhoan:
    call XoaManHinh

    ; Hien so du hien tai
    lea dx, tbSoDu
    mov ah, 9
    int 21h
    xor bh, bh
    mov bl, currentTK
    shl bx, 1
    mov ax, tkSoDu[bx]
    call InSo
    lea dx, tbDonVi
    mov ah, 9
    int 21h

    ; Hien danh sach tai khoan khac de tham khao
    lea dx, tbDanhSachTK
    mov ah, 9
    int 21h
    xor cx, cx
    mov cl, soLuongTK
    xor bx, bx
CK_InDS:
    cmp bx, cx
    jge CK_XongDS
    ; Kiem tra neu la chinh minh thi bo qua khi hien thi
    mov al, currentTK
    cmp bl, al
    je  CK_NextDS
    lea dx, tbMuiTen
    mov ah, 9
    int 21h
    push bx
    push cx
    call LayAddrUsername    ; SI = &tkUsername[BX]
    call InChuoi
    pop cx
    pop bx
CK_NextDS:
    inc bx
    jmp CK_InDS
CK_XongDS:

    ; Nhap username nguoi nhan
    lea dx, tbDesToUser
    mov ah, 9
    int 21h
    lea di, destUser
    mov cx, 20
    call LamSachBuffer
    lea si, destUser
    call NhapChuoi

    ; Kiem tra nguoi nhan co phai chinh minh khong
    lea si, destUser
    ; lay username hien tai
    xor bh, bh
    mov bl, currentTK
    call LayAddrUsername    ; SI = &tkUsername[currentTK]
    ; doi: SI=username hien tai, DI=destUser
    mov di, si
    lea si, destUser
    call SoSanh
    cmp al, 1
    je  CK_ChinhMinh

    ; Tim tai khoan nguoi nhan
    lea si, destUser
    call TimTaiKhoan
    jc  CK_KhongTimThay

    ; BX = chi so tai khoan nguoi nhan
    push bx

    ; Nhap so tien
    lea dx, tbNhapSo
    mov ah, 9
    int 21h
    lea di, inputSo
    mov cx, 10
    call LamSachBuffer
    lea si, inputSo
    call NhapChuoi

    lea si, inputSo
    call ChuoiToSo
    jc  CK_SoLoi_Pop
    cmp ax, 0
    je  CK_SoLoi_Pop

    mov cx, ax              ; CX = so tien chuyen

    ; Kiem tra so du nguoi gui
    xor bh, bh
    mov bl, currentTK
    shl bx, 1
    mov ax, tkSoDu[bx]
    cmp ax, cx
    jb  CK_KhongDu_Pop

    ; Tru tien nguoi gui (BX da = currentTK*2, CX = so tien)
    sub tkSoDu[bx], cx

    ; Cong tien nguoi nhan
    pop si                  ; SI = chi so TK nguoi nhan (0-based)
    shl si, 1               ; SI = offset*2
    add tkSoDu[si], cx

    ; In bien lai
    lea dx, r1
    mov ah, 9
    int 21h
    lea dx, r2
    mov ah, 9
    int 21h
    lea dx, r3
    mov ah, 9
    int 21h
    lea dx, r4C
    mov ah, 9
    int 21h

    ; In so tien chuyen
    lea dx, r5
    mov ah, 9
    int 21h
    mov ax, cx
    call InSo
    lea dx, tbDonVi
    mov ah, 9
    int 21h

    ; In ten nguoi nhan
    lea dx, rTo
    mov ah, 9
    int 21h
    lea si, destUser
    call InChuoi
    ; in so du con lai nguoi gui
    call InBienLaiSoDu

    lea dx, tbCKOK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

CK_SoLoi_Pop:
    pop bx
    lea dx, tbSoKhongHop
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

CK_KhongDu_Pop:
    pop bx
    lea dx, tbKhongDu
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

CK_ChinhMinh:
    lea dx, tbCKChinhMinh
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

CK_KhongTimThay:
    lea dx, tbKhongTimTK
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