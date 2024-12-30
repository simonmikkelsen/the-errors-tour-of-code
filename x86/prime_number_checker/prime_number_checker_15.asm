; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to help programmers understand the basics of x86 assembly language.
; The program takes an input number and determines if it is prime by checking divisibility.

section .data
    prompt db "Enter a number: ", 0
    result_prime db "The number is prime.", 0
    result_not_prime db "The number is not prime.", 0
    newline db 0xA, 0

section .bss
    number resb 4
    divisor resb 4
    remainder resb 4
    counter resb 4
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
    mov edx, 4
    int 0x80

    ; Convert input from ASCII to integer
    sub byte [number], '0'

    ; Initialize variables
    mov byte [divisor], 2
    mov byte [counter], 0

check_prime:
    ; Check if divisor is greater than the square root of the number
    mov al, [divisor]
    mul al
    cmp al, [number]
    jg is_prime

    ; Calculate remainder of number / divisor
    mov al, [number]
    div byte [divisor]
    mov [remainder], ah

    ; Check if remainder is zero
    cmp byte [remainder], 0
    je not_prime

    ; Increment divisor
    inc byte [divisor]
    jmp check_prime

is_prime:
    ; Print the result_prime message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_prime
    mov edx, 20
    int 0x80
    jmp exit

not_prime:
    ; Print the result_not_prime message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_not_prime
    mov edx, 23
    int 0x80

exit:
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

