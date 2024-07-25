     ;To read a character from keyboard  
;lab3 example 
org 100h
.data
Msg db 'a $'
.code
 main proc
 
mov ax, @data
mov ds, ax

mov dx, offset Msg
mov ah, 9
INT 21H

mov ah,04ch
int 21h

main endp
end main