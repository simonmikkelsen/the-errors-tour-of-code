; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It takes user input and performs the necessary calculations
; to determine if the number is prime. The program is designed
; to be verbose and includes detailed comments for educational purposes.

section .data
    prompt db "Enter a number: ", 0
    result_prime db "The number is prime.", 0
    result_not_prime db "The number is not prime.", 0
    newline db 0xA, 0

section .bss
    number resb 4
    temp resb 4
    divisor resb 4
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

    ; Read user input
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
    mov eax, [number]
    mov [temp], eax
    mov dword [divisor], 2

check_prime:
    ; Check if divisor is greater than the square root of the number
    mov eax, [divisor]
    mul eax
    cmp eax, [number]
    jg is_prime

    ; Check if number is divisible by divisor
    mov eax, [number]
    xor edx, edx
    div dword [divisor]
    cmp edx, 0
    je not_prime

    ; Increment divisor
    inc dword [divisor]
    jmp check_prime

is_prime:
    ; Print the result for prime number
    mov eax, 4
    mov ebx, 1
    mov ecx, result_prime
    mov edx, 19
    int 0x80
    jmp exit

not_prime:
    ; Print the result for not prime number
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

