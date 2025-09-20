; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to help programmers understand x86 Assembly language.
; The program takes an integer input and determines if it is prime.
; It uses various registers and instructions to perform the check.
; The program includes detailed comments to explain each step.

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

    ; Initialize divisor to 2
    mov dword [divisor], 2

    ; Initialize counter to 0
    mov dword [counter], 0

check_prime:
    ; Check if divisor is greater than number / 2
    mov eax, [number]
    mov ebx, 2
    div ebx
    cmp [divisor], eax
    jg is_prime

    ; Calculate remainder of number / divisor
    mov eax, [number]
    mov ebx, [divisor]
    div ebx
    mov [remainder], edx

    ; Check if remainder is 0
    cmp [remainder], 0
    je not_prime

    ; Increment divisor
    inc dword [divisor]
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
    mov edx, 23
    int 0x80

end_program:
    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

