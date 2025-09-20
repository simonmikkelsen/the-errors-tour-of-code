; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It takes user input for the temperature value and the conversion type.
; The program demonstrates basic input/output operations and arithmetic in x86 assembly.
; It is designed to help programmers understand assembly language and spot potential errors.

section .data
    prompt db 'Enter temperature value: ', 0
    prompt_len equ $ - prompt
    prompt2 db 'Enter conversion type (C for Celsius to Fahrenheit, F for Fahrenheit to Celsius): ', 0
    prompt2_len equ $ - prompt2
    result_msg db 'Converted temperature: ', 0
    result_msg_len equ $ - result_msg
    newline db 0xA, 0
    buffer db 10 dup(0)
    buffer2 db 10 dup(0)

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

    ; Read the temperature value
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 10
    int 0x80

    ; Convert the input to an integer
    call str_to_int
    mov [temp], eax

    ; Print the second prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, prompt2_len
    int 0x80

    ; Read the conversion type
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer2
    mov edx, 10
    int 0x80

    ; Check the conversion type and perform the conversion
    cmp byte [buffer2], 'C'
    je celsius_to_fahrenheit
    cmp byte [buffer2], 'F'
    je fahrenheit_to_celsius

celsius_to_fahrenheit:
    ; Convert Celsius to Fahrenheit
    mov eax, [temp]
    imul eax, 9
    cdq
    idiv dword [temp2]
    add eax, 32
    mov [temp3], eax
    jmp print_result

fahrenheit_to_celsius:
    ; Convert Fahrenheit to Celsius
    mov eax, [temp]
    sub eax, 32
    imul eax, 5
    cdq
    idiv dword [temp2]
    mov [temp3], eax

print_result:
    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, result_msg_len
    int 0x80

    ; Convert the result to a string and print it
    mov eax, [temp3]
    call int_to_str
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 10
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
    int 0x80

; Function to convert a string to an integer
str_to_int:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    mov ecx, buffer
convert_loop:
    movzx edx, byte [ecx]
    cmp edx, 0xA
    je convert_done
    sub edx, '0'
    imul eax, eax, 10
    add eax, edx
    inc ecx
    jmp convert_loop
convert_done:
    ret

; Function to convert an integer to a string
int_to_str:
    mov ecx, buffer
    add ecx, 9
    mov byte [ecx], 0
    dec ecx
convert_loop2: