;write a program that display a message on a screen
;single line comment
;model directive 

.model small       ;(memory model)this line is for assembler not for programmer which create 64kb code or 64kb data segment
.stack 100h        ;stack segment 100h
.data
;all the variable are declared in data segment
;msg is the variable 
    msg db 'MY FIRST ASSEMBLY LANGUAGE PROGRAM $' 
    msg1 db 0dh,0ah,'HEllo word $'  ;0dh for carriage return  , and 0ah for line feed both are used for next lineor new line 
    
.code     ;from here our code start
    main proc                 ;from here in assembly language execution will start  
     mov ax,@data     ;move address of data in ax register
     mov ds,ax        ;mov address of data in data segment ds segment
     
     ;display a string 
     
     mov ah,09h 
     
     ;lea Load Effective Address
     ;load the destination with address of source 
     ;mov dx,offset msg ;no need to write this if we use lea 
      
     lea dx,msg
     int  21h 
     
     mov ah,09h
     lea dx,msg1
     int  21h
     
    ;terminate program by    
    
    mov ah,4ch
    int 21h 
          
main endp 
end main