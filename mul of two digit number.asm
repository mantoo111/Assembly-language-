;multiplication of two digit number
.model small
.stack 100h  
include emu8086.inc
.data
msg1 db 'enter 1st number $'
msg2 db ,0ah,0dh, 'enter 2nd number$'             
msg3 db ,0ah,0dh, 'mul of two digit number is$'

var1 dw ?
var2 dw ? 
result dw ?
.code
main proc
     mov ax,@data
     mov ds,ax
     
      mov ax,offset msg1
     mov ah,09h 
     int 21h
     
     
     call scan_num
     mov var1,cx 
     
     
     
         
     mov dx,offset msg2
     mov ah,09h 
     int 21h 
     
      call scan_num
     mov var2,cx 
     
     mov ax,var1
     
     mul var2 
     mov result,ax
  
     
     ; Display the result
  mov dx, offset msg3 
   mov ah,09h 
     int 21h  
     mov ax,result
    call print_num
     
     mov ah,04ch
     int 21h
     
   DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

   
     