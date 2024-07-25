org 100h
include emu8086.inc

.data
array dw 3 DUP (?)
input dw ?

.code
mov ax, @data
mov ds, ax

mov si, offset array
mov bx, 3

input_loop:
    print "Enter a value: "
    call scan_num
    mov [si], cx
    add si, 2           ; Increment by 2 because each array element is a word (2 bytes)
    dec bx
    cmp bx, 0
    jnz input_loop

print "Enter a value to search in the array: "
call scan_num
mov input, cx

mov si, offset array
mov bx, 3

search:
    mov cx, [si]
    cmp cx, input
    je found
    add si, 2           ; Move to the next word in the array
    dec bx
    cmp bx, 0
    jnz search

print "KEY NOT FOUND"

found:
print "KEY FOUND"




DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

