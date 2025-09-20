; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of loops, conditionals, and function calls in assembly language.
; The program also includes a random number generator to simulate different inputs for the factorial calculation.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 10, 0

section .bss
    number resb 1
    result resd 1
    random_seed resd 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov edx, len prompt
    mov ecx, prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read the input number
    mov edx, 1
    mov ecx, number
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Convert the input number from ASCII to integer
    movzx eax, byte [number]
    sub eax, '0'
    mov [number], eax

    ; Initialize the random number generator with a seed
    mov dword [random_seed], 1337

    ; Calculate the factorial
    mov eax, [number]
    call factorial
    mov [result], eax

    ; Print the result message
    mov edx, len result_msg
    mov ecx, result_msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Print the result
    mov eax, [result]
    call print_number

    ; Print a newline
    mov edx, len newline
    mov ecx, newline
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

factorial:
    ; Base case: if n <= 1, return 1
    cmp eax, 1
    jle .base_case

    ; Recursive case: n * factorial(n-1)
    dec eax
    push eax
    call factorial
    pop ebx
    inc ebx
    mul ebx
    ret

.base_case:
    mov eax, 1
    ret

print_number:
    ; Print the number in eax
    ; This function assumes the number is a single digit (0-9)
    add eax, '0'
    mov [number], al
    mov edx, 1
    mov ecx, number
    mov ebx, 1
    mov eax, 4
    int 0x80
    ret

len equ $ - prompt

