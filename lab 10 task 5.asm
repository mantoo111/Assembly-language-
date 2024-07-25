include emu8086.inc
org 100h
.data
msg1 db 'enter number ','$'
msg2 db 'minimum number is ','$' 
msg3 db 'minimum number is present  ','$'
msg4 db ' times ','$'
array dw 7 dup(?)
maxnum dw 0
num db  0
count dw 0 
.code
main proc
    mov ax,@data
    mov ds,ax
    mov si,offset array
    l1:
cmp num,7
    je l2
    mov dx,offset msg1
    mov ah,9
    int 21h
    call scan_num
    mov [si],cx
    print 10
    print 13
inc si
inc si

inc num
jmp  l1
    l2:
    mov num,0
    mov si,offset array
    mov cx,[si]
    l3: 
cmp num,7
    je l4 
cmp cx,[si]
jg l5
inc si
inc si
inc num
jmp l3
    l5:
    mov cx,[si]
inc num
inc si
inc si
jmp l3
    l4:
     print 10
     print 13
     mov dx,offset msg2
    mov ah,9
    int 21h 
   mov ax,cx
    call print_num
     mov num,0
    mov si,offset array
    l6:
cmp num,7
    je l7
cmp cx,[si]
     je l8
inc si
inc si
inc num

jmp l6
    l8:
inc count
inc si
inc si
inc num
jmp l6 
    l7:
    print 10
    print 13
    mov dx,offset msg3
    mov ah,9
    int 21h 
    mov ax,count
    call print_num
    mov dx,offset msg4
    mov ah,9
    int 21h
    ret
define_scan_num
define_print_num_uns
define_print_num

