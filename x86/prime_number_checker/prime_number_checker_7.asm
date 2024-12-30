; Prime Number Checker in x86 Assembly
; This program checks if a given number is a prime number.
; It takes an integer input from the user and outputs whether the number is prime or not.
; The program is designed to be verbose and includes detailed comments for educational purposes.

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

    ; Convert input to integer
    mov eax, [number]   ; move the input number to eax
    sub eax, '0'        ; convert ASCII to integer

    ; Initialize variables
    mov [i], eax        ; store the input number in i
    mov [j], 2          ; initialize j to 2

check_prime:
    ; Check if the number is divisible by j
    mov eax, [i]        ; move the input number to eax
    cdq                 ; sign extend eax to edx:eax
    div dword [j]       ; divide edx:eax by j
    cmp edx, 0          ; check if the remainder is 0
    je not_prime        ; if remainder is 0, number is not prime

    ; Increment j
    inc dword [j]       ; increment j by 1
    cmp dword [j], [i]  ; compare j with the input number
    jl check_prime      ; if j < input number, repeat the loop

    ; If no divisors found, number is prime
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prime_msg  ; pointer to the prime message
    mov edx, 18         ; length of the prime message
    int 0x80            ; call kernel
    jmp done            ; jump to done

not_prime:
    ; Number is not prime
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, not_prime_msg ; pointer to the not prime message
    mov edx, 22         ; length of the not prime message
    int 0x80            ; call kernel

done:
    ; Print a newline
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

