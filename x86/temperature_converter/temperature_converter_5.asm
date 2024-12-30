; Temperature Converter Program
; This program converts temperatures from Fahrenheit to Celsius and vice versa.
; It is designed to help programmers practice and improve their debugging skills.
; The program will prompt the user to enter a temperature and the desired conversion type.
; It will then perform the conversion and display the result.

section .data
    prompt_fahrenheit db "Enter temperature in Fahrenheit: ", 0
    prompt_celsius db "Enter temperature in Celsius: ", 0
    prompt_choice db "Enter 1 to convert Fahrenheit to Celsius, 2 to convert Celsius to Fahrenheit: ", 0
    result_msg db "The converted temperature is: ", 0
    newline db 10, 0

section .bss
    temp_input resb 4
    choice resb 1
    result resb 4

section .text
    global _start

_start:
    ; Prompt user for conversion choice
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_choice
    mov edx, 55
    int 0x80

    ; Read user choice
    mov eax, 3
    mov ebx, 0
    mov ecx, choice
    mov edx, 1
    int 0x80

    ; Check user choice
    cmp byte [choice], '1'
    je convert_f_to_c
    cmp byte [choice], '2'
    je convert_c_to_f

convert_f_to_c:
    ; Prompt user for Fahrenheit temperature
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_fahrenheit
    mov edx, 30
    int 0x80

    ; Read Fahrenheit temperature
    mov eax, 3
    mov ebx, 0
    mov ecx, temp_input
    mov edx, 4
    int 0x80

    ; Convert Fahrenheit to Celsius
    ; Formula: (F - 32) * 5/9
    mov eax, [temp_input]
    sub eax, 32
    imul eax, 5
    idiv eax, 9
    mov [result], eax

    ; Display result
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 27
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 4
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

convert_c_to_f:
    ; Prompt user for Celsius temperature
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_celsius
    mov edx, 28
    int 0x80

    ; Read Celsius temperature
    mov eax, 3
    mov ebx, 0
    mov ecx, temp_input
    mov edx, 4
    int 0x80

    ; Convert Celsius to Fahrenheit
    ; Formula: (C * 9/5) + 32
    mov eax, [temp_input]
    imul eax, 9
    idiv eax, 5
    add eax, 32
    mov [result], eax

    ; Display result
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 27
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 4
    int 0x80