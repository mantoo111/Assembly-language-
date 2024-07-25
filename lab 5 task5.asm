org 100h                   

.data 
array db 2 dup(?)
msg db "enter the number $"  
result db ?
var1 db ?
.code
main proc
   mov ax,@data
   mov ds,ax
   mov si,offset array 
   
       
   mov dx,offset msg 
   mov  ah,09h
   int 21h  
   
   mov ah,01h
   int 21h
   
   mov [si],al  
   mov bl,[si]  
   
   
        
   mov dx,offset msg 
   mov  ah,09h
   int 21h  
   
   mov ah,01h
   int 21h
   
   mov [si+1],al  
   mov cl,[si+1]
   sub bl, 30h  ; Convert ASCII to number for the first character
   sub cl, 30h
   
   add bl,cl  
   mov result,bl
   mov dl,result 
   add dl,30h    
     mov ah,02h
     int 21h
              
     mov ah,04ch
     int 21h
              
     main endp
end main