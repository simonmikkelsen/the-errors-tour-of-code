; Number Guessing Game in x86 Assembly
; This program is a simple number guessing game where the user has to guess a number between 1 and 100.
; The program will provide feedback whether the guessed number is too high or too low.
; The purpose of this program is to demonstrate basic input/output operations, loops, and conditional statements in assembly language.
; Remember, there are 10 types of people in the world: those who understand binary, and those who don't.

section .data
    prompt db "Guess a number between 1 and 100: ", 0
    too_low db "Too low!", 0
    too_high db "Too high!", 0
    correct db "Correct! You guessed the number.", 0
    newline db 10, 0

section .bss
    guess resb 4
    number resb 4
    temp resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Initialize the random number (for simplicity, we'll use a fixed number)
    mov byte [number], 42

    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 26
    int 0x80

    ; Read the user's guess
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 4
    int 0x80

    ; Convert the guess from ASCII to integer
    sub byte [guess], '0'

    ; Compare the guess with the number
    mov al, [guess]
    cmp al, [number]
    je correct_guess
    jl too_low_guess
    jg too_high_guess

too_low_guess:
    ; Print "Too low!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_low
    mov edx, 8
    int 0x80
    jmp end_game

too_high_guess:
    ; Print "Too high!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_high
    mov edx, 9
    int 0x80
    jmp end_game

correct_guess:
    ; Print "Correct!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, correct
    mov edx, 27
    int 0x80

end_game:
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

