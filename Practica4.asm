; PROGRAMA 4: Paso de parametros por la pila (stack frame)
; Envia dos numeros por la pila a un procedimiento que los
; multiplica, usando EBP para acceder a los parametros.
; Alumno: Jose Angel Garcia Chavez - 23170154
; Docente: Ing. Jose Luis Medina Jimenez

INCLUDE Irvine32.inc            

.data
.code
main PROC
    mov ebx, 999                    ; EBX = 999 (valor que el procedimiento debe conservar)

    push 3                          ; Segundo parametro: se guarda en [ebp + 12]
    push 25                         ; Primer parametro: se guarda en [ebp + 8]

    call SumarPila                  ; Llama al procedimiento (EAX tendra el resultado)
    nop                             ; Regreso del call SumarPila (no hace nada, sirve de marca al depurar)
    exit                            ; Termina el programa

main ENDP

SumarPila PROC
    push ebp                        ; Guarda el EBP original del que llamo
    mov ebp, esp                    ; EBP = ESP: base del marco de pila para acceder a los parametros

    push ebx                        ; Guardar el valor original de EBX

    mov eax, [ebp + 8]              ; EAX = 25 (primer parametro)
    mov ebx, [ebp + 12]             ; EBX = 3 (segundo parametro)

    imul eax, ebx                   ; Multiplica EAX * EBX y guarda el resultado en EAX 

    pop ebx                         ; Restaura EBX original (999)
    pop ebp                         ; Restaura EBP original

    ret 8                           ; Regresa y libera los 8 bytes de la pila usados por los 2 parametros

SumarPila ENDP
END main