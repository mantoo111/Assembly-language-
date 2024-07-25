include emu8086.inc
.data
.code
main proc 
mov ax,@data
mov ds,ax     
mov bx,25
mov ax,10

mov dx,ax
cmp ax,bx 
jl l1    

l1:
mov dx,bx
LOOP l1
print "the largest number is"
mov ax,dx
CALL PRINT_NUM

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
END main