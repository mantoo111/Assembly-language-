org 100h
.model small
.stack 100h
.data
str1 db 'hello$'  
str2 db 'how are you$'
str3 db 'good to see you$' 
.code  
main proc
     mov ax,@data
     mov ds,ax
     
     mov dx,offset str1
     mov ah,09h
     int 21h
     call enterkey
     
     mov dx,offset str2
     mov ah,09h
     int 21h
     call enterkey
     
      mov dx,offset str3
     mov ah,09h
     int 21h
    
     
     mov ah,04ch
     int 21h   
     main endp
     
     enterkey proc 
          mov dx,10
          mov ah,2
          int 21h
          mov dx,13
          mov ah,2
          int 21h
          ret
           enterkey endp
     end main
          