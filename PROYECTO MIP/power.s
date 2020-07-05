/*
Archivo: power.s

Descripción: Función que realiza la potenciación de dos números de la 
forma A^B

Parámetros:
		R0->A
		R1->B

Salida:		R0=resultado de la potenciación
*/
	.global power
power:
	CMP R1, #0
	BEQ _powerAux0
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

_powerAux0:
	MOV R0, #1
	BAL _powerend



