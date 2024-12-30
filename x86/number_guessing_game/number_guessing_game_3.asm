; Number Guessing Game in x86 Assembly
; This program allows the user to guess a number between 1 and 100.
; The program will provide feedback if the guess is too high or too low.
; The user has unlimited attempts to guess the correct number.
; This program is designed to be verbose and educational.
; Remember, "It's not a bug, it's a feature!" - xkcd

section .data
    prompt db "Guess a number between 1 and 100: ", 0
    too_low db "Too low! Try again: ", 0
    too_high db "Too high! Try again: ", 0
    correct db "Correct! You guessed the number!", 0
    newline db 10, 0

section .bss
    guess resb 4
    number resb 4
    attempts resb 4
    temp resb 4

section .text
    global _start

_start:
    ; Initialize the random number (for simplicity, hardcoded here)
    mov dword [number], 42

    ; Initialize attempts counter
    mov dword [attempts], 0

    ; Main game loop
game_loop:
    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 26
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 4
    int 0x80

    ; Convert input to integer
    mov eax, [guess]
    sub eax, '0'
    mov [temp], eax

    ; Increment attempts counter
    mov eax, [attempts]
    inc eax
    mov [attempts], eax

    ; Compare guess with the number
    mov eax, [temp]
    cmp eax, [number]
    je correct_guess
    jl guess_too_low
    jg guess_too_high

guess_too_low:
    ; Print "Too low" message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_low
    mov edx, 20
    int 0x80
    jmp game_loop

guess_too_high:
    ; Print "Too high" message
    mov eax, 4
    mov ebx, 1
    mov ecx, too_high
    mov edx, 21
    int 0x80
    jmp game_loop

correct_guess:
    ; Print "Correct" message
    mov eax, 4
    mov ebx, 1
    mov ecx, correct
    mov edx, 30
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

