;Write a program to add first 20 even integers using loops. The result should be displayed after each step.
include emu8086.inc
org 100h

.model small
.stack 100h

.data
result dw ?         
counter dw 20        
sum dw 0             
newline db 0Dh, 0Ah, '$' 
.code

main:
    mov ax, @data     
    mov ds, ax

    mov bx, 2         
    mov cx, counter   

add_loop:
    add sum, bx  
    mov ax,sum    
    mov result, ax   

    ; Display the result
    mov ax, result    
    call print_num 
    MOV DX,offset newline
    mov ah,09h
    int 21h  

    add bx, 2        

    loop add_loop    

   
    mov ah, 4Ch       
    int 21h

  DEFINE_PRINT_NUM 
DEFINE_PRINT_NUM_UNS 
DEFINE_SCAN_NUM  


end main


