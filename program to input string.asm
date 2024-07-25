org 100h
.data
var1 db 10 dup(?)
.code
main proc
mov ax,@data
mov ds,ax
     mov ah,10
   lea dx,var1
   mov var1,6
   int 21h 