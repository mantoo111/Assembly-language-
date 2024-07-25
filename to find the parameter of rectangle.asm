;Create a program to find the perimeter of the Rectangle , let length and width of rectangle are input form  the user 
;Perimeter of rectangle = 2(length+width)  
org 100h
include emu8086.inc
.data 
l dw ?
w dw ?
p dw ? 
prompt db "Enter the length of the rectangle:",0AH,0DH,'$'
prompt1 db 0AH,0DH,"Enter the width of the rectangle:",0AH,0DH,'$'
msg db 0AH,0DH,"Perimeter of the rectangle is: $",,0AH,0DH

.code
start:
    mov ax, @data
    mov ds, ax
    
    
    mov dx, offset prompt
    mov ah, 09h
    int 21h
    
    
    call scan_num
    mov l,cx
    
    mov dx, offset prompt1
    mov ah, 09h
    int 21h
     
    call scan_num
    mov w,cx
    
    
    mov ax,l
    add ax,w
    mov p,ax
    
    
    mov ax, p
    mov bx, 2
    mul bx 
    mov p, ax 
    
  
    mov dx, offset msg
    mov ah, 09h
    int 21h
    
   
    mov ax,p
    call print_num
    
    
    
    mov ax, 4C00h
    int 21h 
     
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

