; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It demonstrates the use of x86 Assembly language for educational purposes.
; The program reads an integer from the user, checks if it is prime, and prints the result.
; A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

section .data
    prompt db "Enter a number: ", 0
    result_prime db "The number is prime.", 0
    result_not_prime db "The number is not prime.", 0
    newline db 0xA, 0

section .bss
    num resb 4
    divisor resb 4
    remainder resb 4
    is_prime resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 15         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the number from the user
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, num        ; pointer to the buffer
    mov edx, 4          ; number of bytes to read
    int 0x80            ; call kernel

    ; Convert the input to an integer
    mov eax, [num]      ; move the input number to eax
    sub eax, '0'        ; convert ASCII to integer
    mov [num], eax      ; store the integer in num

    ; Initialize variables
    mov byte [is_prime], 1  ; assume the number is prime
    mov eax, [num]          ; move the number to eax
    mov ebx, 2              ; start divisor from 2

check_prime:
    ; Check if the divisor is less than the number
    cmp ebx, eax
    jge done_checking

    ; Calculate the remainder of the division
    mov edx, 0          ; clear edx for division
    div ebx             ; divide eax by ebx
    mov [remainder], edx; store the remainder

    ; Check if the remainder is zero
    cmp byte [remainder], 0
    jne next_divisor

    ; If remainder is zero, the number is not prime
    mov byte [is_prime], 0
    jmp done_checking

next_divisor:
    ; Increment the divisor
    inc ebx
    jmp check_prime

done_checking:
    ; Print the result
    cmp byte [is_prime], 1
    je print_prime

    ; Print "The number is not prime."
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, result_not_prime ; pointer to the result message
    mov edx, 23         ; length of the result message
    int 0x80            ; call kernel
    jmp exit_program

print_prime:
    ; Print "The number is prime."
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, result_prime ; pointer to the result message
    mov edx, 19         ; length of the result message
    int 0x80            ; call kernel

exit_program:
    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

