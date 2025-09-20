; Number Guessing Game in x86 Assembly
; This program is a simple number guessing game where the user tries to guess
; a randomly generated number between 1 and 100. The program will provide
; feedback on whether the guess is too high, too low, or correct.
; The purpose of this program is to demonstrate basic input/output operations,
; random number generation, and control flow in x86 assembly language.
; Remember, "It's not a bug, it's a feature!" - xkcd

section .data
    prompt db "Guess a number between 1 and 100: ", 0
    too_low db "Too low! Try again: ", 0
    too_high db "Too high! Try again: ", 0
    correct db "Correct! You guessed the number!", 0
    newline db 10, 0

section .bss
    guess resb 4
    random_number resb 4
    temp resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Initialize random number (for simplicity, using a fixed number)
    mov dword [random_number], 42

    ; Print the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 27
    int 0x80

    ; Read user input
    call read_input

    ; Convert input to integer
    call atoi

    ; Compare guess with random number
compare_guess:
    mov eax, [guess]
    cmp eax, [random_number]
    je correct_guess
    jl too_low_guess
    jg too_high_guess

too_low_guess:
    ; Print "Too low!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_low
    mov edx, 20
    int 0x80

    ; Read user input again
    call read_input
    call atoi
    jmp compare_guess

too_high_guess:
    ; Print "Too high!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_high
    mov edx, 21
    int 0x80

    ; Read user input again
    call read_input
    call atoi
    jmp compare_guess

correct_guess:
    ; Print "Correct!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, correct
    mov edx, 30
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

read_input:
    ; Read input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 4
    int 0x80
    ret

atoi:
    ; Convert ASCII to integer
    mov eax, 0
    mov ecx, guess
    sub byte [ecx], '0'
    mov al, [ecx]
    mov [guess], eax
    ret

