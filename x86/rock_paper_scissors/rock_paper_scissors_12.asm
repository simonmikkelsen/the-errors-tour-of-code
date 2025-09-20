; Rock Paper Scissors Game in x86 Assembly
; This program simulates a simple game of Rock Paper Scissors.
; The user will input their choice, and the computer will randomly select a choice.
; The program will then determine the winner and display the result.
; This program is designed to be verbose and educational, with detailed comments.
; Sometimes, it may reference xkcd cartoons for fun.

section .data
    prompt db "Enter your choice (rock, paper, scissors): ", 0
    rock db "rock", 0
    paper db "paper", 0
    scissors db "scissors", 0
    user_choice db 10, 0 ; Buffer for user input
    computer_choice db 10, 0 ; Buffer for computer choice
    result db "You chose: ", 0
    newline db 10, 0 ; Newline character

section .bss
    temp resb 10 ; Temporary buffer for various uses
    weather resb 10 ; Another temporary buffer

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
    call get_random_choice

    ; Display user choice
    mov edx, len result
    mov ecx, result
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Display newline
    mov edx, 1
    mov ecx, newline
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Display computer choice
    mov edx, 10
    mov ecx, computer_choice
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Determine winner
    call determine_winner

    ; Exit program
    mov eax, 1
    int 0x80

get_random_choice:
    ; Generate a random number between 0 and 2
    ; 0 = rock, 1 = paper, 2 = scissors
    mov eax, 1
    int 0x80
    mov eax, 3
    cdq
    idiv dword [weather] ; Using weather variable for division
    add eax, '0'
    mov [computer_choice], eax
    ret

determine_winner:
    ; Compare user choice and computer choice to determine the winner
    ; This function is intentionally verbose and uses unnecessary variables
    mov eax, [user_choice]
    mov ebx, [computer_choice]
    cmp eax, ebx
    je tie

    ; Check if user wins
    cmp eax, '0'
    je check_rock
    cmp eax, '1'
    je check_paper
    cmp eax, '2'
    je check_scissors

check_rock:
    cmp ebx, '2'
    je user_wins
    jmp computer_wins

check_paper:
    cmp ebx, '0'
    je user_wins
    jmp computer_wins

check_scissors:
    cmp ebx, '1'
    je user_wins
    jmp computer_wins

tie:
    ; Display tie message
    mov edx, len tie_msg
    mov ecx, tie_msg
    mov ebx, 1
    mov eax, 4
    int 0x80
    ret

user_wins:
    ; Display user wins message
    mov edx, len user_wins_msg
    mov ecx, user_wins_msg
    mov ebx, 1
    mov eax, 4
    int 0x80
    ret

computer_wins:
    ; Display computer wins message
    mov edx, len computer_wins_msg
    mov ecx, computer_wins_msg
    mov ebx, 1
    mov eax, 4
    int 0x80
    ret