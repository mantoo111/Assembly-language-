;program to print array using loop
.model small
.stack 100h
.data

 arr1 db 'a','b','c'

.code
main proc
    
 mov ax,@data
 mov ds,ax
 
 mov si,offset arr1   
    
  ; for loop 
  ; how many times  we use cx and send number to that
    
    mov cx,3
    l1:    ;what to do in the loop
     mov dx,[si]
     mov ah,2     ;printing
     int 21h
     
     
     
     inc si ;incrementing si
    loop l1  
    
    mov ah,04ch
    int 21h
    
    
    
    
main endp
end main