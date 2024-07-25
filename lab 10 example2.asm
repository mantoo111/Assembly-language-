org 100h
.data
    array db 10h, 20h, 30h, 40h
.code
main proc
    mov al, [array]       ; Move the value at address array into AL
    mov bl, [array+1]     ; Move the value at address array+1 into BL
    mov cl, [array+2]     ; Move the value at address array+2 into CL
    mov dl, [array+3]     ; Move the value at address array+3 into DL
main endp
end main
