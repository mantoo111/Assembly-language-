;Write an Assembly code which take an alphabet from user and print the next and previous alphabets on the screen 
.model small
.stack 100h
.data  
    msg db 'Enter letter $'
    msg1 db 0dh,0ah,'next letter is $'  
     msg2 db 0dh,0ah,'previous letter is $'
    
    temp db ?
.code
main proc
    mov ax,@data
    mov ds,ax 
      ;display the message
    mov ah,09h
    mov dx,offset msg
    int 21h
      ;input a character
    mov ah,01h
    int 21h 
    mov temp,al  ; After the character is inputted, it's stored in the AL register
      ;display the message 
    mov ah,09h
    mov dx,offset msg1
    int 21h 
    
    ;for next letter 
    add temp,1
      ;display next letter:
     mov ah,02h
     mov dl,temp
     int 21h 
     
     ;for previous letter
     
      mov ah,09h
    mov dx,offset msg2
    int 21h  
     ;Sub 
     sub temp,2
     
     mov ah,02h
     mov dl,temp
     int 21h
      ;terminating:
     mov ah,4ch
     int 21h
      
main endp    
end main