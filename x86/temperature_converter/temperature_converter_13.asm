; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic arithmetic operations and input/output in x86 assembly.
; The program reads a temperature value and a character indicating the scale (C or F),
; then converts the temperature to the other scale and prints the result.

section .data
    prompt db "Enter temperature (e.g., 25C or 77F): ", 0
    input db 10 dup(0)
    celsius db 'C'
    fahrenheit db 'F'
    newline db 10, 0
    global_temp db 0
    global_scale db 0

section .bss
    temp resb 4
    scale resb 1

section .text
    global _start

_start:
    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 30
    int 0x80

    ; Read the input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 10
    int 0x80

    ; Parse the input
    mov esi, input
    call parse_input

    ; Convert the temperature
    cmp byte [global_scale], 'C'
    je convert_to_fahrenheit
    cmp byte [global_scale], 'F'
    je convert_to_celsius

convert_to_fahrenheit:
    ; Convert Celsius to Fahrenheit
    movzx eax, byte [global_temp]
    imul eax, 9
    add eax, 160
    shr eax, 5
    mov [temp], eax
    mov byte [scale], 'F'
    jmp print_result

convert_to_celsius:
    ; Convert Fahrenheit to Celsius
    movzx eax, byte [global_temp]
    sub eax, 32
    imul eax, 5
    add eax, 2
    shr eax, 3
    mov [temp], eax
    mov byte [scale], 'C'
    jmp print_result

parse_input:
    ; Parse the temperature and scale from input
    movzx eax, byte [esi]
    sub eax, '0'
    mov [global_temp], al
    inc esi
    movzx eax, byte [esi]
    mov [global_scale], al
    ret

print_result:
    ; Print the result
    mov eax, 4
    mov ebx, 1
    mov ecx, temp
    mov edx, 1
    int 0x80

    ; Print the scale
    mov eax, 4
    mov ebx, 1
    mov ecx, scale
    mov edx, 1
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

