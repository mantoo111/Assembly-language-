;Write an assembly program which take a number n from user your program should display your name and Reg # n times.
include 'emu8086.inc'

org 100h

.model small
.stack 100h

.data
na dw "Ayesha $"
reg  db "009 $"
newline db 0Dh, 0Ah, '$'     
input_num dw ?               
                                                 
.code

main:
    
    mov ax, @data
    mov ds, ax

   
    print "Enter a number: "
    call scan_num           
    mov input_num, ax       

   
    mov cx, input_num       

display_loop:
    ; Display name
    mov dx, offset na     
    mov ah, 09h             
    int 21h                 

    
    mov dx, offset reg      
    mov ah, 09h            
    int 21h               

   
    mov dx, offset newline 
    mov ah, 09h             
    int 21h               
    cmp cx,input_num
    je display_loop
   ; loop display_loop      

    
    mov ax, 4C00h          
    int 21h

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING

end main
