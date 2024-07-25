;program to add two numbers
.model small
.stack 100h
.data
  
msg1 db 'enter the first numbers $'
msg2 db 0dh,0ah, 'enter the second numbers $'
msg db 0dh,0ah, 'sum of two numbers=$'
num1 db ?  
num2 db ?
.code
main proc


    mov ax,@data
    mov ds,ax   
    
    ;display a message
    mov ah,09h
    lea dx,msg1
    int 21h
    
    ;input a character
    mov ah,01h
    int 21h       ;the number user enter will be store on al register in the form of ASCII e.g 3=51   
    sub al,48    ;51-48=3
    mov num1,al
        
    ;display a second message
    mov ah,09h
    lea dx,msg2
    int 21h 
    
    ;input a character
    mov ah,01h
    int 21h         ;if al=5 then in ASCII =53... 53-48=5
    sub al,48
    mov num2,al
    
    ;display a sum message
    mov ah,09h
    lea dx,msg
    int 21h 

    ;add num1,num2 ;it is illegal to write this in this way
    mov  al,num1
    add al,num2  
    
    ;for displaying the result
    mov dl,al
    add dl,48       ;(----- IMP LINE 
    mov ah,02h
    int 21h

    ;for terminating
    mov ah,4ch
    int 21h

main endp
end main 
;IMP NOTE :
;if to input a number then subtrtract it from 48 
;if you want the result to be displayed on screen then add 48 to dl register