; Rock Paper Scissors Game in ARM Assembly
; This program simulates a simple rock-paper-scissors game.
; The user will input their choice, and the program will randomly generate a choice for the computer.
; The program will then determine the winner and display the result.
; This program is designed to be educational and help programmers understand ARM Assembly.
; Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

.global _start

.section .data
user_choice: .asciz "Enter your choice (rock, paper, scissors): "
comp_choice: .asciz "Computer chose: "
result: .asciz "Result: "
rock: .asciz "rock"
paper: .asciz "paper"
scissors: .asciz "scissors"
win: .asciz "You win!"
lose: .asciz "You lose!"
draw: .asciz "It's a draw!"
newline: .asciz "\n"

.section .bss
.lcomm buffer, 100

.section .text

_start:
    ; Print user prompt
    ldr r0, =user_choice
    bl print_string

    ; Read user input
    ldr r0, =buffer
    mov r1, #100
    bl read_string

    ; Generate computer choice
    bl generate_computer_choice

    ; Compare choices and determine result
    bl compare_choices

    ; Print result
    ldr r0, =result
    bl print_string
    ldr r0, =newline
    bl print_string

    ; Exit program
    mov r7, #1
    svc 0

print_string:
    ; r0 = address of string
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc 0
    bx lr

read_string:
    ; r0 = address of buffer
    ; r1 = size of buffer
    mov r2, r1
    mov r7, #3
    svc 0
    bx lr

generate_computer_choice:
    ; Generate a random number between 0 and 2
    mov r0, #0
    bl rand
    mov r1, #3
    bl mod
    ; Store result in r4
    mov r4, r0
    bx lr

compare_choices:
    ; Compare user choice with computer choice
    ldr r0, =buffer
    ldr r1, =rock
    bl strcmp
    cmp r0, #0
    beq user_chose_rock

    ldr r1, =paper
    bl strcmp
    cmp r0, #0
    beq user_chose_paper

    ldr r1, =scissors
    bl strcmp
    cmp r0, #0
    beq user_chose_scissors

    ; Default case
    b invalid_choice

user_chose_rock:
    cmp r4, #0
    beq draw_case
    cmp r4, #1
    beq lose_case
    cmp r4, #2
    beq win_case

user_chose_paper:
    cmp r4, #0
    beq win_case
    cmp r4, #1
    beq draw_case
    cmp r4, #2
    beq lose_case

user_chose_scissors:
    cmp r4, #0
    beq lose_case
    cmp r4, #1
    beq win_case
    cmp r4, #2
    beq draw_case

win_case:
    ldr r0, =win
    bl print_string
    b end_compare

lose_case:
    ldr r0, =lose
    bl print_string
    b end_compare

draw_case:
    ldr r0, =draw
    bl print_string
    b