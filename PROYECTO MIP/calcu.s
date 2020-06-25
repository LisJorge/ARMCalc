/*-:.:*-:.:*-:.:*-:.:*-:.:*-CALCULADORA:.:*-:.:*-:.:*-:.:*-:.:*-:.:*/
/*Autores:*********************************************************/
/**********Daris Lissette Jorge Rivera*********JR17002*************/
/**********Luis Enrique Chávez Orellana********CO170--*************/
	.include "division.s"
	.include "power.s"
	.include "fileManager.s"
	.data
in1:	.word 0
in2: 	.word 0
op:	.word 0
res:	.word 0
fmt:	.asciz "%d"
msgIn1:	.asciz "Ingresar el primer operando(A):\n"
msgIn2:	.asciz "Ingresar el segundo operando(B):\n"
msgOp:	.asciz "\n  [1]  Suma A+B\n  [2]  Resta A-B \n  [3]  Multiplicación A*B\n  [4]  División A/B\n  [5]  Potenciación A^B\n  [6]  Salir\n"
msgSuma:	.asciz "Suma de la forma: A+B\n"
msgResta:	.asciz "Resta de la forma: A-B\n"
msgMulti:	.asciz "Multiplicación de la forma: A*B\n"
msgDiv:		.asciz "División de la forma: A/B\n"
msgPow: 	.asciz "Potenciación de la forma: A^B\n"
msgDef:		.asciz "Comando no válido"
resultado:	.asciz "Resultado: %d \n"
mip1:	.asciz "                     ....  ....  ....  ......\n"
mipr1:	.asciz "                     |   \\/   |  |  |  |     \\ \n"
mip2: 	.asciz "                     |  |\\/|  |  |  |  |  |>  |\n"
mipr2:	.asciz "                     |  |  |  |  |  |  |  ___/\n"
mip3:	.asciz "                     |..|  |..|  |..|  |..|\n\n"
mip4:	.asciz "    [--]            UNIVERSIDAD DE EL SALVADOR            [--]\n"
mip5:	.asciz "    [--]       Facultad de Ingeniería y Arquitectura      [--]\n"
mip6:	.asciz "    [--]     Escuela de Ing. de Sistemas Informáticos     [--]\n"
mip7: 	.asciz "    [--]     Proyecto:                                    [--]\n"
mip8:	.asciz "    [--]       Calculadora que registra operaciones       [--]\n"
mip9:	.asciz "    [--]     Creado por:                                  [--]\n"
mip10:	.asciz "    [--]             Daris Jorge & Luis Chávez            [--]\n"
mip11:	.asciz "    [--]        SELECCIONAR UNA OPCIÓN PARA INICIAR       [--]\n"
mip12:	.asciz "    [--] .________________________________________________[--]\n"
mip13:	.asciz "    \\_.---------------------------------------------------- /\n"


	.text
	.global main
main:
	//Intefaz inicial
	PUSH {LR}
	LDR R0,=mip1
	BL printf
	LDR R0, =mipr1
	BL printf
	LDR R0,=mip2
	BL printf
	LDR R0, =mipr2
	BL printf
	LDR R0,=mip3
	BL printf
	LDR R0, =mip4
	BL printf
	LDR R0, =mip5
	BL printf
	LDR R0, =mip6
	BL printf
	LDR R0, =mip7
	BL printf
	LDR R0, =mip8
	BL printf
	LDR R0, =mip9
	BL printf
	LDR R0, =mip10
	BL printf
	LDR R0, =mip11
	BL printf
	LDR R0, =mip12
	BL printf
	LDR R0, =mip13
	BL printf
	LDR R0, =msgOp
	BL printf
	//Solicitar operacion a realizar
	LDR R0, =fmt
	LDR R1, =op
	BL scanf
	LDR R0, =op
	LDR R0, [R0]
	CMP R0,#6
	BEQ _case6
_data:	//solicitar operandos 1 y 2
	LDR R0, =msgIn1
	BL printf
	LDR R0, =fmt
	LDR R1, =in1
	BL scanf

	LDR R0, =fmt
	BL fileManager

	LDR R0, =msgIn2
	BL printf
	LDR R0, =fmt
	LDR R1, =in2
	BL scanf
	//cargar valor de operacion
_switch:
	LDR R0, =op
	LDR R0, [R0]
	CMP R0, #1
	BEQ _case1
	CMP R0, #2
	BEQ _case2
	CMP R0, #3
	BEQ _case3
	CMP R0, #4
	BEQ _case4
	CMP R0, #5
	BEQ _case5
	CMP R0, #6
	BEQ _case6
	BNE _default
_case1:
	LDR R0, =msgSuma
	BL printf
	LDR R2,=in1
	LDR R2, [R2]
	LDR R1, =in2
	LDR R1, [R1]
	ADD R1, R1, R2
	LDR R0, =resultado
	BL printf
	BAL _end
_case2:
	LDR R0, =msgResta
	BL printf
	LDR R2,=in2
	LDR R2, [R2]
	LDR R1, =in1
	LDR R1, [R1]
	SUB R1, R1, R2
	LDR R0, =resultado
	BL printf
	BAL _end
_case3:
	LDR R0, =msgMulti
	BL printf
	LDR R2,=in2
	LDR R2, [R2]
	LDR R1, =in1
	LDR R1, [R1]
	MUL R1, R1, R2
	LDR R0, =resultado
	BL printf
	BAL _end
_case4:
	LDR R0, =msgDiv
	BL printf
	//implementando la funcion de division
	LDR R0, =in1
	LDR R0, [R0]
	LDR R1, =in2
	LDR R1, [R1]
	BL division
	MOV R1, R0
	LDR R0, =resultado
	BL printf
	BAL _end
_case5:
	LDR R0, =msgPow
	BL printf
	//implementando la función de power
	//se cargan la base y su potencia
	LDR R0, =in1
	LDR R0, [R0]
	LDR R1, =in2
	LDR R1, [R1]
	BL power
	MOV R1,R0
	LDR R0, =resultado
	BL printf
	BAL _end
_case6:
	BAL _end
_default:
	LDR R0, =msgDef
	BL printf
	BAL _end
_end:
	POP {PC}
exit:
	MOV R7, #1
	SWI 0
