;Write a program to print an array( 'a','b', 'c') using loop?
.model small
.stack 100h
.data
    array db 'aaa$'  ; Define an array containing characters 'a', 'b', and 'c'
    newline db 0Dh, 0Ah, '$'
.code
main proc
    ; Initialize the data segment
    mov ax, @data
    mov ds, ax

    ; Display the array using a loop
    mov si, offset array 
    
    mov cx,3; Initialize SI to point to the start of the array
    
print_loop:
    mov dl, [si]          ; Load the character at SI into AL
        mov ah, 02h   
    int 21h 
             ; Check if the end of the array is reached
                 ; Call DOS interrupt to display the character
    inc si  
loop print_loop                  ; Move to the next character in the array
           ; Repeat the loop

    mov dx, offset newline
    mov ah, 09h         ; Function 09h: Display string
    int 21h  

    ; Terminate program
    mov ah, 4Ch          ; Function 4Ch: Terminate program
    int 21h              ; Call DOS interrupt
main endp
end main
