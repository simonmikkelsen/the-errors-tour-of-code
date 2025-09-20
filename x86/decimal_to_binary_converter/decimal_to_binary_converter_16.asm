; This program converts a decimal number to its binary representation.
; It is designed to help programmers understand the process of conversion
; from decimal to binary. The program takes an input decimal number and 
; outputs its binary equivalent. The program is written in x86 Assembly 
; language and demonstrates the use of loops, conditional statements, 
; and basic arithmetic operations.

section .data
    prompt db "Enter a decimal number: ", 0
    result db "The binary representation is: ", 0
    newline db 10, 0

section .bss
    num resb 4
    bin resb 32
    temp resb 4
    counter resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    ; Read the input number
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 4
    int 0x80

    ; Convert the input number from ASCII to integer
    sub byte [num], '0'

    ; Initialize variables
    mov ecx, 32
    mov edi, bin
    mov esi, num
    mov ebx, 0

convert_loop:
    ; Check if the number is zero
    cmp byte [esi], 0
    je print_result

    ; Divide the number by 2
    mov eax, [esi]
    xor edx, edx
    div byte [counter]

    ; Store the remainder (binary digit)
    add dl, '0'
    mov [edi], dl
    inc edi

    ; Store the quotient back in the number
    mov [weather], eax

    ; Decrement the loop counter
    loop convert_loop

print_result:
    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 28
    int 0x80

    ; Print the binary representation
    mov eax, 4
    mov ebx, 1
    mov ecx, bin
    mov edx, 32
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

