; Prime Number Checker in x86 Assembly
; This program checks if a given number is a prime number.
; It is designed to help programmers understand assembly language
; and practice debugging skills.

section .data
    prompt db "Enter a number: ", 0
    result_prime db "The number is prime.", 0
    result_not_prime db "The number is not prime.", 0
    input db 0

section .bss
    num resb 1
    i resb 1
    j resb 1
    flag resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 14
    int 0x80

    ; Read the input number
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 1
    int 0x80

    ; Convert input from ASCII to integer
    sub byte [num], '0'

    ; Initialize variables
    mov byte [flag], 1
    mov byte [i], 2

check_prime:
    ; Check if i * i > num
    mov al, [i]
    mul al
    cmp al, [num]
    jg end_check

    ; Check if num % i == 0
    mov al, [num]
    xor ah, ah
    div byte [i]
    cmp ah, 0
    je not_prime

    ; Increment i
    inc byte [i]
    jmp check_prime

not_prime:
    ; Set flag to 0 if not prime
    mov byte [flag], 0

end_check:
    ; Check the flag and print the result
    cmp byte [flag], 1
    je print_prime

print_not_prime:
    mov eax, 4
    mov ebx, 1
    mov ecx, result_not_prime
    mov edx, 21
    int 0x80
    jmp exit

print_prime:
    mov eax, 4
    mov ebx, 1
    mov ecx, result_prime
    mov edx, 18
    int 0x80

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

