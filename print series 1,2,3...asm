;Print the series 1,2, 3,... n
include emu8086.inc
.DATA
.CODE
main PROC

mov cx,10 ; loop counter decrement
 mov bx,0 ; number := 0
mov ax,0 ; sum := 0
 forever:
inc bx ; add 1 to number

mov ax, bx ;

call print_num
print  ','
 loop forever 
main ENDP
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
END main