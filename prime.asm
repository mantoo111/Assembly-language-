include emu8086.inc
org 100h
.data
n dw ?
i dw 2
flag dw 0
.code                  
print "Enter a number:"
call scan_num
mov n,cx

cmp n,0
je not_prime
cmp n,1
je not_prime
mov ax,cx
mov bx,2
div bx
mov cx,ax
l1:
mov ax,n
div i
cmp dx,0
je not_prime
loop l1
print 0AH,0DH
print "It is a prime number"
jmp end

not_prime:
print 0AH,0DH
print "It is not a prime number"
jmp end

end: hlt 

DEFINE_SCAN_NUM