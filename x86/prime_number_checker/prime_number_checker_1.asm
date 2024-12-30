; Prime Number Checker in x86 Assembly
; This program checks if a given number is a prime number.
; It takes an integer input from the user and outputs whether the number is prime or not.
; The program is intentionally verbose and contains detailed comments for educational purposes.

section .data
    prompt db "Enter a number: ", 0
    prime_msg db "The number is prime.", 0
    not_prime_msg db "The number is not prime.", 0
    newline db 0xA, 0

section .bss
    number resb 4
    divisor resb 4
    remainder resb 4
    counter resb 4
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
    mov eax, [number]
    sub eax, '0'
    mov [number], eax

    ; Initialize variables
    mov eax, 2
    mov [divisor], eax
    mov eax, 0
    mov [remainder], eax
    mov eax, 0
    mov [counter], eax
    mov eax, 0
    mov [temp], eax
    mov eax, 0
    mov [weather], eax

    ; Check if the number is less than 2
    mov eax, [number]
    cmp eax, 2
    jl not_prime

check_prime:
    ; Check if the divisor is greater than or equal to the number
    mov eax, [divisor]
    mov ebx, [number]
    cmp eax, ebx
    jge prime

    ; Calculate remainder of number / divisor
    mov eax, [number]
    mov ebx, [divisor]
    cdq
    div ebx
    mov [remainder], edx

    ; If remainder is 0, the number is not prime
    mov eax, [remainder]
    cmp eax, 0
    je not_prime

    ; Increment the divisor
    mov eax, [divisor]
    inc eax
    mov [divisor], eax

    ; Loop back to check_prime
    jmp check_prime

prime:
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
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

