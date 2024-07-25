;program to input values in an array
.model small
.stack 100h
.data
  msg db 'enter the values $' 
  msg2 db 0ah,0dh,'entered value in array is $'
  array db 2 dup(?)
.code
main proc
     mov ax,@data
     mov ds,ax  
     
     mov dx,offset msg
     mov ah,09h
     int 21h
     
     mov cx,3
     mov si,offset array  
     l1:
     
     mov ah,01h
     int 21h
     
     mov [si],al 
       add dl,30h
       mov dl,[si] 
        mov ah,02h
     int 21h
         
        inc si
        loop l1
      
       
        
     main endp
end main
     
     

     
     