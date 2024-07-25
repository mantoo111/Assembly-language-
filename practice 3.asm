Write an Assembly code which take an alphabet from user and print the next and previous alphabets on the screen
;lab3 task 3
.model small
.stack 100h
.data
    msg db 'Enter the Letter in Lower Case $'
    msg1 db 0dh,0ah,'Next letter is: $ '
    msg2 db 0dh,0ah,'Previous letter is: $ '
    temp db ?
    

.code
main PROC
    mov ax,@data
    mov ds,ax
    
    ; Display the message
    mov ah,09h
    mov dx,offset msg
    int 21h
    
    ; Input a character
    mov ah,01h
    int 21h
    mov temp,al
    
    ; Display the next msg
    mov ah,09h
    mov dx,offset msg1
    int 21h
    
    ; Increment character
    mov al, temp
    inc al
    mov dl, al
    mov ah,02h
    int 21h   
    
    ; Display the previous character
    mov ah,09h
    mov dx,offset msg2
    int 21h
    
    ; Decrement character
    mov al, temp
    dec al
    mov dl, al
    mov ah,02h
    int 21h 
    
    mov ah,4ch 
    int 21h
    
main endp
end main
