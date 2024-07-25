
;Write a program which solve the following equation Z=A-B+C
org 100h  
.data
  num1 db 0
num2 db 0
num3 db 0
msg1 db "Enter value of A?: $"
msg2 db 10,13, "Enter value of B?: $"
msg3 db 10,13, "Enter value of C?: $"
ans db 10,13,"Value of Z is: $"
.code
main proc
mov ax, @data
mov ds, ax
mov dx,offset msg1
mov ah, 09h
int 21h
mov ah, 1
int 21h
sub al,30h    ;effectively subtracts the ASCII value of '0' from the value stored in the al 
mov num1,al

mov dx, offset msg2
mov ah, 09h
int 21h
mov ah, 1
int 21h
sub al,30h
mov num2,al

mov  dx, offset msg3
mov ah, 09h 
int 21h
mov ah,1
int 21h
sub al,30h  
mov num3,al 

 mov bh,num1
 sub bh,num2
 add bh,num3
 add bh,30h  ;add ascii f 0
 
 mov dx,offset ans
 mov ah,09h
 int 21h
 mov dl,bh
 mov ah,2
 int 21h
 main endp  
end main
