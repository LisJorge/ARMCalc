/*
Archivo: power.s

Descripci�n: Funci�n que realiza la potenciaci�n de dos n�meros de la 
forma A^B

Par�metros:
		R0->A
		R1->B

Salida:		R0=resultado de la potenciaci�n
*/
	.global power
power: 	
	MOV R2,R0
	SUB R1, R1, #1
_powerAux:
	CMP R1, #0
	BEQ _powerend
	MUL R0, R2, R0
	SUB R1, R1, #1
	BAL _powerAux
_powerend:
	BX LR 

