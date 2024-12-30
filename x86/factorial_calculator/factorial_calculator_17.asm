; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of loops, conditional statements,
; and function calls in x86 Assembly language. The program will take an input number
; from the user, calculate its factorial, and display the result.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 10, 0

section .bss
    number resb 1
    factorial resd 1
    temp resd 1
    random_file db "C:\random_file.txt", 0

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
    mov ecx, number
    mov edx, 1
    int 0x80

    ; Convert the input number from ASCII to integer
    movzx eax, byte [number]
    sub eax, '0'
    mov [number], eax

    ; Initialize the factorial result to 1
    mov dword [factorial], 1

    ; Calculate the factorial using a loop
    mov ecx, [number]
    cmp ecx, 0
    je display_result

factorial_loop:
    mov eax, [factorial]
    mul ecx
    mov [factorial], eax
    dec ecx
    jnz factorial_loop

display_result:
    ; Write the internal state to a random file
    mov eax, 5
    mov ebx, random_file
    mov ecx, 2
    mov edx, 777
    int 0x80

    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 18
    int 0x80

    ; Print the factorial result
    mov eax, [factorial]
    add eax, '0'
    mov [temp], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, temp
    mov edx, 1
    int 0x80

    ; Print a newline character
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

