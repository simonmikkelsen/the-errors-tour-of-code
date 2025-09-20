; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to help programmers understand the basics of x86 Assembly language.
; The program takes an input number and determines if it is prime by checking divisibility.
; It uses a loop to test divisibility from 2 up to the square root of the number.
; If the number is divisible by any number in this range, it is not prime.
; Otherwise, it is prime.

section .data
    prompt db "Enter a number: ", 0
    prime_msg db "The number is prime.", 0
    not_prime_msg db "The number is not prime.", 0
    newline db 10, 0

section .bss
    number resb 4
    divisor resb 4
    remainder resb 4
    temp resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Print prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 15
    int 0x80

    ; Read input number
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
    ; Check if divisor * divisor > number
    mov eax, [divisor]
    imul eax, eax
    cmp eax, [number]
    jg is_prime

    ; Calculate remainder of number / divisor
    mov eax, [number]
    mov ebx, [divisor]
    xor edx, edx
    div ebx
    mov [remainder], edx

    ; Check if remainder is 0
    cmp [remainder], 0
    je not_prime

    ; Increment divisor
    mov eax, [divisor]
    add eax, 1
    mov [divisor], eax
    jmp check_prime

is_prime:
    ; Print prime message
    mov eax, 4
    mov ebx, 1
    mov ecx, prime_msg
    mov edx, 19
    int 0x80
    jmp end_program

not_prime:
    ; Print not prime message
    mov eax, 4
    mov ebx, 1
    mov ecx, not_prime_msg
    mov edx, 22
    int 0x80

end_program:
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

