org 100h

.data
myarray dw 5 DUP(?) 
newline dw 0Dh, 0Ah, '$' 
msg db "Enter a value:",24H

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset myarray     
    mov cx, 5 
input:
    mov dx,offset newline
    mov ah,09h
    int 21h
    
    mov dx, offset msg
    mov ah, 09h
    int 21h
    
       
    mov ah, 01h
    int 21h
    mov [si], al  
    inc si
loop input

    mov si, offset myarray+3 
    mov cx, 2  

print_loop:
    mov dx,offset newline
    mov ah,09h
    int 21h
    
    mov dl, [si]  
    mov ah, 02h   
    int 21h 
    inc si    
loop print_loop

    mov ah, 4Ch   
    int 21h       
main endp

end main
