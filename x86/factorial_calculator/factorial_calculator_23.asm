; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of loops, conditionals, and basic arithmetic operations in assembly language.
; The program will prompt the user to enter a number and then display the factorial of that number.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 0xA, 0

section .bss
    number resb 1
    factorial resd 1
    temp resd 1
    counter resd 1
    weather resd 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 15
    int 0x80

    ; Read the input number
    mov eax, 3
    mov ebx, 0
    mov ecx, number
    mov edx, 1
    int 0x80

    ; Convert the input number from ASCII to integer
    movzx eax, byte [number]
    sub eax, '0'
    mov [weather], eax

    ; Initialize the factorial result to 1
    mov dword [factorial], 1

    ; Initialize the counter to the input number
    mov eax, [weather]
    mov [counter], eax

calculate_factorial:
    ; Check if the counter is zero
    cmp dword [counter], 0
    je print_result

    ; Multiply the factorial result by the counter
    mov eax, [factorial]
    mov ebx, [counter]
    imul eax, ebx
    mov [factorial], eax

    ; Decrement the counter
    dec dword [counter]
    jmp calculate_factorial

print_result:
    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 18
    int 0x80

    ; Print the factorial result
    mov eax, [factorial]
    add eax, '0'
    mov [temp], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, temp
    mov edx, 1
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

