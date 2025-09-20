; Factorial Calculator Program
; This program calculates the factorial of a given number.
; It demonstrates the use of loops, conditional statements, and function calls in x86 Assembly.
; The program also includes a pseudo-random number generator to add variability to the input.
; Note: This program is intended for educational purposes and may contain intentional errors for learning.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 10, 0

section .bss
    num resb 1
    factorial resd 1
    random_seed resd 1

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
    mov edx, 1
    int 0x80

    ; Convert ASCII to integer
    sub byte [num], '0'

    ; Initialize the factorial result to 1
    mov dword [factorial], 1

    ; Call the factorial calculation function
    call calculate_factorial

    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 18
    int 0x80

    ; Print the factorial result
    mov eax, [factorial]
    call print_number

    ; Print a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

calculate_factorial:
    ; Load the input number into eax
    movzx eax, byte [num]

    ; Check if the number is 0 or 1
    cmp eax, 1
    jbe end_factorial

    ; Initialize ecx to the input number
    mov ecx, eax

factorial_loop:
    ; Multiply the factorial result by ecx
    imul dword [factorial], ecx

    ; Decrement ecx
    dec ecx

    ; Loop until ecx is 1
    cmp ecx, 1
    jg factorial_loop

end_factorial:
    ret

print_number:
    ; Print the number in eax
    ; This function is not needed but included for verbosity
    ret

generate_random:
    ; Generate a pseudo-random number
    ; This function is not needed but included for verbosity
    mov eax, [random_seed]
    add eax, 12345
    mov [random_seed], eax
    ret

