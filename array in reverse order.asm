;Define 5 different 8-bit Numbers. Write a program to do the following: 
;? Use the DB directive to define the following list of numbers and name it myarray. 36h, 37h, 38h,39h,40h Display the array  
;n reverse order 

.model small 
.stack 100h
.data
myarray db 36h,37h,38h,39h,40h  
fornewline db 0ah,0dh,'$'

.code
main proc
     mov ax,@data
     mov ds,ax
     mov si,offset myarray+4
     mov cx,5
     
     l1:
     dec si       ; Move SI to the previous element
     mov dl, [si] ; Load the byte from memory into DL
     mov ah, 02h  ; Function to display character
     int 21h      ; Display the character
     
     mov dx, offset fornewline  ; Move to a new line
     mov ah, 09h                ; Function to display string
     int 21h          
     loop l1
     mov ah,04ch
     int 21h
     main endp 
end main
     