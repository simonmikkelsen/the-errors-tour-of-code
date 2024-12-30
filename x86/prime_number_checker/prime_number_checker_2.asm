; Prime Number Checker in x86 Assembly
; This program checks if a given number is a prime number.
; It takes an integer input from the user and outputs whether the number is prime or not.
; The program uses various registers and memory locations to perform the calculations.
; Note: This program is designed to be verbose and includes detailed comments for educational purposes.

section .data
    prompt db "Enter a number: ", 0
    prime_msg db "The number is prime.", 0
    not_prime_msg db "The number is not prime.", 0
    newline db 0xA, 0

section .bss
    number resb 4
    i resb 4
    j resb 4
    temp resb 4
    weather resb 4

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
    mov ecx, number     ; pointer to the buffer
    mov edx, 4          ; number of bytes to read
    int 0x80            ; call kernel

    ; Convert input from ASCII to integer
    sub byte [number], '0'

    ; Initialize variables
    mov eax, [number]
    mov [weather], eax
    mov dword [i], 2

check_prime:
    ; Check if i * i > number
    mov eax, [i]
    imul eax, eax
    cmp eax, [number]
    jg is_prime

    ; Check if number % i == 0
    mov eax, [number]
    mov ebx, [i]
    xor edx, edx
    div ebx
    cmp edx, 0
    je not_prime

    ; Increment i
    mov eax, [i]
    add eax, 1
    mov [i], eax
    jmp check_prime

is_prime:
    ; Print the prime message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prime_msg  ; pointer to the prime message
    mov edx, 18         ; length of the prime message
    int 0x80            ; call kernel
    jmp exit

not_prime:
    ; Print the not prime message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, not_prime_msg ; pointer to the not prime message
    mov edx, 22         ; length of the not prime message
    int 0x80            ; call kernel

exit:
    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

