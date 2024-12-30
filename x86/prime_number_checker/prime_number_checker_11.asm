; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to help programmers understand x86 Assembly language.
; The program takes an input number and determines if it is prime.
; A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

section .data
    prompt db "Enter a number: ", 0
    result_prime db "The number is prime.", 0
    result_not_prime db "The number is not prime.", 0
    newline db 0xA, 0

section .bss
    number resb 4
    divisor resb 4
    remainder resb 4
    is_prime resb 1

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
    mov byte [is_prime], 1
    mov eax, [number]
    mov ebx, 2

check_prime:
    ; Check if divisor is less than the number
    cmp ebx, eax
    jge done_check

    ; Calculate remainder
    mov edx, 0
    div ebx
    mov [remainder], edx

    ; Check if remainder is zero
    cmp byte [remainder], 0
    jne next_divisor

    ; If remainder is zero, number is not prime
    mov byte [is_prime], 0
    jmp done_check

next_divisor:
    ; Increment divisor
    inc ebx
    jmp check_prime

done_check:
    ; Print the result
    cmp byte [is_prime], 1
    je print_prime

    ; Print "The number is not prime."
    mov eax, 4
    mov ebx, 1
    mov ecx, result_not_prime
    mov edx, 22
    int 0x80
    jmp exit

print_prime:
    ; Print "The number is prime."
    mov eax, 4
    mov ebx, 1
    mov ecx, result_prime
    mov edx, 19
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

