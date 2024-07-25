;first array program
.model small
.stack 100h  
.data
arr1 db 1,2,3,4
.code
main proc
    mov ax,@data
    mov ds,ax               ;si (source index)register is used to point to access array
    
    mov si,offset arr1  ;giving address of first element to si register
    
    mov dx,[si] ;[] this is for accesssing the value at that address
    mov ah,2h
    int 21h
    
    inc si
    mov dx,[si]
    mov ah,2h
    int 21h
    
    
    main endp
    end main 