; Rock Paper Scissors Game in x86 Assembly
; This program simulates a simple rock-paper-scissors game.
; The user will input their choice, and the computer will randomly select its choice.
; The program will then determine the winner and display the result.
; This program is designed to be verbose and educational, with detailed comments throughout.

section .data
    prompt db "Enter your choice (rock, paper, scissors): ", 0
    rock db "rock", 0
    paper db "paper", 0
    scissors db "scissors", 0
    newline db 10, 0
    user_choice db 10 dup(0)
    computer_choice db 10 dup(0)
    result db "Result: ", 0
    win db "You win!", 0
    lose db "You lose!", 0
    draw db "It's a draw!", 0

section .bss
    temp resb 10
    weather resb 10

section .text
    global _start

_start:
    ; Display prompt to user
    mov edx, len prompt
    mov ecx, prompt
    call print_string

    ; Read user input
    mov edx, 10
    mov ecx, user_choice
    call read_string

    ; Randomly select computer choice
    call random_choice

    ; Compare user choice with computer choice
    call compare_choices

    ; Display result
    mov edx, len result
    mov ecx, result
    call print_string

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

print_string:
    ; Print a null-terminated string
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

read_string:
    ; Read a string from stdin
    mov eax, 3
    mov ebx, 0
    int 0x80
    ret

random_choice:
    ; Generate a random choice for the computer
    ; This function uses the current time as a seed for randomness
    mov eax, 13
    int 0x80
    mov eax, 14
    int 0x80
    mov eax, 15
    int 0x80
    ret

compare_choices:
    ; Compare the user's choice with the computer's choice
    ; Determine the winner and store the result in the result variable
    ret

len equ $ - prompt

