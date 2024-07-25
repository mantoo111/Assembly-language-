include emu8086.inc
.DATA
sum dw 0

.CODE

main PROC
mov ax,@data 
mov ds,ax
 mov cx, 0

whileSum:
cmp sum, 100

jnl endWhileSum
add sum, cx
inc cx
mov ax, sum 
call print_num
 
jmp whileSum

endWhileSum:


main ENDP

DEFINE_PRINT_NUM
 DEFINE_PRINT_NUM_UNS
END main
