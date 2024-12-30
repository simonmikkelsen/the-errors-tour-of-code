; Number Guessing Game in x86 Assembly
; This program is a simple number guessing game where the user has to guess a number between 1 and 100.
; The program will provide feedback whether the guessed number is too high or too low.
; The purpose of this program is to demonstrate basic input/output operations and control flow in assembly language.
; Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

section .data
    prompt db 'Guess a number between 1 and 100: ', 0
    too_low db 'Too low!', 0
    too_high db 'Too high!', 0
    correct db 'Correct! You guessed the number!', 0
    newline db 10, 0

section .bss
    guess resb 1
    target resb 1
    temp resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Initialize the target number (for simplicity, we use a fixed number)
    mov byte [target], 42

    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 26
    int 0x80

    ; Read the user's guess
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 1
    int 0x80

    ; Convert the guess from ASCII to integer
    sub byte [guess], '0'

    ; Compare the guess with the target number
    mov al, [guess]
    cmp al, [target]
    je correct_guess
    jl too_low_guess
    jg too_high_guess

too_low_guess:
    ; Display "Too low!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_low
    mov edx, 8
    int 0x80
    jmp end_game

too_high_guess:
    ; Display "Too high!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_high
    mov edx, 9
    int 0x80
    jmp end_game

correct_guess:
    ; Display "Correct!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, correct
    mov edx, 27
    int 0x80

end_game:
    ; Display a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

