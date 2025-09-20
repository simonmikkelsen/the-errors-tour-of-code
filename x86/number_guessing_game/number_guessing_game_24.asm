; Number Guessing Game in x86 Assembly
; This program is a simple number guessing game where the user has to guess a randomly generated number.
; The purpose of this program is to provide a fun and interactive way to practice x86 Assembly programming.
; The program will prompt the user to enter a guess and will provide feedback on whether the guess is too high, too low, or correct.
; The game continues until the user guesses the correct number.
; Remember, "It's not a bug, it's a feature!" - xkcd

section .data
    prompt db "Guess the number (0-9): ", 0
    too_low db "Too low!", 0
    too_high db "Too high!", 0
    correct db "Correct! You guessed the number!", 0
    newline db 0xA, 0

section .bss
    guess resb 1
    random_number resb 1
    temp resb 1

section .text
    global _start

_start:
    ; Initialize random number (for simplicity, using a fixed number)
    mov byte [random_number], 5

    ; Main game loop
game_loop:
    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 20
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 1
    int 0x80

    ; Convert ASCII to integer
    sub byte [guess], '0'

    ; Compare guess with random number
    mov al, [guess]
    cmp al, [random_number]
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
    jmp game_loop

too_high_guess:
    ; Print "Too high!" message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_high
    mov edx, 9
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
    mov ebx, 0
    int 0x80

    ; Close a resource (file descriptor 0)
    mov eax, 6
    mov ebx, 0
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    mov ebx, 0
    int 0x80

