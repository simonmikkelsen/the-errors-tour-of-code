; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; It demonstrates the use of loops, conditional statements, and basic arithmetic operations in assembly language.
; The program is designed to be educational and help programmers understand the flow of assembly code.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0

section .bss
    number resb 1
    factorial resb 4
    temp resb 4

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

    ; Convert ASCII to integer
    movzx eax, byte [number]
    sub eax, '0'
    mov [number], eax

    ; Initialize factorial to 1
    mov dword [factorial], 1

    ; Initialize counter to the input number
    mov ecx, [number]

calculate_factorial:
    ; Check if counter is zero
    cmp ecx, 0
    je print_result

    ; Multiply factorial by counter
    mov eax, [factorial]
    mul ecx
    mov [factorial], eax

    ; Decrement counter
    dec ecx
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

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

