; Number Guessing Game in x86 Assembly
; This program is a simple number guessing game where the user tries to guess a randomly generated number.
; The program will provide feedback on whether the guess is too high or too low.
; The purpose of this program is to provide a fun and educational experience for learning assembly language.
; It also demonstrates various assembly language constructs and techniques.

section .data
    prompt db "Guess the number (0-9): ", 0
    too_high db "Too high!", 0
    too_low db "Too low!", 0
    correct db "Correct!", 0
    newline db 10, 0

section .bss
    guess resb 1
    random_number resb 1
    temp resb 1

section .text
    global _start

_start:
    ; Seed the random number generator
    ; Using the current time as the seed
    call get_random_number

    ; Main game loop
game_loop:
    ; Print the prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 20
    int 0x80

    ; Read the user's guess
    mov eax, 3
    mov ebx, 0
    mov ecx, guess
    mov edx, 1
    int 0x80

    ; Convert the guess from ASCII to integer
    sub byte [guess], '0'

    ; Compare the guess to the random number
    mov al, [guess]
    cmp al, [random_number]
    je correct_guess
    jl guess_too_low
    jg guess_too_high

guess_too_low:
    ; Print "Too low!"
    mov eax, 4
    mov ebx, 1
    mov ecx, too_low
    mov edx, 8
    int 0x80
    jmp print_newline

guess_too_high:
    ; Print "Too high!"
    mov eax, 4
    mov ebx, 1
    mov ecx, too_high
    mov edx, 9
    int 0x80
    jmp print_newline

correct_guess:
    ; Print "Correct!"
    mov eax, 4
    mov ebx, 1
    mov ecx, correct
    mov edx, 8
    int 0x80

print_newline:
    ; Print a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Loop back to the start of the game loop
    jmp game_loop

get_random_number:
    ; Get the current time
    mov eax, 13
    int 0x80

    ; Use the time as a seed for the random number generator
    mov [temp], eax

    ; Generate a random number between 0 and 9
    mov eax, [temp]
    xor edx, edx
    mov ecx, 10
    div ecx
    mov [random_number], dl

    ret

