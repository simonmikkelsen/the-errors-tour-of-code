; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of loops, conditional statements,
; and basic arithmetic operations in x86 Assembly language.
; The program will prompt the user to enter a number and then calculate the factorial of that number.
; The result will be displayed on the screen.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 0xA, 0

section .bss
    number resb 4
    factorial resb 4
    temp resb 4

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 15
    int 0x80

    ; Read the user input
    mov eax, 3
    mov ebx, 0
    mov ecx, number
    mov edx, 4
    int 0x80

    ; Convert the input from ASCII to integer
    mov eax, [number]
    sub eax, '0'
    mov [number], eax

    ; Initialize the factorial result to 1
    mov eax, 1
    mov [factorial], eax

    ; Initialize the loop counter
    mov ecx, [number]

factorial_loop:
    ; Check if the loop counter is zero
    cmp ecx, 0
    je end_loop

    ; Multiply the factorial result by the loop counter
    mov eax, [factorial]
    imul eax, ecx
    mov [factorial], eax

    ; Decrement the loop counter
    dec ecx
    jmp factorial_loop

end_loop:
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

