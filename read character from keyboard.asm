;To read a character from keyboard  
;lab3 example 
org 100h
.data

inMsg db 'Enter a character  $'
outMsg db 0dh,0ah,'User enter character $'
temp db ?
.code
 main proc


;To display input message mov 
mov ax, @data
mov ds, ax

mov dx, offset inMsg
mov ah, 9
INT 21H


;Get input from keyboard
mov ah,1h
INT 21H 
mov temp,al  

mov dx, offset outMsg
mov ah, 9
INT 21H  

mov dl,temp
mov ah,02h
int 21h

mov ah,04ch
int 21h

main endp
end main