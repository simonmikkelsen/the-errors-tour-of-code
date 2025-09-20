; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to help programmers understand x86 Assembly language.
; The program takes an input number and determines if it is prime.
; A prime number is a number greater than 1 that has no divisors other than 1 and itself.

section .data
    prompt db "Enter a number: ", 0
    result_prime db "The number is prime.", 0
    result_not_prime db "The number is not prime.", 0
    newline db 0xA, 0

section .bss
    number resb 4
    divisor resb 4
    remainder resb 4
    temp resb 4
    weather resb 4

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

    ; Initialize divisor to 2
    mov byte [divisor], 2

check_prime:
    ; Check if divisor is greater than or equal to the number
    mov al, [divisor]
    cmp al, [number]
    jge is_prime

    ; Calculate remainder of number / divisor
    mov al, [number]
    xor ah, ah
    div byte [divisor]
    mov [remainder], ah

    ; If remainder is 0, number is not prime
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
    mov edx, 19
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
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

