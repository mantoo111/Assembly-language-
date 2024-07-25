include emu8086.inc
org 100h
.data
msg1 db 'enter number ','$'
msg2 db 'after bubble soting   ','$' 
comma db ',','$'
array dw 7 dup(?)
numloop1 db 0
num db 0
numloop2 db 0
num1 db 0
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
    mov si,offset array
cmp numloop1,6
    je l6
jmp l4
     l6:
    mov si,offset array
     mov dx,offset msg2
    mov ah,9
    int 21h
jmp l3
     l3:
cmp num1,7
    je quit
    mov ax,[si]  
   call print_num
     mov dx,offset comma
    mov ah,9
    int 21h
inc si
inc si
inc num1
jmp l3 
    l4:
cmp numloop2,6
     je l5
     mov ax,[si] 
inc si
inc si
    mov bx,[si]
cmp ax,bx
jg l41
inc numloop2
jmp l4
    l41:
    mov [si],ax
    dec si
    dec si
    mov [si],bx
inc si
inc si
inc numloop2
jmp l4
    l5:
inc numloop1 
    mov numloop2,0
jmp l2
    quit:
    ret 
define_scan_num
define_print_num_uns
define_print_num 
