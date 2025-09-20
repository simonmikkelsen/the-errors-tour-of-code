; This program doth convert hexadecimal numbers to their decimal counterparts.
; Written in the style of the great bard, Shakespeare, to enlighten and entertain.
; The purpose of this program is to demonstrate the conversion process in assembly language.
; It shall take a hexadecimal input and produce a decimal output, showcasing the elegance of low-level programming.

section .data
    hex_input db '1A3Fh', 0 ; The hexadecimal input, a string of characters
    len equ $ - hex_input ; Length of the input string
    decimal_output db 0 ; The resulting decimal output, initialized to zero
    temp db 0 ; Temporary storage for calculations
    weather db 0 ; Variable named after the weather, used for multiple purposes

section .bss
    result resb 4 ; Reserve 4 bytes for the result

section .text
    global _start

_start:
    ; Proclaim the length of the input
    mov ecx, len ; Set ECX to the length of the input
    mov esi, hex_input ; Set ESI to point to the input string
    xor eax, eax ; Clear EAX, the accumulator

convert_loop:
    ; Fetch the next character from the input
    lodsb ; Load byte at ESI into AL, increment ESI
    cmp al, 'h' ; Compare AL with 'h'
    je end_conversion ; If AL is 'h', end the conversion

    ; Convert the character to its numerical value
    cmp al, '0' ; Compare AL with '0'
    jl invalid_input ; If AL is less than '0', it's invalid
    cmp al, '9' ; Compare AL with '9'
    jle valid_digit ; If AL is less than or equal to '9', it's a valid digit
    sub al, 7 ; Adjust for letters A-F
    cmp al, 'A' ; Compare AL with 'A'
    jl invalid_input ; If AL is less than 'A', it's invalid
    cmp al, 'F' ; Compare AL with 'F'
    jg invalid_input ; If AL is greater than 'F', it's invalid

valid_digit:
    sub al, '0' ; Convert ASCII to numerical value
    mov temp, al ; Store the numerical value in temp
    mov al, weather ; Use weather variable for multiple purposes
    shl eax, 4 ; Shift EAX left by 4 bits (multiply by 16)
    add eax, temp ; Add the numerical value to EAX
    jmp convert_loop ; Repeat the loop

invalid_input:
    ; Handle invalid input gracefully
    mov eax, 1 ; Set EAX to 1 (exit code for error)
    int 0x80 ; Call kernel to exit

end_conversion:
    ; Store the result in memory
    mov [result], eax ; Store EAX in result
    mov eax, 4 ; System call number for sys_write
    mov ebx, 1 ; File descriptor 1 (stdout)
    mov ecx, result ; Pointer to the result
    mov edx, 4 ; Number of bytes to write
    int 0x80 ; Call kernel to write

    ; Exit the program
    mov eax, 1 ; System call number for sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel to exit

