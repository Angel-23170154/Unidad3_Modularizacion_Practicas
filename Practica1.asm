; PROGRAMA 1: Procedimientos (CALL y RET)
; Muestra como llamar un procedimiento dos veces y regresar
; al punto exacto despues de cada llamada.
; Alumno: Jose Angel Garcia Chavez - 23170154
; Docente: Jose Luis Medina Jimenez


INCLUDE Irvine32.inc            ; Libreria de Irvine (WriteString, Crlf, exit, etc.)

.data
mensajeInicio BYTE "Incio de programa", 0                    ; Cadena terminada en nulo (0)
mensajeProcedimiento BYTE "Estoy dentro del procedimiento", 0 ; Mensaje que imprime el procedimiento
mensajeFin BYTE "Fin del programa", 0                        ; Mensaje final

.code
main PROC
    mov edx, OFFSET mensajeInicio   ; EDX = direccion de la cadena a imprimir
    call WriteString                ; Imprime la cadena apuntada por EDX
    call Crlf                       ; Salto de linea

    ; primera llamada
    call mostrarAviso               ; Guarda la direccion de retorno en la pila y salta al procedimiento

    mov eax, 10                     ; Se ejecuta al regresar de la primera llamada (EAX = 10)

    ; segunda llamada
    call mostrarAviso               ; Vuelve a ejecutar el mismo procedimiento
    mov eax, 20                     ; Se ejecuta al regresar de la segunda llamada (EAX = 20)

    mov edx, OFFSET mensajeFin      ; EDX = direccion del mensaje final
    call WriteString                ; Imprime el mensaje final
    call Crlf                       ; Salto de linea
main ENDP

; Mostrar un mensaje y regresar al punto despues del llamado.

mostrarAviso PROC
    mov edx, OFFSET mensajeProcedimiento ; EDX = direccion del mensaje del procedimiento
    call WriteString                     ; Imprime el mensaje
    call Crlf                            ; Salto de linea
    ret                                  ; Saca la direccion de retorno de la pila y regresa al main
mostrarAviso ENDP
END main                        ; Indica que el programa inicia en main