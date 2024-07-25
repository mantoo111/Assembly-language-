;Create an assembly program which take a single digit character (1 to 6 )as input from user your program should display the next two consecutive positive integers and previous one integer.


.model small
.stack 100h
.data
msg db 'enter the number $'
msg1 db 0ah,0dh,'next number is $'    
msg2 db 0ah,0dh,'previous number is $'
msg3 db 0ah,0dh,'next ->next number is $'   
  input  db ?

.code
main proc
     
     mov ax,@data
     mov ds,ax
     
     mov dx,offset msg
     mov ah,09h
     int 21h
     mov ah,01h
     int 21h
     mov  input,al
     
     mov dx,offset msg1
     mov ah,09h
     int 21h
     mov dl,input
     inc dl
     mov ah,02h
     int 21h  
      
     mov dx,offset msg2
     mov ah,09h
     int 21h
     mov dl,input
     dec dl
     mov ah,02h
     int 21h      
     
     mov dx,offset msg3
     mov ah,09h
     int 21h
     mov dl,input
     add dl,2
     mov ah,02h
     int 21h
     