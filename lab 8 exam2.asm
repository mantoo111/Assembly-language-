include emu8086.inc
.DATA
smallCount dw 1
largeCount dw 1
.CODE
main PROC
mov ax,@data 
mov ds,ax 

mov bx,5 ; number := 0  

cmp bx, 10
jnl elseLarge


mov dx,offset smallcount
inc smallCount
mov ax, smallCount
call print_num
jmp endValueCheck
elseLarge:
mov dx,offset largecount
inc largeCount
mov ax,smallCount 
call print_num
endValueCheck:
main ENDP  

DEFINE_PRINT_NUM 
DEFINE_PRINT_NUM_UNS
END main



