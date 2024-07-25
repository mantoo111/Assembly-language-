include emu8086.inc
org 100h
.data
msg1 db 'enter number ','$'
msg2 db 'sum of numbers is    ','$' 
msg3 db 'average of numbers is    ','$'
msg4 db 'numbers larger than average are    ','$' 
msg5 db 'numbers smaller than average are    ','$'
msg6 db 'sum of numbers is    ','$'
array dw 12 dup(?)
num db 0
sum dw 0
avg dw 0
large dw 0
small dw 0
.code
main proc
     mov ax,@data
    mov ds,ax
    mov si,offset array
    l1:
cmp num,12
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
    mov si,offset array
    mov ax,[si]
    add ax,[si+2]
    add ax,[si+4]
    add ax,[si+6]
    add ax,[si+8]  
    add ax,[si+10]
    add ax,[si+12]
    add ax,[si+14]
    add ax,[si+16]
    add ax,[si+18]
    add ax,[si+20]
    add ax,[si+22]
    mov sum,ax
    print 10
    print 13
     mov dx,offset msg2
    mov ah,9
    int 21h
    mov ax,sum
    call print_num
    l3:
    print 10
    print 13
    mov dx,offset msg3
    mov ah,9
    int 21h
   mov dx,0
    mov ax,sum
    mov bx,12
    div bx
    mov avg,ax
    call print_num
    mov num,0 
    mov si,offset array 
    mov bx,avg
    l4:
cmp num,12
    je display
cmp bx,[si]
jg less
jl greater
    je equal
    greater:
inc large
inc num
inc si
inc si
jmp l4
    less:
inc small
inc num
inc si
inc si
jmp l4 
    equal:
inc num
inc si
inc si
jmp l4
    display:
    print 10
    print 13 
    mov dx,offset msg4
    mov ah,9
    int 21h
    mov ax,large
    call print_num
    print 10
    print 13
     mov dx,offset msg5
    mov ah,9
    int 21h
    mov ax,small
    call print_num
define_scan_num
define_print_num_uns
define_print_num
