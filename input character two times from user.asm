;Write a program that input a character from user 2 times. The program will display the character entered by user 2 times on screen in newline(without using a loop)
;lab 3 task 1
.model small
.stack 100h
.data
msg db 'please enter the character $'
msg2 db 0dh,0ah ,'you have enterd the character $'
msg3 db 0dh,0ah,'please enter another character $'
msg4 db 0dh,0ah,'you have enterd the character $'
temp db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;display msg
    mov ah,09h
    mov dx,offset msg
    int 21h
    
    ;input a character
    mov ah,01h
    int 21h 
    mov temp,al                                               
    
     ;display msg
    mov ah,09h
    mov dx,offset msg2
    int 21h
    
     ; Display the character entered
    mov dl, temp ; Load the character from temp
    mov ah,02h   ; Set function to display character
    int 21h      ; Display the character
  
       ;for displaying second time:
     
     ;display msg2
    mov ah,09h
    mov dx,offset msg2
    int 21h
 
    ; Display the character entered
    mov dl, temp ; Load the character from temp
    mov ah,02h   ; Set function to display character
    int 21h
       
  ;for 2nd character input:   
    ;display msg
    mov ah,09h
    mov dx,offset msg3
    int 21h
     
    ;input a character
    mov ah,01h
    int 21h 
    mov temp,al                                               
    
     ;display msg
    mov ah,09h
    mov dx,offset msg4
    int 21h
     ; Display the character entered
    mov dl, temp ; Load the character from temp
    mov ah,02h   ; Set function to display character
    int 21h      ; Display the character
    
       ;for displaying second time:
     ;display msg2
    mov ah,09h
    mov dx,offset msg4
    int 21h  
    ; Display the character entered
    mov dl, temp ; Load the character from temp
    mov ah,02h   ; Set function to display character
    int 21h  
    ;termination
     mov ah,4ch 
    int 21h
    
main endp
end main                                            