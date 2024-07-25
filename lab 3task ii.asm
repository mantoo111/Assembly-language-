.code
main proc
    MOV CL, 12     ; Move decimal value 12 into CL
    MOV BL, 65     ; Move decimal value 65 into BL

AGN: 
    INC BL         ; Increment BL register in a loop
    LOOP AGN       ; Repeat the loop until CL becomes zero

    MOV DL, BL     ; Move the value in BL to DL for display

    ; Display command
    mov ah, 02h    ; AH = 02h for displaying a character
    int 21h        ; DOS interrupt for displaying a character

    ; Termination command
    mov ah, 4Ch    ; AH = 4Ch for terminating program
    int 21h        ; DOS interrupt for terminating program
end main

