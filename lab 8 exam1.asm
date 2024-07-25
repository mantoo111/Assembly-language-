include emu8086.inc
.DATA
.CODE
main PROC
mov bx,0 ; number := 0
mov ax,0 ; sum := 0
forever:
inc bx ; add 1 to number
mov ax, bx ; add number to sum call print_num  
call print_num
print ','
jmp forever ; repeat
main ENDP
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
END main








































































