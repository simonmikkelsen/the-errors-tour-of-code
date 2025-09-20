; Prime Number Checker Program
; This program checks if a given number is a prime number.
; A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
; The program will take an input number and determine if it is prime.
; This program is designed to help programmers understand the logic of prime number checking in assembly language.

section .data
    prompt db "Enter a number: ", 0
    prime_msg db "The number is prime.", 0
    not_prime_msg db "The number is not prime.", 0
    newline db 0xA, 0

section .bss
    number resb 4
    divisor resb 4
    remainder resb 4
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

    ; Convert the input number from ASCII to integer
    sub byte [number], '0'

    ; Initialize variables
    mov eax, [number]
    mov ebx, 2
    mov ecx, eax
    mov edx, 0

    ; Check if the number is less than 2
    cmp eax, 2
    jl not_prime

    ; Loop to check for factors
check_loop:
    ; Divide the number by the current divisor
    mov eax, [number]
    mov edx, 0
    div ebx
    mov [remainder], edx

    ; Check if the remainder is zero
    cmp [remainder], 0
    je not_prime

    ; Increment the divisor
    inc ebx

    ; Compare the divisor with the number
    cmp ebx, ecx
    jl check_loop

    ; If no factors were found, the number is prime
    jmp prime

not_prime:
    ; Print the not prime message
    mov eax, 4
    mov ebx, 1
    mov ecx, not_prime_msg
    mov edx, 22
    int 0x80
    jmp done

prime:
    ; Print the prime message
    mov eax, 4
    mov ebx, 1
    mov ecx, prime_msg
    mov edx, 19
    int 0x80

done:
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

