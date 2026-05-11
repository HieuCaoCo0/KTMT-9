.model small
.stack 100h
.data

    ; =========================================
    ;   MENU KHOI DAU (CHUA DANG NHAP)
    ; =========================================
    menuKD1  db 13,10,'  +=====================================+$'
    menuKD2  db 13,10,'  |    ** HE THONG NGAN HANG ATM **     |$'
    menuKD3  db 13,10,'  |          (Nhom 9 - PTIT)            |$'
    menuKD4  db 13,10,'  +=====================================+$'
    menuKD5  db 13,10,'  |  [1]  Dang ky tai khoan             |$'
    menuKD6  db 13,10,'  |  [2]  Dang nhap                     |$'
    menuKD7  db 13,10,'  |  [3]  Thoat                         |$'
    menuKD8  db 13,10,'  +=====================================+$'
    menuKD9  db 13,10,'  >>  Chon chuc nang: $'

    ; =========================================
    ;   MENU GIAO DICH (SAU DANG NHAP)
    ; =========================================
    menuGD1  db 13,10,'  +=====================================+$'
    menuGD2  db 13,10,'  |      ** MENU GIAO DICH ATM **       |$'
    menuGD3  db 13,10,'  +=====================================+$'
    menuGD4  db 13,10,'  |  [1]  Kiem tra so du                |$'
    menuGD5  db 13,10,'  |  [2]  Rut tien                      |$'
    menuGD6  db 13,10,'  |  [3]  Gui tien                      |$'
    menuGD7  db 13,10,'  |  [4]  Chuyen Khoan                  |$'
    menuGD8  db 13,10,'  |  [5]  Doi mat khau                  |$'
    menuGD9  db 13,10,'  |  [6]  Dang xuat                     |$'
    menuGD10 db 13,10,'  +=====================================+$'
    menuGD11 db 13,10,'  >>  Chon giao dich: $'

    ; =========================================
    ;   BIEN LAI GIAO DICH
    ; =========================================
    bienLai1        db 13,10,'  +-------------------------------------+$'
    bienLai2        db 13,10,'  |         BIEN LAI GIAO DICH          |$'
    bienLai3        db 13,10,'  +-------------------------------------+$'
    bienLaiGui      db 13,10,'  |  Loai GD  : GUI TIEN                |$'
    bienLaiRut      db 13,10,'  |  Loai GD  : RUT TIEN                |$'
    bienLaiKiemTra  db 13,10,'  |  Loai GD  : KIEM TRA SO DU          |$'
    bienLaiChuyen   db 13,10,'  |  Loai GD  : CHUYEN KHOAN            |$'
    bienLai5        db 13,10,'  |  So tien  : $'
    bienLai6        db 13,10,'  |  So du CL : $'
    bienLai7        db 13,10,'  +-------------------------------------+$'
    bienLai8        db 13,10,'  |      Cam on quy khach!              |$'
    bienLai9        db 13,10,'  +-------------------------------------+$'
    bienLaiChuyenDen db 13,10,'  |  Chuyen den: $'

    ; =========================================
    ;   THONG BAO NHAP LIEU
    ; =========================================
    tb_nhapTenUser   db 13,10,'  >> Username          : $'
    tb_nhapMatKhau   db 13,10,'  >> Password          : $'
    tb_nhapPassMoi   db 13,10,'  >> Password moi      : $'
    tb_nhapSoTien    db 13,10,'  >> So tien (x1000 VND): $'
    tb_soDuHienTai   db 13,10,'  |  So du hien tai    : $'
    tb_donVi         db ' (x1000 VND)$'
    tb_nhapUserNhan  db 13,10,'  >> Username nguoi nhan: $'
    tb_nhanPhim      db 13,10,13,10,'  [ Nhan phim bat ky de tiep tuc... ]$'
    tb_gioiHan       db 13,10,'  [Luu y] So du toi da: 65535 (x1000 VND) ~ 65.5 trieu VND$'

    ; =========================================
    ;   THONG BAO KET QUA
    ; =========================================
    tb_dangKyOK      db 13,10,'  [OK] Dang ky thanh cong!$'
    tb_dangNhapOK    db 13,10,'  [OK] Dang nhap thanh cong!$'
    tb_dangXuatOK    db 13,10,'  [OK] Da dang xuat.$'
    tb_doiPassOK     db 13,10,'  [OK] Doi mat khau thanh cong!$'
    tb_rutOK         db 13,10,'  [OK] Rut tien thanh cong!$'
    tb_guiOK         db 13,10,'  [OK] Gui tien thanh cong!$'
    tb_chuyenKhoanOK db 13,10,'  [OK] Chuyen khoan thanh cong!$'
    tb_saiThongTin   db 13,10,'  [!!] Sai username hoac password!$'
    tb_saiPassCu     db 13,10,'  [!!] Mat khau cu khong chinh xac!$'
    tb_chuaDangKy    db 13,10,'  [!!] Chua co tai khoan! Hay dang ky truoc.$'
    tb_khongDuTien   db 13,10,'  [!!] So du khong du!$'
    tb_soTienSai     db 13,10,'  [!!] So tien khong hop le!$'
    tb_heDayTK       db 13,10,'  [!!] He thong da day (toi da 20 tai khoan)!$'
    tb_trungTenUser  db 13,10,'  [!!] Username da ton tai!$'
    tb_khongTimThayTK db 13,10,'  [!!] Khong tim thay tai khoan nguoi nhan!$'
    tb_chuyenChinhMinh db 13,10,'  [!!] Khong the chuyen khoan cho chinh minh!$'
    tb_nhapRong      db 13,10,'  [!!] Khong duoc de trong thong tin!$'
    tb_danhSachTK    db 13,10,'  Danh sach tai khoan hien co:$'
    tb_muiTen        db 13,10,'    -> $'
    tb_tranSo        db 13,10,'  [!!] Giao dich that bai! Tong so du se vuot qua muc 65535.$'

    ; =========================================
    ;   THONG BAO THOAT
    ; =========================================
    tb_tamBiet       db 13,10,'  +=====================================+'
                     db 13,10,'  |     Cam on da su dung dich vu!      |'
                     db 13,10,'  |       Nhom 9 - PTIT - 2026          |'
                     db 13,10,'  +=====================================+',13,10,'$'

    ; =========================================
    ;   DATABASE TAI KHOAN (toi da 20 tai khoan)
    ; =========================================
    SO_TK_TOI_DA    equ 20

    mangTenUser     db SO_TK_TOI_DA * 20 dup('$')  ; Mang username
    mangMatKhau     db SO_TK_TOI_DA * 20 dup('$')  ; Mang password
    mangSoDu        dw SO_TK_TOI_DA dup(0)          ; Mang so du (x1000 VND)

    soLuongTK       db 0    ; So tai khoan hien co
    tkHienTai       db 0    ; Chi so tai khoan dang dang nhap

    ; =========================================
    ;   BUFFER NHAP LIEU TAM THOI
    ; =========================================
    nhapTenUser     db 20 dup('$')  ; Buffer nhap username
    nhapMatKhau     db 20 dup('$')  ; Buffer nhap password
    matKhauMoi      db 20 dup('$')  ; Buffer nhap password moi
    nhapSoTien      db 10 dup('$')  ; Buffer nhap so tien
    tenUserNhan     db 20 dup('$')  ; Buffer nhap username nguoi nhan

.code

; =============================================
;  XOA MAN HINH
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
    lea dx, tb_nhanPhim
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    ret
ChoNhan endp

; =============================================
;  LAM SACH BUFFER (DI = buffer, CX = kich thuoc)
; =============================================
LamSachBuffer proc
    push ax
    push cx
    push di
LSB_Lap:
    mov byte ptr [di], '$'
    inc di
    loop LSB_Lap
    pop di
    pop cx
    pop ax
    ret
LamSachBuffer endp

; =============================================
;  NHAP CHUOI CO GIOI HAN DO DAI 
;  Vao: SI = buffer dich, CX = so ky tu toi da, ket thuc bang Enter
; =============================================
NhapChuoi proc
NC_Nhap:
    mov ah, 1
    int 21h
    cmp al, 13
    je  NC_Xong
    cmp cx, 0
    je  NC_Nhap       ; Neu da day buffer thi bo qua, chi doc nhung khong luu (chong tran)
    mov [si], al
    inc si
    dec cx
    jmp NC_Nhap
NC_Xong:
    mov byte ptr [si], '$'
    ret
NhapChuoi endp

; =============================================
;  SO SANH CHUOI: SI vs DI
;  Ket qua: AL=1 bang nhau, AL=0 khac nhau
; =============================================
SoSanhChuoi proc
    push bx
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
SoSanhChuoi endp

; =============================================
;  COPY CHUOI: SI -> DI (ket thuc bang '$')
; =============================================
CopyChuoi proc
CC_Lap:
    mov al, [si]
    mov [di], al
    cmp al, '$'
    je  CC_Xong
    inc si
    inc di
    jmp CC_Lap
CC_Xong:
    ret
CopyChuoi endp

; =============================================
;  CHUOI -> SO NGUYEN 16-BIT
;  Vao: SI = chuoi (ket thuc '$')
;  Ra:  AX = so, CF=0 hop le / CF=1 loi
; =============================================
ChuoiToSo proc
    push bx
    push cx
    push dx         
    xor ax, ax
    xor cx, cx
CTS_Lap:
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
    cmp dx, 0       
    jne CTS_Loi_Pop 
    
    pop bx          
    xor bh, bh
    add ax, bx      
    jc  CTS_Loi     
    
    inc si
    inc cx
    jmp CTS_Lap
    
CTS_Loi_Pop:
    pop bx
    jmp CTS_Loi

CTS_KiemTra:
    cmp cx, 0
    je  CTS_Loi
    clc             
    jmp CTS_Xong
    
CTS_Loi:
    stc             
    
CTS_Xong:
    pop dx
    pop cx
    pop bx
    ret
ChuoiToSo endp

; =============================================
;  IN SO NGUYEN 16-BIT (AX = so can in)
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
    jmp IS_Xong
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
IS_Xong:
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
IC_Lap:
    mov dl, [si]
    cmp dl, '$'
    je  IC_Xong
    mov ah, 2
    int 21h
    inc si
    jmp IC_Lap
IC_Xong:
    pop si
    pop dx
    pop ax
    ret
InChuoi endp

; =============================================
;  LAY DIA CHI TEN USER TAI KHOAN thu BX
;  Ra: SI = dia chi mangTenUser[BX * 20]
; =============================================
LayDiaChiTenUser proc
    push ax
    push dx
    mov ax, bx
    mov dx, 20
    mul dx
    lea si, mangTenUser
    add si, ax
    pop dx
    pop ax
    ret
LayDiaChiTenUser endp

; =============================================
;  LAY DIA CHI MAT KHAU TAI KHOAN thu BX
;  Ra: DI = dia chi mangMatKhau[BX * 20]
; =============================================
LayDiaChiMatKhau proc
    push ax
    push dx
    mov ax, bx
    mov dx, 20
    mul dx
    lea di, mangMatKhau
    add di, ax
    pop dx
    pop ax
    ret
LayDiaChiMatKhau endp

; =============================================
;  TIM TAI KHOAN THEO TEN USER
;  Vao: SI = chuoi ten user can tim
;  Ra:  BX = chi chi tim thay, CF=0 neu thay
;       CF=1 neu khong tim thay
; =============================================
TimTaiKhoan proc
    push ax
    push cx
    push di
    mov di, si          
    xor bx, bx
    xor cx, cx
    mov cl, soLuongTK
TTK_Lap:
    cmp bx, cx
    jge TTK_KhongThay
    call LayDiaChiTenUser   
    push di
    call SoSanhChuoi
    pop di
    cmp al, 1
    je  TTK_Thay
    inc bx
    jmp TTK_Lap
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
;  IN SO DU CON LAI TRONG BIEN LAI
; =============================================
InSoDuBienLai proc
    push ax
    push bx
    push si
    lea dx, bienLai6
    mov ah, 9
    int 21h
    xor bh, bh
    mov bl, tkHienTai
    shl bx, 1
    mov ax, mangSoDu[bx]
    call InSo
    lea dx, tb_donVi
    mov ah, 9
    int 21h
    lea dx, bienLai7
    mov ah, 9
    int 21h
    lea dx, bienLai8
    mov ah, 9
    int 21h
    lea dx, bienLai9
    mov ah, 9
    int 21h
    pop si
    pop bx
    pop ax
    ret
InSoDuBienLai endp

; =============================================
;  HIEN THI MENU KHOI DAU
; =============================================
HienThiMenuKhoiDau proc
    call XoaManHinh
    lea dx, menuKD1
    mov ah, 9
    int 21h
    lea dx, menuKD2
    mov ah, 9
    int 21h
    lea dx, menuKD3
    mov ah, 9
    int 21h
    lea dx, menuKD4
    mov ah, 9
    int 21h
    lea dx, menuKD5
    mov ah, 9
    int 21h
    lea dx, menuKD6
    mov ah, 9
    int 21h
    lea dx, menuKD7
    mov ah, 9
    int 21h
    lea dx, menuKD8
    mov ah, 9
    int 21h
    lea dx, menuKD9
    mov ah, 9
    int 21h
    ret
HienThiMenuKhoiDau endp

; =============================================
;  HIEN THI MENU GIAO DICH
; =============================================
HienThiMenuGiaoDich proc
    call XoaManHinh
    lea dx, menuGD1
    mov ah, 9
    int 21h
    lea dx, menuGD2
    mov ah, 9
    int 21h
    lea dx, menuGD3
    mov ah, 9
    int 21h
    lea dx, menuGD4
    mov ah, 9
    int 21h
    lea dx, menuGD5
    mov ah, 9
    int 21h
    lea dx, menuGD6
    mov ah, 9
    int 21h
    lea dx, menuGD7
    mov ah, 9
    int 21h
    lea dx, menuGD8
    mov ah, 9
    int 21h
    lea dx, menuGD9
    mov ah, 9
    int 21h
    lea dx, menuGD10
    mov ah, 9
    int 21h
    lea dx, menuGD11
    mov ah, 9
    int 21h
    ret
HienThiMenuGiaoDich endp

; =============================================
;  MAIN
; =============================================
main proc
    mov ax, @data
    mov ds, ax

; ---- VONG LAP MENU KHOI DAU ----
MenuKhoiDau:
    call HienThiMenuKhoiDau
    mov ah, 1
    int 21h
    cmp al, '1'
    je  DangKy
    cmp al, '2'
    je  DangNhap
    cmp al, '3'
    je  Thoat
    jmp MenuKhoiDau

; ---- VONG LAP MENU GIAO DICH ----
MenuGiaoDich:
    call HienThiMenuGiaoDich
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
;  DANG KY TAI KHOAN MOI
; =============================================
DangKy:
    ; Kiem tra da day chua
    xor ah, ah
    mov al, soLuongTK
    cmp al, SO_TK_TOI_DA
    jge DangKy_Day

    call XoaManHinh

    ; Lam sach buffer nhap
    lea di, nhapTenUser
    mov cx, 20
    call LamSachBuffer
    lea di, nhapMatKhau
    mov cx, 20
    call LamSachBuffer

    ; Nhap username
    lea dx, tb_nhapTenUser
    mov ah, 9
    int 21h
    lea si, nhapTenUser
    mov cx, 19
    call NhapChuoi

    ; Kiem tra rong username
    lea si, nhapTenUser
    cmp byte ptr [si], '$'
    je  DangKy_Rong

    ; Kiem tra username da ton tai chua
    lea si, nhapTenUser
    call TimTaiKhoan
    jnc DangKy_TrungTen     

    ; Nhap password
    lea dx, tb_nhapMatKhau
    mov ah, 9
    int 21h
    lea si, nhapMatKhau
    mov cx, 19
    call NhapChuoi

    ; Kiem tra rong password
    lea si, nhapMatKhau
    cmp byte ptr [si], '$'
    je  DangKy_Rong

    ; Luu username vao mangTenUser[soLuongTK]
    xor bh, bh
    mov bl, soLuongTK
    call LayDiaChiTenUser   
    mov di, si
    lea si, nhapTenUser
    call CopyChuoi

    ; Luu password vao mangMatKhau[soLuongTK]
    xor bh, bh
    mov bl, soLuongTK
    call LayDiaChiMatKhau   
    lea si, nhapMatKhau
    call CopyChuoi

    ; Dat so du ban dau = 0
    xor bh, bh
    mov bl, soLuongTK
    shl bx, 1
    mov mangSoDu[bx], 0

    ; Tang so luong tai khoan
    inc soLuongTK

    lea dx, tb_dangKyOK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuKhoiDau

DangKy_Rong:
    lea dx, tb_nhapRong
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuKhoiDau

DangKy_Day:
    call XoaManHinh
    lea dx, tb_heDayTK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuKhoiDau

DangKy_TrungTen:
    lea dx, tb_trungTenUser
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuKhoiDau

; =============================================
;  DANG NHAP
; =============================================
DangNhap:
    xor ah, ah
    mov al, soLuongTK
    cmp al, 0
    je  DangNhap_ChuaCoTK

    call XoaManHinh
    lea di, nhapTenUser
    mov cx, 20
    call LamSachBuffer
    lea di, nhapMatKhau
    mov cx, 20
    call LamSachBuffer

    ; Nhap username
    lea dx, tb_nhapTenUser
    mov ah, 9
    int 21h
    lea si, nhapTenUser
    mov cx, 19
    call NhapChuoi

    ; Nhap password
    lea dx, tb_nhapMatKhau
    mov ah, 9
    int 21h
    lea si, nhapMatKhau
    mov cx, 19
    call NhapChuoi

    ; Tim tai khoan theo username
    lea si, nhapTenUser
    call TimTaiKhoan
    jc  DangNhap_SaiThongTin    

    ; BX = chi so tai khoan, kiem tra password
    push bx
    call LayDiaChiMatKhau       
    lea si, nhapMatKhau
    call SoSanhChuoi
    pop bx
    cmp al, 1
    jne DangNhap_SaiThongTin

    ; Dang nhap thanh cong
    mov tkHienTai, bl
    lea dx, tb_dangNhapOK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

DangNhap_SaiThongTin:
    lea dx, tb_saiThongTin
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuKhoiDau

DangNhap_ChuaCoTK:
    call XoaManHinh
    lea dx, tb_chuaDangKy
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuKhoiDau

; =============================================
;  DOI MAT KHAU
; =============================================
DoiMatKhau:
    call XoaManHinh
    lea di, nhapMatKhau
    mov cx, 20
    call LamSachBuffer
    lea di, matKhauMoi
    mov cx, 20
    call LamSachBuffer

    ; Nhap password cu
    lea dx, tb_nhapMatKhau
    mov ah, 9
    int 21h
    lea si, nhapMatKhau
    mov cx, 19
    call NhapChuoi

    ; So sanh password cu voi password hien tai
    xor bh, bh
    mov bl, tkHienTai
    call LayDiaChiMatKhau   
    lea si, nhapMatKhau
    call SoSanhChuoi
    cmp al, 1
    jne DoiMatKhau_SaiPass

    ; Nhap password moi
    lea dx, tb_nhapPassMoi
    mov ah, 9
    int 21h
    lea si, matKhauMoi
    mov cx, 19
    call NhapChuoi

    ; Kiem tra rong password moi
    lea si, matKhauMoi
    cmp byte ptr [si], '$'
    je  DoiMatKhau_Rong

    ; Copy password moi vao mangMatKhau[tkHienTai]
    xor bh, bh
    mov bl, tkHienTai
    call LayDiaChiMatKhau   
    lea si, matKhauMoi
    call CopyChuoi

    lea dx, tb_doiPassOK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

DoiMatKhau_SaiPass:
    lea dx, tb_saiPassCu
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

DoiMatKhau_Rong:
    lea dx, tb_nhapRong
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

; =============================================
;  DANG XUAT
; =============================================
DangXuat:
    lea dx, tb_dangXuatOK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuKhoiDau

; =============================================
;  KIEM TRA SO DU
; =============================================
KiemTraSoDu:
    call XoaManHinh

    lea dx, bienLai1
    mov ah, 9
    int 21h
    lea dx, bienLai2
    mov ah, 9
    int 21h
    lea dx, bienLai3
    mov ah, 9
    int 21h
    lea dx, bienLaiKiemTra
    mov ah, 9
    int 21h

    ; In so du
    lea dx, tb_soDuHienTai
    mov ah, 9
    int 21h
    xor bh, bh
    mov bl, tkHienTai
    shl bx, 1
    mov ax, mangSoDu[bx]
    call InSo
    lea dx, tb_donVi
    mov ah, 9
    int 21h

    lea dx, bienLai7
    mov ah, 9
    int 21h
    lea dx, bienLai8
    mov ah, 9
    int 21h
    lea dx, bienLai9
    mov ah, 9
    int 21h

    call ChoNhan
    jmp MenuGiaoDich

; =============================================
;  RUT TIEN
; =============================================
RutTien:
    call XoaManHinh

    ; Hien so du hien tai
    lea dx, tb_soDuHienTai
    mov ah, 9
    int 21h
    xor bh, bh
    mov bl, tkHienTai
    shl bx, 1
    mov ax, mangSoDu[bx]
    call InSo
    lea dx, tb_donVi
    mov ah, 9
    int 21h

    ; Nhap so tien rut
    lea dx, tb_nhapSoTien
    mov ah, 9
    int 21h
    lea di, nhapSoTien
    mov cx, 10
    call LamSachBuffer
    lea si, nhapSoTien
    mov cx, 9
    call NhapChuoi

    ; Kiem tra so tien hop le
    lea si, nhapSoTien
    call ChuoiToSo
    jc  RutTien_SoLoi
    cmp ax, 0
    je  RutTien_SoLoi
    mov bx, ax              

    ; Kiem tra so du co du khong
    push bx                 
    xor bh, bh
    mov bl, tkHienTai
    shl bx, 1
    mov ax, mangSoDu[bx]    
    pop bx                  
    cmp ax, bx
    jb  RutTien_KhongDu

    ; Du tien -> tru so du
    push bx
    xor bh, bh
    mov bl, tkHienTai
    shl bx, 1
    pop ax                  
    sub mangSoDu[bx], ax
    mov bx, ax              

    ; In bien lai
    lea dx, bienLai1
    mov ah, 9
    int 21h
    lea dx, bienLai2
    mov ah, 9
    int 21h
    lea dx, bienLai3
    mov ah, 9
    int 21h
    lea dx, bienLaiRut
    mov ah, 9
    int 21h

    lea dx, bienLai5
    mov ah, 9
    int 21h
    mov ax, bx
    call InSo
    lea dx, tb_donVi
    mov ah, 9
    int 21h

    call InSoDuBienLai

    lea dx, tb_rutOK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

RutTien_KhongDu:
    lea dx, tb_khongDuTien
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

RutTien_SoLoi:
    lea dx, tb_soTienSai
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

; =============================================
;  GUI TIEN 
; =============================================
GuiTien:
    call XoaManHinh

    ; Hien so du hien tai
    lea dx, tb_soDuHienTai
    mov ah, 9
    int 21h
    xor bh, bh
    mov bl, tkHienTai
    shl bx, 1
    mov ax, mangSoDu[bx]
    call InSo
    lea dx, tb_donVi
    mov ah, 9
    int 21h

    ; Hien canh bao gioi han so du
    lea dx, tb_gioiHan
    mov ah, 9
    int 21h

    ; Nhap so tien gui
    lea dx, tb_nhapSoTien
    mov ah, 9
    int 21h
    lea di, nhapSoTien
    mov cx, 10
    call LamSachBuffer
    lea si, nhapSoTien
    mov cx, 9
    call NhapChuoi

    ; Kiem tra so tien hop le
    lea si, nhapSoTien
    call ChuoiToSo
    jc  GuiTien_SoLoi
    cmp ax, 0
    je  GuiTien_SoLoi
    mov bx, ax              

    push bx                 
    xor bh, bh
    mov bl, tkHienTai
    shl bx, 1               
    mov ax, mangSoDu[bx]    
    pop bx                  

    add ax, bx              
    jc  GuiTien_TranSo      

    ; Khong tran -> cap nhat so du
    push bx                 
    xor bh, bh
    mov bl, tkHienTai
    shl bx, 1
    mov mangSoDu[bx], ax    
    pop bx                  

    ; In bien lai
    lea dx, bienLai1
    mov ah, 9
    int 21h
    lea dx, bienLai2
    mov ah, 9
    int 21h
    lea dx, bienLai3
    mov ah, 9
    int 21h
    lea dx, bienLaiGui
    mov ah, 9
    int 21h

    lea dx, bienLai5
    mov ah, 9
    int 21h
    mov ax, bx
    call InSo
    lea dx, tb_donVi
    mov ah, 9
    int 21h

    call InSoDuBienLai

    lea dx, tb_guiOK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

GuiTien_SoLoi:
    lea dx, tb_soTienSai
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

GuiTien_TranSo:
    lea dx, tb_tranSo
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
    lea dx, tb_soDuHienTai
    mov ah, 9
    int 21h
    xor bh, bh
    mov bl, tkHienTai
    shl bx, 1
    mov ax, mangSoDu[bx]
    call InSo
    lea dx, tb_donVi
    mov ah, 9
    int 21h

    ; Hien danh sach tai khoan co the chuyen den
    lea dx, tb_danhSachTK
    mov ah, 9
    int 21h
    xor cx, cx
    mov cl, soLuongTK
    xor bx, bx
CK_InDanhSach:
    cmp bx, cx
    jge CK_XongDanhSach
    mov al, tkHienTai
    cmp bl, al
    je  CK_BoCurent         
    lea dx, tb_muiTen
    mov ah, 9
    int 21h
    push bx
    push cx
    call LayDiaChiTenUser   
    call InChuoi
    pop cx
    pop bx
CK_BoCurent:
    inc bx
    jmp CK_InDanhSach
CK_XongDanhSach:

    ; Nhap username nguoi nhan
    lea dx, tb_nhapUserNhan
    mov ah, 9
    int 21h
    lea di, tenUserNhan
    mov cx, 20
    call LamSachBuffer
    lea si, tenUserNhan
    mov cx, 19
    call NhapChuoi

    ; Kiem tra khong chuyen cho chinh minh
    lea si, tenUserNhan
    xor bh, bh
    mov bl, tkHienTai
    call LayDiaChiTenUser   
    mov di, si
    lea si, tenUserNhan
    call SoSanhChuoi
    cmp al, 1
    je  ChuyenKhoan_ChinhMinh

    ; Tim tai khoan nguoi nhan
    lea si, tenUserNhan
    call TimTaiKhoan
    jc  ChuyenKhoan_KhongTimThay

    ; BX = chi so tai khoan nguoi nhan
    push bx                 

    ; Nhap so tien chuyen
    lea dx, tb_nhapSoTien
    mov ah, 9
    int 21h
    lea di, nhapSoTien
    mov cx, 10
    call LamSachBuffer
    lea si, nhapSoTien
    mov cx, 9
    call NhapChuoi

    ; Kiem tra so tien hop le
    lea si, nhapSoTien
    call ChuoiToSo
    jc  ChuyenKhoan_SoLoi
    cmp ax, 0
    je  ChuyenKhoan_SoLoi

    mov cx, ax              

    ; Kiem tra so du nguoi gui co du khong
    xor bh, bh
    mov bl, tkHienTai
    shl bx, 1
    mov ax, mangSoDu[bx]    
    cmp ax, cx
    jb  ChuyenKhoan_KhongDu

    mov bx, sp
    mov bx, ss:[bx]         

    push cx                 
    shl bx, 1               
    mov ax, mangSoDu[bx]    
    pop cx                  

    add ax, cx              
    jc  ChuyenKhoan_TranSo  

    ; Buoc 1: Cap nhat so du nguoi nhan
    pop bx                  
    push bx                 
    shl bx, 1
    mov mangSoDu[bx], ax    

    ; Buoc 2: Tru so du nguoi gui
    xor bh, bh
    mov bl, tkHienTai
    shl bx, 1
    sub mangSoDu[bx], cx    

    ; Pop index nguoi nhan
    pop si                  

    ; In bien lai
    lea dx, bienLai1
    mov ah, 9
    int 21h
    lea dx, bienLai2
    mov ah, 9
    int 21h
    lea dx, bienLai3
    mov ah, 9
    int 21h
    lea dx, bienLaiChuyen
    mov ah, 9
    int 21h

    ; In so tien chuyen
    lea dx, bienLai5
    mov ah, 9
    int 21h
    mov ax, cx
    call InSo
    lea dx, tb_donVi
    mov ah, 9
    int 21h

    ; In ten nguoi nhan
    lea dx, bienLaiChuyenDen
    mov ah, 9
    int 21h
    lea si, tenUserNhan
    call InChuoi

    ; In so du con lai cua nguoi gui
    call InSoDuBienLai

    lea dx, tb_chuyenKhoanOK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

ChuyenKhoan_SoLoi:
    pop bx                  
    lea dx, tb_soTienSai
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

ChuyenKhoan_KhongDu:
    pop bx                  
    lea dx, tb_khongDuTien
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

ChuyenKhoan_TranSo:
    pop bx                  
    lea dx, tb_tranSo
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

ChuyenKhoan_ChinhMinh:
    lea dx, tb_chuyenChinhMinh
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

ChuyenKhoan_KhongTimThay:
    lea dx, tb_khongTimThayTK
    mov ah, 9
    int 21h
    call ChoNhan
    jmp MenuGiaoDich

; =============================================
;  THOAT CHUONG TRINH
; =============================================
Thoat:
    call XoaManHinh
    lea dx, tb_tamBiet
    mov ah, 9
    int 21h
    mov ah, 4ch
    int 21h

main endp
end main
