
.model small
.stack 100h
.data
.code
main proc
    
mov ax,@data
mov ds,ax

mov ah,01h
int 21h
mov bl,al

mov ah,01h
int 21h
add bl,al
sub bl,48 
mov dl,bl
mov ah,02h
int 21h

mov ah,04ch
int 21h  
main endp
end main