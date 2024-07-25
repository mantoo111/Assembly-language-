;program to print number from 1-5
 ;0=48
 ;1=49....
.model small
.stack 100h
.data 
;array1 db 5,4,3,2,1

.code
main proc
    mov cx,5     ;for loop
     mov dx,49
    
    l1:   
   ;if you give this line here then it will print only 00000 mov dx,48
    mov ah,02h
     int 21h
    add dx,1 
     
       
     loop l1
     
     mov ah,04ch
     int 21h
     
     main endp
end main