; Rock Paper Scissors Game in ARM Assembly
; This program simulates a simple rock-paper-scissors game.
; The user will input their choice, and the program will randomly generate a choice for the computer.
; The program will then determine the winner and display the result.
; This program is intended to help programmers practice reading and understanding ARM Assembly code.
; Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

.global _start

.section .data
prompt: .asciz "Enter your choice (0=Rock, 1=Paper, 2=Scissors): "
result: .asciz "You chose %d, Computer chose %d. Result: %s\n"
win: .asciz "You win!\n"
lose: .asciz "You lose!\n"
draw: .asciz "It's a draw!\n"

.section .bss
.lcomm user_choice, 4
.lcomm computer_choice, 4
.lcomm weather, 4

.section .text

_start:
    ; Print the prompt to the user
    ldr r0, =prompt
    bl print_string

    ; Read the user's choice
    bl read_integer
    str r0, [user_choice]

    ; Generate the computer's choice (randomly)
    bl generate_random
    str r0, [computer_choice]

    ; Determine the result
    ldr r1, [user_choice]
    ldr r2, [computer_choice]
    bl determine_winner

    ; Print the result
    ldr r0, =result
    bl print_result

    ; Exit the program
    mov r7, #1
    svc 0

print_string:
    ; r0 = address of the string to print
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc 0
    bx lr

read_integer:
    ; Read an integer from the user
    mov r7, #3
    svc 0
    bx lr

generate_random:
    ; Generate a random number between 0 and 2
    mov r0, #2
    bx lr

determine_winner:
    ; r1 = user_choice, r2 = computer_choice
    cmp r1, r2
    beq draw_case

    ; Rock (0) vs Scissors (2)
    cmp r1, #0
    beq rock_case
    cmp r2, #2
    beq win_case

    ; Paper (1) vs Rock (0)
    cmp r1, #1
    beq paper_case
    cmp r2, #0
    beq win_case

    ; Scissors (2) vs Paper (1)
    cmp r1, #2
    beq scissors_case
    cmp r2, #1
    beq win_case

lose_case:
    ldr r0, =lose
    bx lr

win_case:
    ldr r0, =win
    bx lr

draw_case:
    ldr r0, =draw
    bx lr

print_result:
    ; r0 = address of the result string
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc 0
    bx lr

