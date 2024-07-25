; Program to check smallest of Three numbers
.model small
.stack 100h
.data
    msg1 db 0dh,0ah,'Enter the first number $'
    msg2 db 0dh,0ah,'Enter the second number $'
    msg3 db 0dh,0ah,'Enter the third number $'
    msg4 db 0dh,0ah,'The smallest number is $' 
    
    num1 db ?  ; or store in bl
    num2 db ?  ; or store in cl
    num3 db ?  ; or store in dl
    
.code
main proc
    mov ax,@data
    mov ds,ax

    ; Taking first input from user  
    mov ah,09h
    mov dx,offset msg1
    int 21h
    mov ah,01h
    int 21h
    mov num1, al

    ; Taking second input from user 
mov ah,09h
    mov dx,offset msg2
    int 21h
    mov ah,01h
    int 21h
    mov num2, al 

    ; Taking third input from user 
    mov ah,09h
    mov dx,offset msg3
    int 21h
    mov ah,01h
    int 21h
    mov num3, al  
    
    ; Displaying Result
    mov ah,09h
    mov dx,offset msg4   
    int 21h
                  
    ; Comparing using jnl (Jump not less)    
    
    mov bl,num1 
    cmp bl,num2   ;num1:num2
    jnl number2   ;num1 !< num2  i.e num2 is less
    cmp bl,num3   ;num1:num3
    jnl number3   ;num1 !< num3  i.e num3 is less
    
    mov dl,num1
    jmp display              
     
    
 number2: 
    
    mov bl,num2
 cmp bl,num3    ;num2 : num3
    jnl number3    ;num2 !< num3 i.e num3 is less
    
    mov dl,num2
    jmp display
    
 number3:
    
    mov dl,num3
    jmp display  


 display:

    mov ah, 02h  
    int 21h 
    
    
    mov ax, 4ch
    int 21h  
    
main endp

end main