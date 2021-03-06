/*
Archivo: division.s

Descripci�n: Funci�n que efect�a la divisi�n de la forma A/B, mediante
restas sucesivas.

Par�metros:
                R0->A
                R1->B

Salida:
                R0->resultado de divisi�n

NOTA: el registro R3 tambi�n es utilizado durante la ejecuci�n de la
operaci�n. No se valida la entrada de n�meros positivos.
*/
        .global division
division:
        mov R3, #0
        CMP R0, #0
        BLE numeradornegativo
        B numeradorpositivo

        positivo:
                CMP R0, R1
                ADDGE R3, R3, #1
                SUBGE R0, R0, R1
                BGE positivo
                BAL _return

        negativo:
                CMP R0, R1
                SUBGE R3, R3, #1
                SUBGE R0, R0, R1
                BGE negativo
                BAL _return

        numeradornegativo:
                MOV R2, #-1
                MUL R0, R0, R2
                CMP R1, #0
                BGE negativo
                MOV R2, #-1
                MUL R1, R1, R2
                B positivo

        numeradorpositivo:
                CMP R1, #0
                BGE positivo
                MOV R2, #-1
                MUL R1, R1, R2 
                B negativo
_return:
        MOV R0, R3
        BX LR
        