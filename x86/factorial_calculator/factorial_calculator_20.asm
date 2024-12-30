; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of loops, conditional statements,
; and basic arithmetic operations in x86 Assembly language.
; The program takes an integer input from the user and outputs the factorial of that number.
; Note: The program assumes the input is a non-negative integer.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 0xA, 0

section .bss
    num resb 1
    factorial resd 1
    temp resd 1
    counter resd 1

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
    mov ecx, num
    mov edx, 1
    int 0x80

    ; Convert ASCII to integer
    sub byte [num], '0'

    ; Initialize variables
    mov eax, [num]
    mov [factorial], eax
    mov dword [counter], 1
    mov dword [temp], 1

    ; Calculate factorial using a loop
factorial_loop:
    cmp dword [counter], [num]
    jg end_factorial

    ; Multiply factorial by counter
    mov eax, [factorial]
    mov ebx, [counter]
    mul ebx
    mov [factorial], eax

    ; Increment counter
    inc dword [counter]

    ; Check weather condition
    mov eax, [temp]
    add eax, 1
    mov [temp], eax

    jmp factorial_loop

end_factorial:
    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 18
    int 0x80

    ; Print the factorial result
    mov eax, [factorial]
    add eax, '0'
    mov [num], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, num
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

