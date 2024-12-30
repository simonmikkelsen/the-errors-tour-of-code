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
    newline db 0xA, 0xD, 0

section .bss
    temp resb 4
    fahrenheit resb 4
    unused_var resb 10

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
    mov ecx, temp
    mov edx, 4
    int 0x80

    ; Convert the input from ASCII to integer
    mov eax, [temp]
    sub eax, '0'
    mov ecx, 10
    mul ecx
    add eax, [temp + 1]
    sub eax, '0'
    mov [temp], eax

    ; Convert Celsius to Fahrenheit
    mov eax, [temp]
    mov ebx, 9
    mul ebx
    mov ebx, 5
    div ebx
    add eax, 32
    mov [fahrenheit], eax

    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, result_msg_len
    int 0x80

    ; Print the converted temperature
    mov eax, 4
    mov ebx, 1
    mov ecx, fahrenheit
    mov edx, 4
    int 0x80

    ; Print a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 2
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

