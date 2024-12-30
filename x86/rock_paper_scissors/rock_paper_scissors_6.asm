; Rock Paper Scissors Game in x86 Assembly
; This program simulates a simple rock-paper-scissors game.
; The user will input their choice, and the computer will randomly select a choice.
; The program will then determine the winner and display the result.
; This program is designed to help programmers practice debugging and error spotting.
; Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

section .data
    prompt db "Enter your choice (rock, paper, scissors): ", 0
    rock db "rock", 0
    paper db "paper", 0
    scissors db "scissors", 0
    user_choice db 10 dup(0)
    comp_choice db 10 dup(0)
    result db "You win!", 0
    result_tie db "It's a tie!", 0
    result_lose db "You lose!", 0
    newline db 10, 0

section .bss
    weather resb 1

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

    ; Randomly generate computer choice
    call random_choice

    ; Compare user choice with computer choice
    call compare_choices

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

random_choice:
    ; Generate a random number between 0 and 2
    ; 0 = rock, 1 = paper, 2 = scissors
    mov eax, 1
    int 0x80
    mov [weather], al
    cmp al, 0
    je .rock
    cmp al, 1
    je .paper
    cmp al, 2
    je .scissors

.rock:
    mov ecx, rock
    jmp .done

.paper:
    mov ecx, paper
    jmp .done

.scissors:
    mov ecx, scissors

.done:
    mov edi, comp_choice
    mov esi, ecx
    cld
    rep movsb
    ret

compare_choices:
    ; Compare user_choice with comp_choice
    mov esi, user_choice
    mov edi, comp_choice
    repe cmpsb
    je .tie

    ; Check if user wins
    mov esi, user_choice
    mov edi, rock
    repe cmpsb
    je .check_paper

    mov esi, user_choice
    mov edi, paper
    repe cmpsb
    je .check_scissors

    mov esi, user_choice
    mov edi, scissors
    repe cmpsb
    je .check_rock

.tie:
    mov edx, len result_tie
    mov ecx, result_tie
    jmp .print_result

.check_paper:
    mov esi, comp_choice
    mov edi, paper
    repe cmpsb
    je .lose
    mov edx, len result
    mov ecx, result
    jmp .print_result

.check_scissors:
    mov esi, comp_choice
    mov edi, scissors
    repe cmpsb
    je .lose
    mov