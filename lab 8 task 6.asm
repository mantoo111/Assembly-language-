org 100h
include emu8086.inc

.data
array dw 10 DUP (?)
array_size = 10

.code
mov ax, @data
mov ds, ax

mov si, offset array
mov bx, array_size
input_loop:
    print "Enter a value: "
    call scan_num
    print 0AH,0DH
    mov [si], cx   
    add si, 2
    dec bx
    cmp bx, 0
    jnz input_loop

print "Enter a value to search in the array:"
call scan_num 
print 0AH, 0DH

mov si, offset array
mov bx, array_size
search:
    cmp [si], cx   
    je found
    add si, 2     
    dec bx
    cmp bx, 0
    jnz search

    
    print "KEY NOT FOUND"
    jmp end

found:
    print "KEY FOUND"

end: 
    hlt

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
