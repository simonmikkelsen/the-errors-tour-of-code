; Prime Number Checker in x86 Assembly
; This program checks if a given number is a prime number.
; It takes an integer input from the user and outputs whether the number is prime or not.
; The program uses a simple algorithm to check for primality by dividing the number by all integers from 2 to the square root of the number.
; If the number is divisible by any of these integers, it is not a prime number.
; Otherwise, it is a prime number.

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
    mov eax, [number]
    sub eax, '0'
    mov [number], eax

    ; Initialize divisor to 2
    mov dword [divisor], 2

check_prime:
    ; Check if divisor * divisor > number
    mov eax, [divisor]
    imul eax, eax
    cmp eax, [number]
    jg is_prime

    ; Calculate remainder = number % divisor
    mov eax, [number]
    cdq
    div dword [divisor]
    mov [remainder], edx

    ; If remainder == 0, the number is not prime
    cmp dword [remainder], 0
    je not_prime

    ; Increment divisor
    inc dword [divisor]
    jmp check_prime

is_prime:
    ; Print the prime message
    mov eax, 4
    mov ebx, 1
    mov ecx, prime_msg
    mov edx, 18
    int 0x80
    jmp exit

not_prime:
    ; Print the not prime message
    mov eax, 4
    mov ebx, 1
    mov ecx, not_prime_msg
    mov edx, 22
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

