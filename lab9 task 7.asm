;TASK7
include emu8086.inc
org 100h
.model small
.stack 100h
.data
i dW 1
j dW 1
count dw ?  
.code
mov ax,@data
mov ds,ax

mov cx,5
l1:
mov count ,cx
mov cx,5

l2:
mov ax,i
call print_num

mov ax,j
call print_num
inc j
loop l2
mov cx,count 
inc i
loop l1 


DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS