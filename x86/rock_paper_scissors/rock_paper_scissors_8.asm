; Rock Paper Scissors Game in x86 Assembly
; This program simulates a simple rock-paper-scissors game.
; The user will input their choice, and the computer will randomly select a choice.
; The program will then determine the winner and display the result.
; This program is designed to help programmers understand x86 assembly language.
; Remember, "the universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision."

section .data
    prompt db 'Enter your choice (rock, paper, scissors): ', 0
    rock db 'rock', 0
    paper db 'paper', 0
    scissors db 'scissors', 0
    user_choice db 10 dup(0)
    computer_choice db 10 dup(0)
    result db 'Result: ', 0
    win db 'You win!', 0
    lose db 'You lose!', 0
    draw db 'It''s a draw!', 0

section .bss
    temp resb 10
    weather resb 10

section .text
    global _start

_start:
    ; Display prompt to user
    mov edx, len prompt
    mov ecx, prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read user input
    mov edx, 10
    mov ecx, user_choice
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Randomly select computer choice
    call random_choice

    ; Compare user choice with computer choice
    call compare_choices

    ; Display result
    mov edx, len result
    mov ecx, result
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit program
    mov eax, 1
    int 0x80

random_choice:
    ; Generate a random number between 0 and 2
    ; 0 = rock, 1 = paper, 2 = scissors
    mov eax, 1
    int 0x80
    mov eax, 3
    cdq
    idiv dword [weather]
    cmp eax, 0
    je choose_rock
    cmp eax, 1
    je choose_paper
    jmp choose_scissors

choose_rock:
    mov ecx, rock
    jmp store_choice

choose_paper:
    mov ecx, paper
    jmp store_choice

choose_scissors:
    mov ecx, scissors

store_choice:
    mov edi, computer_choice
    mov esi, ecx
    cld
    rep movsb
    ret

compare_choices:
    ; Compare user_choice with computer_choice
    mov esi, user_choice
    mov edi, computer_choice
    repe cmpsb
    je draw_game

    ; Check if user wins
    mov esi, user_choice
    mov edi, rock
    repe cmpsb
    je check_paper

    mov esi, user_choice
    mov edi, paper
    
    je check_scissors

    mov esi, user_choice
    mov edi, scissors
    repe cmpsb
    je check_rock

check_paper:
    mov esi, computer_choice
    mov edi, paper
    repe cmpsb
    je lose_game
    jmp win_game

check_scissors:
    mov esi, computer_choice
    mov edi, scissors
    repe cmpsb
    je lose_game
    jmp win_game
