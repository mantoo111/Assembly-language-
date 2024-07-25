include emu8086.inc
.model small
.stack 100h
.data
array1 db 2,4,5,6
array2 db 2,4,5,6
.code
main proc
     
     mov ax,@data
     mov ds,ax
     mov si, offset array1
     
     mov di, offset array2
     mov cx,4
     
     l1 :
     mov al,[si]
     mov bl,[di]
     
     cmp al,bl
     jne notsmall
     
     inc si
     inc di
     loop l1
     print "both are same"
     
     mov ah,04ch
     int 21h
     
     
     notsmall:
     print "both are not same"
     mov ah,04ch
     int 21h 
     main endp
end main
     