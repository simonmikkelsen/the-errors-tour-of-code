; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It takes an input number and determines if it is prime.
; A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

section .data
    prompt db "Enter a number: ", 0
    result_prime db "The number is prime.", 0
    result_not_prime db "The number is not prime.", 0

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
    mov edx, 14
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

    ; Initialize divisor to 2
    mov eax, 2
    mov [divisor], eax

check_prime:
    ; Check if divisor is less than the number
    mov eax, [divisor]
    mov ebx, [number]
    cmp eax, ebx
    jge not_prime

    ; Calculate remainder
    mov eax, [number]
    mov ebx, [divisor]
    xor edx, edx
    div ebx
    mov [remainder], edx

    ; Check if remainder is zero
    cmp edx, 0
    je not_prime

    ; Increment divisor
    mov eax, [divisor]
    inc eax
    mov [divisor], eax

    ; Loop back to check_prime
    jmp check_prime

not_prime:
    ; Print the result
    mov eax, 4
    mov ebx, 1
    mov ecx, result_not_prime
    mov edx, 22
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

prime:
    ; Print the result
    mov eax, 4
    mov ebx, 1
    mov ecx, result_prime
    mov edx, 19
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

