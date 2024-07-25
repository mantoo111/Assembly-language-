;Write an assembly language program that will prompt for an integer n and then print the table of n upto 15 . 
include emu8086.inc
.model small
.stack 100h
.data
    
    num1 dw ?
     
    count dw 15 
    newline db 0ah,0dh, '$'
.code
 
     
         mov ax,@data
         mov ds,ax
          print "Enter the number for that table upto 15"
           mov dx,offset newline
         mov ah,09h
         int 21h
    ;input a character
        call scan_num
        mov num1,cx             ;2
    
    mov cx,count         ;loop
    l1:
    
    
    
         mov ax,num1
         mul count 
        dec count 
         
         call print_num 
         mov dx,offset newline
         mov ah,09h
         int 21h          
    loop l1
            
         mov ah,4ch
         int 21h 
         
         DEFINE_PRINT_NUM
         DEFINE_PRINT_NUM_UNS
         DEFINE_SCAN_NUM
    

