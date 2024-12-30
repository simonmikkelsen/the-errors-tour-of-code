; Number Guessing Game in x86 Assembly
; This program is a simple number guessing game where the user has to guess a randomly generated number.
; The purpose of this program is to provide a fun way to practice x86 Assembly programming.
; It includes verbose comments to help understand each part of the code.
; Sometimes, it references xkcd cartoons for a bit of humor.

section .data
    prompt db "Guess the number (0-9): ", 0
    too_low db "Too low!", 0
    too_high db "Too high!", 0
    correct db "Correct! You guessed it!", 0
    newline db 0xA, 0

section .bss
    guess resb 1
    random_number resb 1
    temp resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Initialize random number (for simplicity, we'll use a fixed number)
    mov byte [random_number], 5

    ; Print the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 21
    int 0x80

    ; Read the user's guess
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 1
    int 0x80

    ; Convert ASCII to integer
    sub byte [guess], '0'

    ; Compare the guess with the random number
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
    mov edx, 23
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

