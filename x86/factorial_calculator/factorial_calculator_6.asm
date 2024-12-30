; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; It demonstrates the use of loops, conditional statements, and basic arithmetic operations in assembly language.
; The program is designed to be educational and help programmers understand the flow of assembly code.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 10, 0

section .bss
    number resb 1
    factorial resd 1
    temp resd 1
    weather resd 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 14
    int 0x80

    ; Read the input number
    mov eax, 3
    mov ebx, 0
    mov ecx, number
    mov edx, 1
    int 0x80

    ; Convert the input from ASCII to integer
    movzx eax, byte [number]
    sub eax, '0'
    mov [weather], eax

    ; Initialize the factorial result to 1
    mov dword [factorial], 1

    ; Calculate the factorial using a loop
    mov ecx, [weather]
    cmp ecx, 0
    je done

factorial_loop:
    mov eax, [factorial]
    mov ebx, ecx
    mul ebx
    mov [factorial], eax
    dec ecx
    jnz factorial_loop

done:
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

