;traverse the whole string and print each character with space 
org 100h
.data 
str1 db "enter the string$" 
str2 db 13,10,"string output $"
arr db 10 dup('$')

.code
mov ax,@data
mov ds,ax
lea dx,str1
mov ah,09h
int 21h

mov ah,10     ;for taking string input
lea dx,arr
;mov arr,8
int 21h

lea dx,str2
mov ah,09h
int 21h 

mov ch,0
mov cl,arr[1] ;for loop
mov si,2            ;at 0th index size of array is placed 
                     ;at 1 index counter of character that user enter is placed
mov ah,02h      ;display character by character

output:
mov dl,arr[si]
int 21h       
inc si
mov dl,' '
int 21h
loop output