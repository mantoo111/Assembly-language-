include emu8086.inc
org 100h
.data
msg1 db 'enter number ','$'
msg2 db 'enter a key to count its frequency ','$'
msg3 db 'key is present  ','$' 
msg4 db ' times','$'

array dw 20 dup(?)
num db 0 
key dw 0
count dw 0
.code
main proc
   mov ax,@data
    mov ds,ax
    mov si,offset array
    l1:
cmp num,20
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
     print 10
     print 13
     mov dx,offset msg2
    mov ah,9
    int 21h 
    call scan_num
    mov key,cx
    mov si,offset array
    mov num,0
    l3: 
cmp num,20
    je l4
cmp cx,[si]
    je l5
inc si
inc si
inc num
jmp l3
    l4:
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
    l5:
inc count 
inc  si
inc si
inc num
jmp l3
define_scan_num
define_print_num_uns
define_print_num
 
 
