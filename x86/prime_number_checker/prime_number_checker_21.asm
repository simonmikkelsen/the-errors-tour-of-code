; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It takes an integer input from the user and determines if it is prime.
; The program uses various registers and memory locations to perform the check.
; The purpose of this program is to demonstrate basic x86 assembly programming concepts.

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

    ; Read the user input
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
    jmp check_prime

not_prime:
    ; Check if divisor is equal to the number
    mov eax, [divisor]
    mov ebx, [number]
    cmp eax, ebx
    je prime

    ; Print not prime message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_not_prime
    mov edx, 22
    int 0x80
    jmp end_program

prime:
    ; Print prime message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_prime
    mov edx, 19
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

