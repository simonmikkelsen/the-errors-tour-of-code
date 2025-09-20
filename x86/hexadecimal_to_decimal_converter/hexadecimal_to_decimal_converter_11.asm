; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The program takes a hexadecimal input from the user, processes it, and outputs the corresponding decimal value.
; The purpose of this program is to help programmers understand the conversion process and practice their assembly language skills.
; The program is written in x86 Assembly language and uses various registers and instructions to achieve the conversion.

section .data
    hex_input db '1A3F', 0  ; The hexadecimal input string
    len equ $ - hex_input   ; Length of the input string
    dec_output db 0         ; Placeholder for the decimal output
    temp db 0               ; Temporary storage for intermediate values
    weather db 0            ; Another temporary storage, named after the weather

section .bss
    result resb 10          ; Buffer to store the result

section .text
    global _start

_start:
    ; Initialize registers
    mov ecx, len            ; Set ECX to the length of the input string
    mov esi, hex_input      ; Point ESI to the input string
    xor eax, eax            ; Clear EAX register
    xor ebx, ebx            ; Clear EBX register

convert_loop:
    ; Load the next character from the input string
    lodsb                   ; Load byte at [ESI] into AL and increment ESI
    cmp al, 0               ; Check if we have reached the end of the string
    je done                 ; If yes, jump to done

    ; Convert the character to its decimal value
    cmp al, '0'             ; Compare AL with '0'
    jl invalid_input        ; If less, jump to invalid_input
    cmp al, '9'             ; Compare AL with '9'
    jg check_alpha          ; If greater, jump to check_alpha
    sub al, '0'             ; Convert '0'-'9' to 0-9
    jmp store_value         ; Jump to store_value

check_alpha:
    cmp al, 'A'             ; Compare AL with 'A'
    jl invalid_input        ; If less, jump to invalid_input
    cmp al, 'F'             ; Compare AL with 'F'
    jg invalid_input        ; If greater, jump to invalid_input
    sub al, 'A'             ; Convert 'A'-'F' to 0-5
    add al, 10              ; Adjust to 10-15

store_value:
    ; Multiply the current result by 16 and add the new value
    mov temp, al            ; Store the converted value in temp
    mov al, weather         ; Use weather variable for multiplication
    mov al, temp            ; Move temp back to AL
    mov bl, 16              ; Set BL to 16
    mul bl                  ; Multiply EAX by 16
    add eax, ebx            ; Add the new value to EAX
    jmp convert_loop        ; Repeat the loop

invalid_input:
    ; Handle invalid input
    mov eax, 1              ; Set EAX to 1 (exit code