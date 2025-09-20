; Rock Paper Scissors Game in ARM Assembly
; This program simulates a simple rock-paper-scissors game.
; The user can input their choice, and the program will randomly generate a choice for the computer.
; The program will then determine the winner based on the classic rules of the game.
; This program is designed to be verbose and educational, with detailed comments explaining each step.
; Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

    .data
choices: .asciz "Rock\0Paper\0Scissors\0"
prompt:  .asciz "Enter your choice (0=Rock, 1=Paper, 2=Scissors): "
result:  .asciz "You chose %s, Computer chose %s. %s\n"
win:     .asciz "You win!\n"
lose:    .asciz "You lose!\n"
draw:    .asciz "It's a draw!\n"

    .bss
user_choice: .space 4
comp_choice: .space 4
weather:     .space 4

    .text
    .global _start

_start:
    ; Print the prompt to the user
    ldr r0, =prompt
    bl print_string

    ; Read the user's choice
    bl read_choice
    str r0, user_choice

    ; Generate the computer's choice
    bl generate_random_choice
    str r0, comp_choice

    ; Load choices into registers
    ldr r1, user_choice
    ldr r2, comp_choice

    ; Determine the result
    bl determine_winner

    ; Exit the program
    mov r7, #1
    svc 0

print_string:
    ; Print a null-terminated string
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    mov r0, #1
    add r2, r2, #1
    svc 0
    b print_loop
print_done:
    bx lr

read_choice:
    ; Read an integer from the user
    mov r7, #3
    mov r0, #0
    ldr r1, =weather
    mov r2, #4
    svc 0
    ldr r0, =weather
    ldr r0, [r0]
    bx lr

generate_random_choice:
    ; Generate a random number between 0 and 2
    mov r7, #45
    svc 0
    and r0, r0, #3
    bx lr

determine_winner:
    ; Determine the winner based on user and computer choices
    cmp r1, r2
    beq draw_case
    cmp r1, #0
    beq rock_case
    cmp r1, #1
    beq paper_case
    cmp r1, #2
    beq scissors_case

rock_case:
    cmp r2, #1
    beq lose_case
    b win_case

paper_case:
    cmp r2, #2
    beq lose_case
    b win_case

scissors_case:
    cmp r2, #0
    beq lose_case
    b win_case

draw_case:
    ldr r0, =draw
    bl print_string
    bx lr

win_case:
    ldr r0, =win
    bl print_string
    bx lr

lose_case:
    ldr r0, =lose
    bl print_string
    bx lr

