; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to help programmers understand the flow of an assembly program.
; The program uses various registers and memory locations to perform the check.
; It includes detailed comments to explain each step of the process.

section .data
    prompt db "Enter a number: ", 0
    result_prime db "The number is prime.", 0
    result_not_prime db "The number is not prime.", 0

section .bss
    number resb 1
    divisor resb 1
    remainder resb 1
    temp resb 1

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
    mov edx, 1          ; number of bytes to read
    int 0x80            ; call kernel

    ; Convert ASCII to integer
    sub byte [number], '0'

    ; Initialize divisor to 2
    mov byte [divisor], 2

check_prime:
    ; Check if divisor is greater than number / 2
    mov al, [number]
    shr al, 1
    cmp [divisor], al
    jae is_prime

    ; Calculate remainder of number / divisor
    mov al, [number]
    xor ah, ah
    div byte [divisor]
    mov [remainder], ah

    ; Check if remainder is zero
    cmp [remainder], 0
    je not_prime

    ; Increment divisor
    inc byte [divisor]
    jmp check_prime

is_prime:
    ; Print the result message for prime number
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, result_prime ; pointer to the result message
    mov edx, 19         ; length of the result message
    int 0x80            ; call kernel
    jmp exit

not_prime:
    ; Print the result message for not prime number
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, result_not_prime ; pointer to the result message
    mov edx, 23         ; length of the result message
    int 0x80            ; call kernel

exit:
    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

