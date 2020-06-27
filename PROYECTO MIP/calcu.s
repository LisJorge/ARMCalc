/*-:.:*-:.:*-:.:*-:.:*-:.:*-CALCULADORA:.:*-:.:*-:.:*-:.:*-:.:*-:.:*/
/*Autores:*********************************************************/
/**********Daris Lissette Jorge Rivera*********JR17002*************/
/**********Luis Enrique Chávez Orellana********CO17008*************/
	.include "division.s"
	.include "power.s"
	.data
in1:	.word 0
in2: 	.word 0
res:	.word 0
op:	.word 0
fmt:	.asciz "%d"
nomFile:	.asciz "registro.txt"
modo:		.asciz "a"
msgIn1:	.asciz "Ingresar el primer operando(A):\n"
msgIn2:	.asciz "Ingresar el segundo operando(B):\n"
msgOp:	.asciz "\n  [1]  Suma A+B\n  [2]  Resta A-B \n  [3]  Multiplicación A*B\n  [4]  División A/B\n  [5]  Potenciación A^B\n  [6]  Salir\n\n"
msgDef:		.asciz "Comando no válido\n"
//para guardar en archivo
tipoOp1:	.asciz "Operación: %d + %d\t"
tipoOp2:	.asciz "Operación: %d - %d\t"
tipoOp3:	.asciz "Operación: %d x %d\t"
tipoOp4:	.asciz "Operación: %d / %d\t"
tipoOp5:	.asciz "Operación: %d ^ %d\t"
resultado:	.asciz "Resultado: %d \n"
fin:		.asciz "\n.............................................................\n\n"
//para preguntar si desea hacer otra operacion
ask:		.asciz "\n¿Desea realizar otra operación?\n  [1] Sí\n  [0] No\n\n"
answer:		.word 0
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
	PUSH {LR}
	//Intefaz inicial
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
_menu:
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
		LDR R0, =msgIn1
		BL printf
		LDR R0, =fmt
		LDR R1, =in1
		BL scanf
		MOV R5, R0 //NUMERO DE CARACTERES
		LDR R0, =msgIn2
		BL printf
		LDR R0, =fmt
		LDR R1, =in2
		BL scanf
		//Impresión de la operacion a ejecutar
		LDR R0, =tipoOp1
		LDR R2, =in1
		LDR R2, [R2]
		LDR R1, =in2
		LDR R1, [R1]		
		BL printf

		LDR R2,=in1
		LDR R2, [R2]
		LDR R1, =in2
		LDR R1, [R1]
		ADD R1, R1, R2
		LDR R3, =res
		STR R1, [R3]
		LDR R0, =resultado
		BL printf

		BAL _fileRegister
	_case2:
		LDR R0, =msgIn1
		BL printf
		LDR R0, =fmt
		LDR R1, =in1
		BL scanf
		MOV R5, R0 //NUMERO DE CARACTERES
		LDR R0, =msgIn2
		BL printf
		LDR R0, =fmt
		LDR R1, =in2
		BL scanf
		//Impresión de la operacion a ejecutar
		LDR R0, =tipoOp2
		LDR R2, =in2
		LDR R2, [R2]
		LDR R1, =in1
		LDR R1, [R1]
		BL printf

		LDR R2,=in2
		LDR R2, [R2]
		LDR R1, =in1
		LDR R1, [R1]
		SUB R1, R1, R2
		LDR R3, =res
		STR R1, [R3]
		LDR R0, =resultado
		BL printf
		BAL _fileRegister
	_case3:
		LDR R0, =msgIn1
		BL printf
		LDR R0, =fmt
		LDR R1, =in1
		BL scanf
		MOV R5, R0 //NUMERO DE CARACTERES
		LDR R0, =msgIn2
		BL printf
		LDR R0, =fmt
		LDR R1, =in2
		BL scanf
		//Impresión de la operacion a ejecutar
		LDR R0, =tipoOp3
		LDR R2, =in2
		LDR R2, [R2]
		LDR R1, =in1
		LDR R1, [R1]
		BL printf

		LDR R2,=in2
		LDR R2, [R2]
		LDR R1, =in1
		LDR R1, [R1]
		MUL R1, R1, R2
		LDR R3, =res
		STR R1, [R3]
		LDR R0, =resultado
		BL printf
		BAL _fileRegister
	_case4:
		LDR R0, =msgIn1
		BL printf
		LDR R0, =fmt
		LDR R1, =in1
		BL scanf
		MOV R5, R0 //NUMERO DE CARACTERES
		LDR R0, =msgIn2
		BL printf
		LDR R0, =fmt
		LDR R1, =in2
		BL scanf
		//Impresión de la operacion a ejecutar
		LDR R0, =tipoOp4
		LDR R2, =in2
		LDR R2, [R2]
		LDR R1, =in1
		LDR R1, [R1]
		BL printf

		//implementando la funcion de division
		LDR R0, =in1
		LDR R0, [R0]
		LDR R1, =in2
		LDR R1, [R1]
		BL division
		MOV R1, R0
		LDR R3, =res
		STR R1, [R3]
		LDR R0, =resultado
		BL printf
		BAL _fileRegister
	_case5:
		LDR R0, =msgIn1
		BL printf
		LDR R0, =fmt
		LDR R1, =in1
		BL scanf
		MOV R5, R0 //NUMERO DE CARACTERES
		LDR R0, =msgIn2
		BL printf
		LDR R0, =fmt
		LDR R1, =in2
		BL scanf
		//Impresión de la operacion a ejecutar
		LDR R0, =tipoOp5
		LDR R2, =in2
		LDR R2, [R2]
		LDR R1, =in1
		LDR R1, [R1]
		BL printf

		//implementando la función de power
		//se cargan la base y su potencia
		LDR R0, =in1
		LDR R0, [R0]
		LDR R1, =in2
		LDR R1, [R1]
		BL power
		MOV R1,R0
		LDR R3, =res
		STR R1, [R3]
		LDR R0, =resultado
		BL printf
		BAL _fileRegister
	_case6:
		BAL _end
	_default:
		LDR R0, =msgDef
		BL printf
		BAL _end

_fileRegister: //registra en un archivo las operaciones
	//registrar resultado
	PUSH {R0 -R4}
	LDR R0, =nomFile
	LDR R1, =modo
	BL fopen
	LDR R1, =resultado
	LDR R2, =res
	LDR R2, [R2]
	BL fprintf

	//registrar operacion
		//switch para elegir operacion a registrar
	_switch2:
		LDR R0, =op
		LDR R0, [R0]
		CMP R0, #1
		BEQ _case11
		CMP R0, #2
		BEQ _case22
		CMP R0, #3
		BEQ _case33
		CMP R0, #4
		BEQ _case44
		CMP R0, #5
		BEQ _case55

		_case11:
			LDR R0, =nomFile
			LDR R1, =modo
			BL fopen
			LDR R1, =tipoOp1
			BAL _endswitch2
		_case22:
			LDR R0, =nomFile
			LDR R1, =modo
			BL fopen
			LDR R1, =tipoOp2
			BAL _endswitch2
		_case33:
			LDR R0, =nomFile
			LDR R1, =modo
			BL fopen
			LDR R1, =tipoOp3
			BAL _endswitch2
		_case44:
			LDR R0, =nomFile
			LDR R1, =modo
			BL fopen
			LDR R1, =tipoOp4
			BAL _endswitch2
		_case55:
			LDR R0, =nomFile
			LDR R1, =modo
			BL fopen
			LDR R1, =tipoOp5
			BAL _endswitch2
	_endswitch2:
		LDR R2, =in1
		LDR R2, [R2]
		LDR R3, =in2
		LDR R3, [R3]
		BL fprintf
	POP {R0 - R4}



	BAL _pregunta

_pregunta:
	LDR R0, =ask
	BL printf
	LDR R0, =fmt
	LDR R1, =answer
	BL scanf
	LDR R1, =answer
	LDR R1, [R1]
	CMP R1, #1
	BEQ _menu
	BAL _end

_end:
	LDR R0, =nomFile
	LDR R1, =modo
	BL fopen
	LDR R1, =fin
	BL fprintf

	POP {PC}
exit:
	MOV R7, #1
	SWI 0
