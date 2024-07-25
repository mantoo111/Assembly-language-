org 100h
include emu8086.inc

.data
ARRAY dw 10, 20, 30, 40, 50, 60, 70, 80 ; Example array with 8 elements
n equ 8                                 ; Number of elements in ARRAY

.code
main proc
    MOV SI, OFFSET ARRAY ; Load the address of ARRAY into SI
    MOV CX, n            ; Set up a counter for n elements

; Push elements onto the stack
push_elements:
    MOV AX, [SI]         ; Move the current element into AX
    PUSH AX              ; Push the value of AX onto the stack
    ADD SI, 2            ; Move SI to the next element (each element is 2 bytes)
    LOOP push_elements   ; Repeat until all elements are pushed

    ; Reset SI to the start of the array
    MOV SI, OFFSET ARRAY
    MOV CX, n            ; Reset the counter to n elements

; Pop elements from the stack and store them back in reverse order
pop_elements:
    POP AX               ; Pop the value from the stack into AX
    MOV [SI], AX         ; Store the value of AX into the current element of the array
    ADD SI, 2            ; Move SI to the next element
    LOOP pop_elements    ; Repeat until all elements are popped and stored

; Print the reversed array
printn "Reversed array: "
MOV SI, OFFSET ARRAY
MOV CX, n

print_reversed:
    MOV AX, [SI]         ; Load the current element into AX
    CALL print_num       ; Print the value of AX
    print 10             ; New line
    print 13             ; Carriage return
    ADD SI, 2            ; Move SI to the next element
    LOOP print_reversed  ; Repeat until all elements are printed

RET 
main endp
DEFINE_PRINT_NUM   
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM
;DEFINE_SCAN_NUM_UNS                     ; Return from procedure

end main
