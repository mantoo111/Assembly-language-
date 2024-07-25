  ;even or odd
.model small
.stack 100h
.data
var1 db ? 
result db ?
remainder db ?
msg1 db 'number is even$'
msg2 db 0ah,0dh,'number is odd $'

.code
main proc
     
     mov ax,@data
     mov ds,ax
     
     mov ah,01h
     int 21h  
     sub al,30h
     
     mov var1,al
     
     mov al,var1
     mov bl,2
     div bl
     mov remainder,ah
     mov dl,remainder
     add dl,48
     mov ah,02h
     int 21h
    ; mov remainder,dl   
     
     cmp remainder,0
     je even
     jmp odd
     
     
     even:  
     mov dx,offset msg1
     mov ah,09h
     int 21h   
     jmp exit
     
     odd:
     mov dx,offset msg2
     mov ah,09h
     int 21h   
 exit:    
     mov ah,04ch
     int 21h
     
     main endp
end main
