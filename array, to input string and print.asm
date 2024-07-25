;program to input string and print it
.model small
.stack 100h
.data
var db 100 dup('$')   ;print like  first string code$$$$$$$$$$$$$$$$$$$$$$$ upto so on
.code
main proc
mov ax,@data
mov ds,ax

mov si,offset var 
l1:
mov ah,01h
int 21h
            ;kab tak input lena  ha jab tak user enter key press nahi karta

cmp al,13 ;ASCII code of enter key means if user press enter key then program end
je programend  ;if Enter key pressed, jump to programend i.e to display
  
    
mov [si],al    ;Store the character in the buffer
inc si
jmp l1       ; Repeat until Enter key pressed
programend  :  
 
    
 mov dx,offset var
 mov ah,09h
 int 21h
 
   
      mov ah, 4Ch     ; Exit program
    int 21h

    
    
    
main endp
end main