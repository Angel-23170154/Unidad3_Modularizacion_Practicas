; PROGRAMA 5: Macro de reemplazo de texto (MostrarMensaje)
; Define una macro para imprimir mensajes y la invoca dos veces.
; Alumno: Jose Angel Garcia Chavez - 23170154
; Docente: Ing. Jose Luis Medina Jimenez

INCLUDE Irvine32.inc            

; Sintaxis del macro
MostrarMensaje MACRO texto      ; Macro con un parametro: la etiqueta del mensaje
    mov edx, OFFSET texto       ; EDX = direccion del mensaje recibido
    call WriteString            ; Imprime el mensaje
    call Crlf                   ; Salto de linea
ENDM                            ; Fin de la macro

.data

; Los mensajes que se usaran como remplazo de texto
mensajeInicio BYTE "Bienvenidos a tu salon favorito", 0 ; Mensaje de bienvenida
mensajeFin  BYTE "Nos vemos vuelva pronto",  0           ; Mensaje de despedida

.code
main PROC

    ; Aqui se despliega el macro dos veces
    MostrarMensaje mensajeInicio    ; Se expande e imprime el mensaje de bienvenida
    MostrarMensaje mensajeFin       ; Se expande e imprime el mensaje de despedida
    exit                            ; Termina el programa
main ENDP
END main