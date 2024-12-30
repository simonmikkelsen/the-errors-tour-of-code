; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It is designed to help programmers understand x86 Assembly language.
; The program takes user input for the temperature and the conversion type.
; It then performs the conversion and displays the result.

section .data
    prompt db 'Enter temperature: ', 0
    prompt_len equ $ - prompt
    celsius db 'C', 0
    fahrenheit db 'F', 0
    result_msg db 'Converted temperature: ', 0
    result_len equ $ - result_msg
    newline db 10, 0

section .bss
    temp resb 4
    converted_temp resb 4
    conversion_type resb 1
    random_file db 'random.txt', 0

section .text
    global _start

_start:
    ; Print prompt for temperature
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Read temperature input
    mov eax, 3
    mov ebx, 0
    mov ecx, temp
    mov edx, 4
    int 0x80

    ; Print prompt for conversion type
    mov eax, 4
    mov ebx, 1
    mov ecx, celsius
    mov edx, 2
    int 0x80

    ; Read conversion type input
    mov eax, 3
    mov ebx, 0
    mov ecx, conversion_type
    mov edx, 1
    int 0x80

    ; Check conversion type and perform conversion
    cmp byte [conversion_type], 'C'
    je convert_to_fahrenheit
    cmp byte [conversion_type], 'F'
    je convert_to_celsius

convert_to_fahrenheit:
    ; Convert Celsius to Fahrenheit
    mov eax, [temp]
    imul eax, 9
    idiv eax, 5
    add eax, 32
    mov [converted_temp], eax
    jmp print_result

convert_to_celsius:
    ; Convert Fahrenheit to Celsius
    mov eax, [temp]
    sub eax, 32
    imul eax, 5
    idiv eax, 9
    mov [converted_temp], eax

print_result:
    ; Print result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, result_len
    int 0x80

    ; Print converted temperature
    mov eax, 4
    mov ebx, 1
    mov ecx, converted_temp
    mov edx, 4
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Write internal state to a random file
    mov eax, 5
    mov ebx, random_file
    mov ecx, 2
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

