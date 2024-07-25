;program to print a name with character
.model small
.stack 100h
.data
.code
main proc
mov ax,@data
mov ds,ax

mov dl,'a'
mov ah,02h
int 21h   

mov dl,'n'
mov ah,02h
int 21h

mov dl,'s'
mov ah,02h
int 21h

mov dl,'a'
mov ah,02h
int 21h

mov ah,04ch
int 21h    
    
    
main endp
end main