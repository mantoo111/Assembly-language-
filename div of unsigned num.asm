; Write  a program that divide 2 didgits and print Remainder and Quotient

.model small
.stack 100h
.data
    msg db 'Remainder : $'
    msg1 db 0dh,0ah,  'Quotient : $' 
    rem db ?
    quo db ?
    
.code
main PROC
    mov ax,@data
    mov ds,ax   
    
    mov ax,26 ; AX register is a 16-bit
    mov bl,5
    div bl 
    

    mov rem,ah
    mov quo,al
              
    mov ah,09h
    mov dx,offset msg
    int 21h             
    mov dl,rem
    add dl,48  ;converting binary to ascii
    mov ah,02h
    int 21h 
     
    mov ah,09h
    mov dx,offset msg1
    int 21h     
    mov dl,quo
    add dl,48
    mov ah,02h
    int 21h   

     
    
            
    mov ah,4ch
    int 21h
    
main endp
end main
            
             
             
             
      
      
;    mov ax,6
;    mov bl,2
;    div bl
;    mov bx,ax 
    
;    mov ah,09h
;    mov dx,offset msg
;    int 21h
;    mov dl,bh
;    add dl,48
;    mov ah,02h
;    int 21h 
;    
;    mov ah,09h
;    mov dx,offset msg1
;    int 21h
;    mov dl,bl
;    add dl,48
;    mov ah,02h
;    int 21h      