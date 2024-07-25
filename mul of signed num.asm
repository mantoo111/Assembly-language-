.model small
.stack 100h

.data
.code
main proc
    
    mov al,-5
    mov bl,1
    imul bl
    
    aam ;(only for signed)when it is converted it caan not be stored in al so ah is used
    mov ch,ah   ;for -5
    mov cl,al   ;for 1
    
    mov dl,cl
    add dl,48
    
    mov ah,02h
    int 21h
    
    mov dl,ch
    add dl,48
    mov ah,02h
    int 21h
    
    mov ah,04ch
    int 21h
    
    main endp
end main
    