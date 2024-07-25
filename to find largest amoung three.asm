include emu8086.inc
org 100h
.model small
.data
msg1 db 10,13,"enter first number $"   
msg2 db 10,13,"enter second number $"
msg3 db 10,13,"enter third number $"
msg4 db 10,13,"largest number is  $"

num1 db ?
num2 db ?
num3 db ?
.code
main proc
     mov ax,@data
     mov ds,ax
     lea dx,msg1
     mov ah,9
     int 21h
     
    mov ah,1
    int 21h
    mov num1,al
    
     
     lea dx,msg2
     mov ah,9
     int 21h
     
     mov ah,1
    int 21h
     mov num2,al             
                  
                  
     lea dx,msg3
     mov ah,9
     int 21h
     
     mov ah,1
    int 21h
    mov num3,al
    mov ah,9
    mov dx,offset msg4
    int 21h
 
 ; Comparing using jng (Jump not greater)    
    
    mov bl,num1 
    cmp bl,num2   ;num1:num2
    jng number2   ;num1 !> num2  i.e num2 is greater
    cmp bl,num3   ;num1:num3
    jng number3   ;num1 !> num3  i.e num3 is greater
    
    mov dl,num1
    jmp display              
     
    
 number2: 
    
    mov bl,num2
    cmp bl,num3    ;num2 : num3
    jng number3    ;num2 !> num3 i.e num3 is greater
    
    mov dl,num2
    jmp display
    
 number3:
    
    mov dl,num3
    jmp display  


 display:

    mov ah, 02h  
    int 21h 
    
    
    mov ax, 4ch
    int 21h  
    
main endp
end main