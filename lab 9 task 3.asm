;lab 9task3
include emu8086.inc
org 100h
.model small
.stack 100h

.data
    sum dw 0             
    count dw 3           
    sum_display db 'Sum: $', 0   
    count_display db 'Count: $', 0 
 

.code
start:
    mov ax, @data
    mov ds, ax

   
   
while_start:
   
    mov ax, sum
    cmp ax, 999
    jge while_end  

    ; Check the condition (count < 9)
    mov cx, count
    cmp cx, 9
    jge while_end  ; Jump to while_end if count >= 9

    ; Increment sum by count
    add ax, cx
    mov sum, ax

    ; Increment count by 3
    add cx, 3
    mov count, cx

    ; Display count
    mov dx, offset count_display
    mov ah, 09h
    int 21h

    mov ax, count
    call print_num
    ; Print a new line
    mov ah, 02h
    mov dl, 0Ah
    int 21h

    ; Display sum
    mov dx, offset sum_display
    mov ah, 09h
    int 21h

    mov ax, sum
    call print_num
    ; Print a new line
    mov ah, 02h
    mov dl, 0Ah
    int 21h

    
    jmp while_start

while_end:
   
    mov ax, 4C00h
    int 21h
    
    DEFINE_print_NUM
    DEFINE_PRINT_NUM_UNS
    DEFINE_SCAN_NUM