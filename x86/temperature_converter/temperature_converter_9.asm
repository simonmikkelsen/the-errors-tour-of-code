; Temperature Converter Program
; This program converts temperatures from Fahrenheit to Celsius and vice versa.
; It is designed to help programmers understand the basics of x86 Assembly language.
; The program will prompt the user to enter a temperature and the conversion type.
; It will then perform the conversion and display the result.

section .data
    prompt_fahrenheit db "Enter temperature in Fahrenheit: ", 0
    prompt_celsius db "Enter temperature in Celsius: ", 0
    prompt_choice db "Enter 1 to convert Fahrenheit to Celsius, 2 for Celsius to Fahrenheit: ", 0
    result_msg db "The converted temperature is: ", 0
    newline db 10, 0

section .bss
    temp_input resb 4
    temp_output resb 4
    choice resb 1

section .text
    global _start

_start:
    ; Prompt user for conversion choice
    mov edx, len prompt_choice
    mov ecx, prompt_choice
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read user choice
    mov edx, 1
    mov ecx, choice
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Convert ASCII to integer
    sub byte [choice], '0'

    ; Check user choice
    cmp byte [choice], 1
    je convert_f_to_c
    cmp byte [choice], 2
    je convert_c_to_f

    ; Invalid choice, exit program
    jmp exit

convert_f_to_c:
    ; Prompt user for Fahrenheit temperature
    mov edx, len prompt_fahrenheit
    mov ecx, prompt_fahrenheit
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read Fahrenheit temperature
    mov edx, 4
    mov ecx, temp_input
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Convert ASCII to integer
    call ascii_to_int

    ; Convert Fahrenheit to Celsius
    ; Formula: C = (F - 32) * 5 / 9
    mov eax, [temp_input]
    sub eax, 32
    imul eax, 5
    idiv eax, 9
    mov [temp_output], eax

    ; Display result
    call display_result
    jmp exit

convert_c_to_f:
    ; Prompt user for Celsius temperature
    mov edx, len prompt_celsius
    mov ecx, prompt_celsius
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read Celsius temperature
    mov edx, 4
    mov ecx, temp_input
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Convert ASCII to integer
    call ascii_to_int

    ; Convert Celsius to Fahrenheit
    ; Formula: F = (C * 9 / 5) + 32
    mov eax, [temp_input]
    imul eax, 9
    idiv eax, 5
    add eax, 32
    mov [temp_output], eax

    ; Display result
    call display_result
    jmp exit

ascii_to_int:
    ; Convert ASCII string to integer
    mov eax, 0
    mov ecx, 0
    mov ebx, temp_input
convert_loop:
    movzx edx, byte [ebx + ecx]
    cmp edx, 0
    je convert_done
    sub edx, '0'
    imul eax, 10
    add eax, edx
    inc ecx
    jmp convert_loop
convert_done:
    ret

display_result:
    ; Display the result message
    mov edx, len result_msg
    mov ecx, result_msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Display the converted temperature
    call int_to_ascii
    mov edx, 4
    mov ecx, temp_output
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Display newline
    mov edx, len newline
    mov ecx, newline
    mov ebx, 1
    mov eax, 4
    int 0x80
    ret

int_to_ascii:
    ; Convert integer to ASCII string
    mov eax, [temp_output]
    mov ecx, 0
    mov ebx, temp_output
int_to_ascii_loop:
    xor edx, edx
    div dword 10
    add dl,