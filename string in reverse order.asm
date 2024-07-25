;write a proram that display a string in revrse order
.model small
.stack 100h
.data
msg db 'ANSA ABID$'
strlen equ $-msg  
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov si,0 ;giving value of index 0 to si
    mov cx,strlen
    dec cx ;purpose of this line is that string  does not contain that dollar symbol i.e we 'dec' it start from 'n'
   
   again: 
    push [si]
    inc si    
    loop again  
    mov cx,strlen
    dec cx
    disp:
    pop dx
    mov ah,02h  ;display
    int 21h
    loop disp
    mov ah,4ch
    int 21h  
    main endp
end main
    