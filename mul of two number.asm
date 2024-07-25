;program to multiply two numbers
.model small
.stack 100h
.data 
msg1 db 'enter the fist number$' 
msg2 db 0dh,0ah,'enter the second number$'
msg3 db 0dh,0ah , 'multiplication of two number is $' 
num1 db ?
num2 db ?
.code
main proc
    
  mov ax,@data
  mov ds,ax
  
  mov ah,09h
  mov dx ,offset msg1
  int 21h
  
  mov ah,01h
  int 21h
  sub al,48
  mov num1,al
  
  
  mov ah,09h
  mov dx,offset msg2
  int 21h
  
  mov ah,01h
  int 21h
  sub al,48
  mov num2,al  
  
  mov ah,09h
  mov dx,offset msg3
  int 21h 
  
  mov al,num1
  mul num2
  
  mov dl,al
  add dl,48
  mov ah,02h
  int 21h
  
  mov ah,04ch
  int 21h
  
  main endp
end main