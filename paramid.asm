include emu8086.inc
org 100h
.model small
.stack 100h

.data
count dw ?
nextline db 0ah,0dh,'$'

.code

    
    mov ax, @data
    mov ds, ax

   
    mov cx, 5       ; Outer loop counter (rows)
    mov bx, 5       ; Inner loop counter (stars)

l1: 
    mov count, cx   ; Save the outer loop counter (row counter) to count variable
    mov cx, bx      ; Load the inner loop counter (number of stars to print)

l2: 
    print "*"       ; Print a star
    loop l2         ; Loop back to print another star until cx == 0

    ; Print a new line after the stars
    lea dx, nextline
    mov ah, 09h
    int 21h

    ; Restore the outer loop counter from the count variable
    mov cx, count   
    dec bx          ; Decrease the number of stars for the next row
    loop l1         ; Loop back to the start of the outer loop until cx == 0

    ; Exit the program
    mov ax, 4c00h
    int 21h


