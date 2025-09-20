; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic arithmetic operations and I/O in x86 Assembly.
; The program reads a temperature value and a character indicating the 
; conversion type ('C' for Celsius to Fahrenheit, 'F' for Fahrenheit to Celsius).
; It then performs the conversion and prints the result.

section .data
    prompt db "Enter temperature: ", 0
    prompt_len equ $ - prompt
    prompt2 db "Enter conversion type (C/F): ", 0
    prompt2_len equ $ - prompt2
    result_msg db "Converted temperature: ", 0
    result_msg_len equ $ - result_msg
    temp_input db 0
    conv_type db 0
    result db 0

section .bss
    temp resb 4
    temp2 resb 4
    temp3 resb 4

section .text
    global _start

_start:
    ; Print the first prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Read the temperature input
    mov eax, 3
    mov ebx, 0
    mov ecx, temp
    mov edx, 4
    int 0x80

    ; Print the second prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, prompt2_len
    int 0x80

    ; Read the conversion type
    mov eax, 3
    mov ebx, 0
    mov ecx, conv_type
    mov edx, 1
    int 0x80

    ; Convert the temperature input from ASCII to integer
    sub byte [temp], '0'

    ; Check the conversion type and perform the conversion
    cmp byte [conv_type], 'C'
    je celsius_to_fahrenheit
    cmp byte [conv_type], 'F'
    je fahrenheit_to_celsius

celsius_to_fahrenheit:
    ; Celsius to Fahrenheit conversion: (C * 9/5) + 32
    mov al, [temp]
    mov bl, 9
    mul bl
    mov bl, 5
    div bl
    add al, 32
    mov [result], al
    jmp print_result

fahrenheit_to_celsius:
    ; Fahrenheit to Celsius conversion: (F - 32) * 5/9
    mov al, [temp]
    sub al, 32
    mov bl, 5
    mul bl
    mov bl, 9
    div bl
    mov [result], al

print_result:
    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, result_msg_len
    int 0x80

    ; Print the converted temperature
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

