org 100h
include emu8086.inc
.data
value dw ?
.code
main proc
     mov ax,@data
     mov ds,ax
     
     call scan_num
     mov value,cx   
     mov ax,value
     
     cmp ax,-99
     jl l1
     cmp ax,99
     jg l1
     mov ax,1
       
     jmp display
     
     l1:
     mov ax,0
     
     jmp display
     loop l1
     
  display:
  print "The value is: "
call print_num  

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM 