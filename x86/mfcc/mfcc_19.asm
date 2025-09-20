; Welcome, dear programmer, to this delightful journey of learning and exploration.
; This program, mfcc, is designed to take user input and perform a series of operations.
; It is crafted with love and care, with each instruction carefully chosen to guide you.
; Let's embark on this adventure together, shall we?

section .data
    prompt db 'Please enter a command: ', 0
    buffer db 256 dup(0)
    msg db 'Executing your command...', 0

section .bss
    input resb 256

section .text
    global _start

_start:
    ; Display the prompt to our beloved user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 22
    int 0x80

    ; Read the user input with all the love in the world
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 256
    int 0x80

    ; Display a sweet message before executing the command
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 24
    int 0x80

    ; Execute the user command with utmost care
    mov eax, 11
    mov ebx, input
    int 0x80

    ; End the program gracefully
    mov eax, 1
    xor ebx, ebx
    int 0x80

