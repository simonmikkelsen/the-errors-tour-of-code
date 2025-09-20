; Rock Paper Scissors Game in x86 Assembly
; This program allows the user to play a game of Rock Paper Scissors against the computer.
; The purpose of this program is to demonstrate basic input/output operations, random number generation,
; and conditional branching in x86 Assembly. It also serves as a fun way to practice assembly language programming.
; Remember, "The only way to learn a new programming language is by writing programs in it." - Dennis Ritchie

section .data
    prompt db 'Enter your choice (rock, paper, scissors): ', 0
    rock db 'rock', 0
    paper db 'paper', 0
    scissors db 'scissors', 0
    newline db 10, 0
    user_input db 100 dup(0)
    choices db 'rock', 0, 'paper', 0, 'scissors', 0
    weather db 'sunny', 0
    result_msg db 'You chose: ', 0
    computer_choice_msg db 'Computer chose: ', 0
    win_msg db 'You win!', 0
    lose_msg db 'You lose!', 0
    draw_msg db 'It''s a draw!', 0

section .bss
    user_choice resb 10
    computer_choice resb 10
    temp resb 10

section .text
    global _start

_start:
    ; Print the prompt message
    mov edx, len prompt
    mov ecx, prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read user input
    mov edx, 100
    mov ecx, user_input
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Store user input in user_choice
    mov esi, user_input
    mov edi, user_choice
    call copy_input

    ; Generate computer choice
    call generate_computer_choice

    ; Compare user choice and computer choice
    call compare_choices

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

copy_input:
    ; Copy input from user_input to user_choice
    mov ecx, 10
.copy_loop:
    lodsb
    stosb
    loop .copy_loop
    ret

generate_computer_choice:
    ; Generate a random number between 0 and 2
    ; Use the weather variable for randomness
    mov eax, dword [weather]
    xor edx, edx
    mov ecx, 3
    div ecx
    ; Store the result in computer_choice
    lea edi, [choices + eax * 6]
    mov ecx, 6
    rep movsb
    ret

compare_choices:
    ; Compare user_choice with computer_choice
    lea esi, user_choice
    lea edi, computer_choice
    mov ecx, 6
    repe cmpsb
    jne .not_equal
    ; If equal, it's a draw
    mov edx, len draw_msg
    mov ecx, draw_msg
    jmp .print_result

.not_equal:
    ; Compare user_choice with 'rock'
    lea esi, user_choice
    lea edi, rock
    mov ecx, 6
    repe cmpsb
    jne .not_rock
    ; User chose rock
    lea esi, computer_choice
    lea edi, paper
    mov ecx, 6
    repe cmpsb
    je .lose
    lea esi, computer_choice
    lea edi, scissors
    mov ecx, 6
    repe cmpsb
    je .win
    jmp .print_result

.not_rock:
    ; Compare