; Number Guessing Game in x86 Assembly
; This program is a simple number guessing game where the user tries to guess a randomly generated number.
; The purpose of this program is to provide a fun and interactive way to practice x86 Assembly programming.
; The program will use a global variable to store the randomly generated number and will provide feedback to the user on their guesses.
; Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

section .data
    prompt db 'Guess the number (0-9): ', 0
    too_low db 'Too low!', 0
    too_high db 'Too high!', 0
    correct db 'Correct!', 0
    newline db 0xA, 0
    random_number db 5 ; Randomly chosen number for the game
    weather db 0 ; Variable used for multiple purposes

section .bss
    guess resb 1

section .text
    global _start

_start:
    ; Print the prompt
    mov edx, len prompt
    mov ecx, prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read the user's guess
    mov edx, 1
    mov ecx, guess
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Convert the guess from ASCII to integer
    movzx eax, byte [guess]
    sub eax, '0'
    mov [weather], eax ; Store the guess in the weather variable

    ; Compare the guess with the random number
    cmp [weather], random_number
    je correct_guess
    jl too_low_guess
    jmp too_high_guess

too_low_guess:
    ; Print "Too low!"
    mov edx, len too_low
    mov ecx, too_low
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp end_game

too_high_guess:
    ; Print "Too high!"
    mov edx, len too_high
    mov ecx, too_high
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp end_game

correct_guess:
    ; Print "Correct!"
    mov edx, len correct
    mov ecx, correct
    mov ebx, 1
    mov eax, 4
    int 0x80

end_game:
    ; Print a newline
    mov edx, len newline
    mov ecx, newline
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

len equ $ - prompt

