;program to swap two numbers
org 100h

include emu8086.inc

.data

msg1 db "Enter a value Var1:",0AH,0DH,24h
msg2 db 0AH,0DH,"Enter a value Var2: ",0AH,0DH,24h
msg3 db 0AH,0DH,"Var1 value is: ",0AH,0DH,24h
msg4 db 0AH,0DH,"Var2 value is: ",0AH,0DH,24h
var1  dw ?
var2 dw ?

.code
main:
mov ax,@data
mov ds,ax

mov dx,offset msg1
mov ah,09h
int 21h

call scan_num
mov var1,cx

mov dx,offset msg2
mov ah,09h
int 21h

call scan_num
mov var2,cx

mov dx,offset msg3
mov ah,09h
int 21h

mov ax,var1
mov bx,var2
mov cx,ax
mov ax,bx
mov bx,cx
call print_num

mov dx,offset msg4
mov ah,09h
int 21h

mov cx,bx
mov bx,ax
mov ax,cx
call print_num


DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM
