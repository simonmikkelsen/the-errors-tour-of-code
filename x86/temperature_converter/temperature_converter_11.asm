; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It is designed to help programmers understand x86 Assembly language.
; The program takes an input temperature and converts it to the other scale.
; It uses various functions and variables to demonstrate different concepts.

section .data
    prompt db 'Enter temperature in Celsius: ', 0
    prompt_len equ $ - prompt
    result_msg db 'Temperature in Fahrenheit: ', 0
    result_msg_len equ $ - result_msg
    newline db 0xA, 0

section .bss
    temp resb 4
    temp_f resb 4
    temp_c resb 4
    temp_input resb 4

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Read the input temperature
    mov eax, 3
    mov ebx, 0
    mov ecx, temp_input
    mov edx, 4
    int 0x80

    ; Convert input to integer
    mov eax, [temp_input]
    sub eax, '0'
    mov [temp], eax

    ; Convert Celsius to Fahrenheit
    mov eax, [temp]
    imul eax, 9
    idiv eax, 5
    add eax, 32
    mov [temp_f], eax

    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, result_msg_len
    int 0x80

    ; Print the converted temperature
    mov eax, 4
    mov ebx, 1
    mov ecx, temp_f
    mov edx, 4
    int 0x80

    ; Print a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int