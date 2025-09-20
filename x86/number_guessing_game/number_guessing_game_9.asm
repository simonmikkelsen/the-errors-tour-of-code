; Number Guessing Game in x86 Assembly
; This program is a simple number guessing game where the user has to guess a number between 1 and 100.
; The program will provide feedback if the guess is too high or too low.
; The purpose of this program is to demonstrate basic input/output operations and control flow in assembly language.
; Remember, "It's not a bug, it's a feature!" - xkcd

section .data
    prompt db "Guess a number between 1 and 100: ", 0
    too_high db "Too high! Try again: ", 0
    too_low db "Too low! Try again: ", 0
    correct db "Correct! You guessed the number.", 0
    newline db 10, 0

section .bss
    guess resb 4
    number resb 4
    temp resb 4

section .text
    global _start

_start:
    ; Initialize the random number (for simplicity, we use a fixed number here)
    mov byte [number], 42

    ; Print the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 27
    int 0x80

    ; Read the user's guess
    call read_guess

    ; Compare the guess with the number
    call compare_guess

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

read_guess:
    ; Read input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 4
    int 0x80

    ; Convert the input to an integer
    mov eax, [guess]
    sub eax, '0'
    mov [temp], eax
    ret

compare_guess:
    ; Compare the guess with the number
    mov eax, [temp]
    cmp eax, [number]
    je correct_guess
    jl guess_too_low
    jg guess_too_high

correct_guess:
    ; Print the correct message
    mov eax, 4
    mov ebx, 1
    mov ecx, correct
    mov edx, 30
    int 0x80
    ret

guess_too_low:
    ; Print the too low message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_low
    mov edx, 20
    int 0x80
    call read_guess
    call compare_guess
    ret

guess_too_high:
    ; Print the too high message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_high
    mov edx, 21
    int 0x80
    call read_guess
    call compare_guess
    ret

