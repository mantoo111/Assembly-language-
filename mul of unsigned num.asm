;multiplication of two unsigned numbers
.model small
.stack 100h
.data

.code
main proc
mov al,3
mov bl,4
    
mul bl              ;AX=AL:AH bec when we have ans 10 then 2h will not print properly for that we use AAM ascii adjust before multiplicationthen 1 will store in AH and 0 will store in AL.
AAM
mov ch,ah
mov cl,al

mov dl,ch
add dl,48

mov ah,02h
int 21h

mov dl,cl
add dl,48
mov ah,02h
int 21h

mov ah,04ch
int 21h    
    
main endp
end main
