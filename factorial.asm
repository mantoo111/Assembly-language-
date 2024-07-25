org 100h 
include emu8086.inc
.data
x dw 5
f dw 1
i dw 1
.code
main proc
     mov ax,@data
     mov ds,ax
     
     
     mov cx,x
     start:
     mov ax,f
     mul i
     mov f,ax
     inc i 
     cmp i,cx
     jle start 
     
     mov ax,f
     call print_num
     
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
     
     
     
     
     
     