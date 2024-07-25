;Use of LEA with memory variables 
ORG 100h 
 
.data 
 
VAR1 DB 22h 
 
.code 
 
MOV AL, VAR1 	 	; check value of VAR1 by moving it to AL. 
LEA BX, VAR1 	; get address of VAR1 in BX. 
MOV BYTE PTR [BX], 44h 	; modify the contents of VAR1. 
 
MOV AL, VAR1 	; check value of VAR1 by moving it to AL. 
END 
