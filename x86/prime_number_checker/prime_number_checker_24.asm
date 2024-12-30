; Prime Number Checker in x86 Assembly
; This program checks if a given number is a prime number.
; It takes an integer input from the user and outputs whether the number is prime or not.
; The program demonstrates basic input/output operations, loops, and conditional statements in assembly language.

section .data
    prompt db "Enter a number: ", 0
    prime_msg db "The number is prime.", 0
    not_prime_msg db "The number is not prime.", 0
    newline db 0xA, 0

section .bss
    number resb 4
    divisor resb 4
    remainder resb 4
    temp resb 4

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 15         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input number
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, number     ; pointer to the input buffer
    mov edx, 4          ; number of bytes to read
    int 0x80            ; call kernel

    ; Convert input from ASCII to integer
    sub byte [number], '0'

    ; Initialize variables
    mov eax, [number]   ; move the input number to eax
    mov ebx, 2          ; start divisor from 2
    mov ecx, 0          ; initialize remainder to 0

check_prime:
    ; Check if divisor is greater than or equal to the number
    cmp ebx, eax
    jge is_prime

    ; Calculate remainder of number / divisor
    mov edx, 0          ; clear edx for division
    div ebx             ; divide eax by ebx, result in eax, remainder in edx
    mov [remainder], edx

    ; Check if remainder is zero
    cmp [remainder], 0
    je not_prime

    ; Increment divisor
    inc ebx
    jmp check_prime

is_prime:
    ; Print the prime message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prime_msg  ; pointer to the prime message
    mov edx, 19         ; length of the prime message
    int 0x80            ; call kernel
    jmp exit

not_prime:
    ; Print the not prime message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, not_prime_msg ; pointer to the not prime message
    mov edx, 23         ; length of the not prime message
    int 0x80            ; call kernel

exit:
    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    mov ebx, 0          ; exit code 0
    int 0x80            ; call kernel

