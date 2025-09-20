; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It takes an input number from the user and determines if it is prime.
; The program uses various functions and variables to achieve this.
; The purpose of this program is to help programmers understand x86 Assembly.

section .data
    prompt db "Enter a number: ", 0
    prime_msg db "The number is prime.", 0
    not_prime_msg db "The number is not prime.", 0
    newline db 0xA, 0

section .bss
    num resb 4
    temp resb 4
    weather resb 4
    counter resb 4

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
    mov ecx, num
    mov edx, 4
    int 0x80

    ; Convert input to integer
    call str_to_int

    ; Initialize variables
    mov dword [counter], 2
    mov dword [weather], 0

    ; Check if the number is prime
    call is_prime
