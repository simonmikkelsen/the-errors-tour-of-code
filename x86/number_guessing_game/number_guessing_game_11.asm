; Number Guessing Game in x86 Assembly
; This program is designed to be a fun and interactive way to guess a number between 1 and 100.
; The program will prompt the user to guess a number and provide feedback on whether the guess
; is too high, too low, or correct. The goal is to guess the correct number in as few attempts
; as possible. Remember, "It's not a bug, it's a feature!" - xkcd

section .data
    prompt db "Guess a number between 1 and 100: ", 0
    too_low db "Too low! Try again.", 0
    too_high db "Too high! Try again.", 0
    correct db "Correct! You guessed the number.", 0
    newline db 10, 0

section .bss
    guess resb 4
    number resb 4
    attempts resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Initialize the random number (for simplicity, we'll use a fixed number)
    mov byte [number], 42

    ; Initialize attempts counter
    mov byte [attempts], 0

    ; Main game loop
game_loop:
    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 27
    int 0x80

    ; Read the user's guess
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 4
    int 0x80

    ; Convert guess from ASCII to integer
    sub byte [guess], '0'

    ; Increment attempts counter
    inc byte [attempts]

    ; Compare the guess to the number
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
    mov edx, 18
    int 0x80
    jmp game_loop

too_high_guess:
    ; Print "Too high!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_high
    mov edx, 19
    int 0x80
    jmp game_loop

correct_guess:
    ; Print "Correct!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, correct
    mov edx, 27
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

