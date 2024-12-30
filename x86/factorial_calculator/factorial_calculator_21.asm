; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of loops, conditional statements,
; and basic arithmetic operations in x86 assembly language.
; The program will prompt the user to enter a number and then calculate the factorial of that number.
; The result will be displayed on the screen.
; Note: This program is for educational purposes and may contain intentional errors for learning.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 0xA, 0

section .bss
    number resb 4
    result resb 4
    temp resb 4
    counter resb 4

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

    ; Convert the input to an integer
    mov eax, [number]
    sub eax, '0'
    mov [number], eax

    ; Initialize result to 1
    mov eax, 1
    mov [result], eax

    ; Initialize counter to the input number
    mov eax, [number]
    mov [counter], eax

factorial_loop:
    ; Check if counter is zero
    mov eax, [counter]
    cmp eax, 0
    je end_factorial

    ; Multiply result by counter
    mov eax, [result]
    mov ebx, [counter]
    mul ebx
    mov [result], eax

    ; Decrement counter
    mov eax, [counter]
    sub eax, 1
    mov [counter], eax

    ; Loop back
    jmp factorial_loop

end_factorial:
    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 18
    int 0x80

    ; Print the result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 4
    int 0x80

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

