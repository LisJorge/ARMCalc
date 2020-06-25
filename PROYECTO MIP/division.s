/*
Archivo: division.s

Descripción: Función que efectúa la división de la forma A/B, mediante
restas sucesivas.

Parámetros:
                R0->A
                R1->B

Salida:
                R0->resultado de división

NOTA: el registro R3 también es utilizado durante la ejecución de la
operación. No se valida la entrada de números positivos.
*/
        .global division
division:
        CMP R0, R1
        ADDGE R3, R3, #1
        SUBGE R0, R0, R1
        BGE division
        BAL _return
_return:
        MOV R0, R3
        BX LR