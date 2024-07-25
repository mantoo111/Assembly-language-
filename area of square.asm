;Create a program to find the area of the square , let length of side of square (s) is input form the user  Area of square =  
;Display the area 

.model small
.stack 100h 
include emu8086.inc
.data
msg1 db 'enter the side$'    
length dw ?
area dw ?
msg db 0ah,0dh,'$'
.code
main proc

mov ax,@data
mov ds,ax

mov dx,offset msg1
mov ah,09h
int 21h


call scan_num
mov length,cx  ;if multiplier is ax then multiplicant should also be ax,bx,cx etc

mov ax,length
mov bx,length
mul bx
mov area,ax


    mov dx, offset msg
    mov ah, 09h
    int 21h
mov ax,area
call print_num

mov ax,04ch
int 21h
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM
 