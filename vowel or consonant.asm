;write  a character from keyboard and determine whether the character is a vowel or consonant,program should display proper msg
.model small
.stack 100h
.data
msg db '  enter the character $'
msg1 db 0dh,0ah,'character is vowel $'
msg2 db 0dh,0ah,'character is consonant $'

.code
main proc
    mov ax,@data
    mov ds,ax
    ;display a message
    mov ah,09h
    lea dx,msg
    int 21h
    ;input a character
    mov ah,01h
    int 21h
                 ;compare  al register are used
    cmp al,'a'
    je vowel  
    cmp al,'e'
    je vowel
    cmp al,'i'
    je vowel
    cmp al,'o'
    je vowel
    cmp al,'u'
    je vowel
    ;if from above all option no one match then below msg will appear
    mov ah,09h
    lea dx,msg2
    int 21h 
    jmp exit  ;this line mean to jump to exit statement
   
    vowel:
    mov ah,09h
    lea dx,msg1
    int 21h 
   
    exit:
    ;for terminating
    mov ah,4ch
    int 21h
main endp 
end main