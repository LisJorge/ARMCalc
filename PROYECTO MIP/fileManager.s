/*
 Archivo: fileManager.s

 Descripción: Función que crea un archivo que registra las operaciones
	que se realizan  en la calculadora (calcu.s)

 Parámetros:
	R0-->texto a escribir
	R1-->longitud máxima del texto
*/
	.data
msgError:	.asciz "Error al crear el archivo\n"
nomFile:	.asciz "registroOp"
texto:		.skip 100
	.text
	.global fileManager
fileManager:
	LDR R0,=texto
	STR R0, [R0]
	/*

	MOV R7, #5 //Syscall 5:abrir
	LDR R0, =nomFile //nombre del archivo
	MOV R1, #0x42 //crea el archivo sino existe R&W
	LDR R2, =0666 //dar permiso de leer y escribir
	SVC 0
	//como resultado retorna el descriptor del archivo en R0
	MOV R4, R0
	CMP R0, #-1 //para comprobar si ocurrio un error
	BEQ _errorFile
	MOV R7, #4 //syscal 4 escribir
	MOV R0, R4
	LDR R1, =texto
	MOV R2, #100
	SWI 0
	//cerrar el archivo
	MOV R7, #6
	SVC 0
	BAL _exitFile
	*/
	LDR R0, =nomFile
	MOV R1, #0x42
	MOV R2, #384
	MOV R7, #5
	SVC 0
	CMP R0, #-1
	BEQ _errorFile
	MOV R4, R0

	LDR R1, =texto
	MOV R2, #24
	MOV R7, #4
	SVC 0

	MOV R7, #6
	SVC 0
	MOV R0, R4
	BAL _exitFile
_errorFile:
	LDR R0, =msgError
	BL printf
	BAL _exitFile
_exitFile:
	BX LR

