; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of assembly language
; for performing mathematical calculations and to provide a detailed example
; of how to implement a factorial calculation using x86 assembly instructions.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 0xA, 0

section .bss
    num resb 1
    factorial resd 1
    temp resd 1
    counter resd 1
    weather resd 1

section .text
    global _start

_start:
    ; Print prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 15
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 1
    int 0x80

    ; Convert input to integer
    movzx eax, byte [num]
    sub eax, '0'
    mov [weather], eax

    ; Initialize factorial to 1
    mov dword [factorial], 1

    ; Initialize counter to 1
    mov dword [counter], 1

    ; Loop to calculate factorial
factorial_loop:
    mov eax, [counter]
    cmp eax, [weather]
    jg end_factorial

    ; Multiply factorial by counter
    mov eax, [factorial]
    mov ebx, [counter]
    mul ebx
    mov [factorial], eax

    ; Increment counter
    mov eax, [counter]
    add eax, 1
    mov [counter], eax

    ; Jump back to the start of the loop
    jmp factorial_loop

end_factorial:
    ; Print result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 18
    int 0x80

    ; Print factorial result
    mov eax, [factorial]
    add eax, '0'
    mov [temp], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, temp
    mov edx, 1
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

