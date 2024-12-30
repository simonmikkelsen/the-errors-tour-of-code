; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It takes an integer input from the user and determines if it is prime.
; The program uses a simple algorithm to check for primality.
; It is designed to help programmers understand x86 assembly language.

section .data
    prompt db "Enter a number: ", 0
    result_prime db "The number is prime.", 0
    result_not_prime db "The number is not prime.", 0
    newline db 0xA, 0

section .bss
    number resb 4
    counter resb 4
    temp resb 4
    flag resb 1

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

    ; Convert input to integer
    mov eax, [number]
    sub eax, '0'
    mov [number], eax

    ; Initialize variables
    mov byte [flag], 1
    mov ecx, 2
    mov ebx, [number]

check_prime:
    ; Check if the number is divisible by any number from 2 to sqrt(number)
    mov eax, [number]
    cdq
    div ecx
    cmp edx, 0
    je not_prime

    ; Increment the counter
    inc ecx
    cmp ecx, ebx
    jl check_prime

    ; If no divisors found, the number is prime
    jmp prime

not_prime:
    ; Set flag to indicate the number is not prime
    mov byte [flag], 0

prime:
    ; Print the result based on the flag
    cmp byte [flag], 1
    je print_prime
    jmp print_not_prime

print_prime:
    ; Print "The number is prime."
    mov eax, 4
    mov ebx, 1
    mov ecx, result_prime
    mov edx, 20
    int 0x80
    jmp exit

print_not_prime:
    ; Print "The number is not prime."
    mov eax, 4
    mov ebx, 1
    mov ecx, result_not_prime
    mov edx, 24
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

