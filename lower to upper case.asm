;write a program to input character in lower and display to upper case
;a--)97   A-->65        97-32=65
;b--)98   B-->66        98-32=66 
;upper case to lower case:
;A--)65    a--)97     65+32=97  
.model small
.stack 100h
.data  
    msg db 'Enter letter in lower case $'
    msg1 db 0dh,0ah,'letter in upper case is $'
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
    mov temp,al  ; After the character is input, it's stored in the AL register
      ;display the message 
    mov ah,09h
    mov dx,offset msg1
    int 21h 
      ;code for lower to upper:
    sub temp,32
      ;display a character in upper case:
     mov ah,02h
     mov dl,temp
     int 21h
      ;terminating:
     mov ah,4ch
     int 21h
      
main endp    
end main