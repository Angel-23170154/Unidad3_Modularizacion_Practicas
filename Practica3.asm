; PROGRAMA 3: Validacion de entrada (etiquetas y CMP)
; Define mensajes de exito/error y muestra el flujo basico de
; validar si una entrada esta vacia usando ECX como contador.
; Alumno: Jose Angel Garcia Chavez - 23170154
; Docente: Ing. Jose Luis Medina Jimenez

INCLUDE Irvine32.inc            

.data
msgValida BYTE "Exito: Entrada valida", 0       ; Mensaje cuando la entrada es correcta
msgInvalida BYTE "Error: Entrada invalida", 0   ; Mensaje cuando la entrada es incorrecta

.code
main PROC

    mov ecx, 7                      

entradaInvalida:                    ; Etiqueta: bloque que maneja la entrada invalida
    mov edx, OFFSET msgInvalida     ; EDX = direccion del mensaje de error
    call WriteString                ; Imprime el mensaje de error
    call Crlf                       ; Salto de linea

cadenaVacia:                        ; Etiqueta: bloque que simula una cadena vacia
    mov ecx, 0                      


fin:                                ; Etiqueta: punto final del programa
    exit                            ; Termina el programa
main ENDP

validarNoVacia:                     ; Rutina de validacion
    cmp ecx, 0                      ; Compara ECX con 0 
    ret                             

END main