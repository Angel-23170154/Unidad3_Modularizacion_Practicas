; PROGRAMA 2: Lectura de cadenas con ReadString (buffer)
; Pide el nombre al usuario, lo guarda en un buffer, lo muestra
; y despues imprime el numero de caracteres escritos.
; Alumno: Jose Angel Garcia Chavez - 23170154
; Docente: Ing. Jose Luis Medina Jimenez

INCLUDE Irvine32.inc            

.data
mensajeEntrada BYTE "Escribe tu nombre: ",0          ; Mensaje que pide el dato
caracteresEscritos BYTE "Numero de caracteres: ",0   ; Etiqueta para mostrar la cantidad
nombre BYTE 20 DUP(0)   ; DUP duplica el valor 0 veinte veces: reserva 20 bytes 

.code
main PROC
    mov edx, OFFSET mensajeEntrada  ; EDX = direccion del mensaje
    call WriteString                ; Imprime "Escribe tu nombre: "

    mov edx, OFFSET nombre          ; Direccion hacia donde va a apuntar el primer caracter
    mov ecx, SIZEOF nombre          ; SIZEOF da el numero de bytes de la etiqueta 

    call ReadString                 ; Lee lo escrito por teclado y lo guarda en el buffer
                                    ; Al terminar, EAX = numero de caracteres leidos
    call Crlf                       ; Salto de linea

    mov edx, OFFSET nombre          ; EDX = direccion del buffer con el nombre
    call WriteString                ; Imprime el nombre capturado
    call Crlf                       
    mov edx, OFFSET caracteresEscritos 
    call WriteString                ; Imprime "Numero de caracteres: "
    call WriteDec                   ; Imprime EAX en decimal 

    exit                            
main ENDP

END main