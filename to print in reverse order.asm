;program to print number from 1-5 in reverse order
 ;0=48
 ;1=49....
.model small
.stack 100h
.data 
;array1 db 0,1,2,3,4

.code
main proc
    mov cx,5
     mov dx,52
    
    l1:   
   ;if you give this line here then it will print only 00000 mov dx,48
    mov ah,02h
     int 21h
    sub dx,1 
     
       
     loop l1   ;repeat the loop
     
     mov ah,04ch
     int 21h
     
     main endp
end main