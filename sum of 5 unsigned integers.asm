;Write a program that reads five unsigned integers from user and display sum of those five integers on the screen.
org 100h

include emu8086.inc
.data
msg1 db "Enter 1st value:",0AH,0DH,24H
msg2 db 0AH,0DH,"Enter 2nd value:",0AH,0DH,24H
msg3 db 0AH,0DH,"Enter 3rd value:",0AH,0DH,24H
msg4 db 0AH,0DH,"Enter 4th value:",0AH,0DH,24H
msg5 db 0AH,0DH,"Enter 5th value:",0AH,0DH,24H
msg6 db 0AH,0DH,"SUM is:",0AH,0DH,24H

input dw ?
sum dw ?

.code
main:
    mov ax,@data
    mov ds,ax
    
    mov dx,offset msg1
    mov ah,09h
    int 21h
    
    call scan_num
    mov input,cx 
    mov sum,cx
    
    
    mov dx,offset msg2
    mov ah,09h
    int 21h
    
    call scan_num
    mov input,cx
    
    mov ax,sum
    add ax,input
    mov sum,ax 
    
    mov dx,offset msg3
    mov ah,09h
    int 21h
    
    call scan_num
    mov input,cx
    
    mov ax,sum
    add ax,input
    mov sum,ax 
    
    mov dx,offset msg4
    mov ah,09h
    int 21h
    
    call scan_num
    mov input,cx
    
    mov ax,sum
    add ax,input
    mov sum,ax
    
    mov dx,offset msg5
    mov ah,09h
    int 21h
    
    call scan_num
    mov input,cx
    
    mov ax,sum
    add ax,input
    mov sum,ax
    
    mov dx,offset msg6
    mov ah,09h
    int 21h  
    
    mov ax,sum
    call print_num
    
    
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM
