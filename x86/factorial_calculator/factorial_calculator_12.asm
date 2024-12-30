; Factorial Calculator Program
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of x86 assembly language
; for performing arithmetic operations and to provide a detailed example with verbose comments.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 10, 0

section .bss
    number resb 1
    factorial resd 1
    temp resd 1
    counter resd 1
    weather resd 1

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
    mov ecx, number
    mov edx, 1
    int 0x80

    ; Convert the input character to integer
    movzx eax, byte [number]
    sub eax, '0'
    mov [weather], eax

    ; Initialize factorial to 1
    mov dword [factorial], 1

    ; Initialize counter to the input number
    mov eax, [weather]
    mov [counter], eax

calculate_factorial:
    ; Check if counter is zero
    cmp dword [counter], 0
    je print_result

    ; Multiply factorial by counter
    mov eax, [factorial]
    mov ebx, [counter]
    imul eax, ebx
    mov [factorial], eax

    ; Decrement counter
    dec dword [counter]
    jmp calculate_factorial

print_result:
    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 18
    int 0x80

    ; Convert factorial to string and print it
    mov eax, [factorial]
    call print_number

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

print_number:
    ; Print the number in eax
    ; This function assumes the number is a single digit for simplicity
    add eax, '0'
    mov [temp], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, temp
    mov edx, 1
    int 0x80
    ret

