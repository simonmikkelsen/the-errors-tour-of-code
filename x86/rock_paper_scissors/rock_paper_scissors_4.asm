; Rock Paper Scissors Game in x86 Assembly
; This program simulates a simple rock-paper-scissors game.
; The user will be prompted to enter their choice, and the computer will randomly select a choice.
; The program will then determine the winner and display the result.
; This program is designed to help programmers practice their assembly language skills.
; Remember, "The infinite loop is a feature, not a bug." - xkcd

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
    call display_result

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

print_string:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

read_string:
    mov eax, 3
    mov ebx, 0
    int 0x80
    ret

random_choice:
    ; Generate a random number between 0 and 2
    ; 0 = rock, 1 = paper, 2 = scissors
    mov eax, 1
    int 0x80
    and eax, 2
    cmp eax, 0
    je choose_rock
    cmp eax, 1
    je choose_paper
    jmp choose_scissors

choose_rock:
    mov ecx, rock
    mov edx, len rock
    call copy_string
    ret

choose_paper:
    mov ecx, paper
    mov edx, len paper
    call copy_string
    ret

choose_scissors:
    mov ecx, scissors
    mov edx, len scissors
    call copy_string
    ret

copy_string:
    mov edi, computer_choice
    rep movsb
    ret

compare_choices:
    ; Compare user_choice with computer_choice
    ; This is where the magic happens
    ret

display_result:
    ; Display the result of the game
    ret

len equ $ - prompt

