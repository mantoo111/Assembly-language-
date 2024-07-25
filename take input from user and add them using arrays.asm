;Create an assembly program which takes 3 inputs from the user save the values in array. your program should display the sum of all the numbers in the array.    
include 'emu8086.inc'
.model small
.stack 100h
.data
array1 db 2 dup(?)       ;syntax for taking input from user 
;? show value will be enter by the user

.code
main proc
    
mov ax,@data
mov ds,ax

mov cx,2    ;how many times
mov si,offset array1
print "enter 2 number in array"  

l1:    ;loop for input
mov ah,01h    ;store in al register
int 21h
 mov [si],al
 inc si        
 
loop l1 ;loop for displaying  
   mov si,offset array1      ;after entering values what is the address store that in si
  mov cx,2  
  print "value you entered are" 
    
  l2:
  mov dl,[si]  
    
   mov ah,02h
   int 21h 
    inc si
    loop l2             
    
    mov si,offset array1
    mov cx,2
    
    l3:
    mov dl,[si]
    inc si
    add [si],dl
   mov ah,02h
   int 21h
   
   loop l3 
    
    mov ah,04ch
    int 21h
    
    
    
    main endp
end main