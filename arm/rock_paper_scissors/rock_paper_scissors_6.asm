; Rock Paper Scissors Game in ARM Assembly
; This program simulates a simple rock-paper-scissors game.
; The user will input their choice, and the program will randomly generate a choice for the computer.
; The program will then determine the winner based on the classic rules of the game.
; Note: This program is designed to be verbose and educational, with detailed comments explaining each step.

    .data
user_choice:    .asciz "Enter your choice (rock, paper, scissors): "
comp_choice:    .asciz "Computer chose: "
result_msg:     .asciz "Result: "
rock:           .asciz "rock"
paper:          .asciz "paper"
scissors:       .asciz "scissors"
newline:        .asciz "\n"
invalid_input:  .asciz "Invalid input!\n"

    .bss
user_input:     .space 20
comp_input:     .space 20

    .text
    .global _start

_start:
    ; Print the prompt for user input
    ldr r0, =user_choice
    bl print_string

    ; Read user input
    ldr r0, =user_input
    bl read_string

    ; Generate computer choice
    bl generate_computer_choice

    ; Print computer choice
    ldr r0, =comp_choice
    bl print_string
    ldr r0, =comp_input
    bl print_string
    ldr r0, =newline
    bl print_string

    ; Determine the winner
    bl determine_winner

    ; Exit the program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    mov r1, r0
    mov r2, #20
    mov r7, #4
    svc 0
    bx lr

; Function to read a string
read_string:
    mov r1, r0
    mov r2, #20
    mov r7, #3
    svc 0
    bx lr

; Function to generate computer choice
generate_computer_choice:
    ; Randomly choose between rock, paper, and scissors
    mov r0, #1
    bl random_number
    cmp r0, #0
    beq choose_rock
    cmp r0, #1
    beq choose_paper
    b choose_scissors

choose_rock:
    ldr r0, =rock
    ldr r1, =comp_input
    bl copy_string
    bx lr

choose_paper:
    ldr r0, =paper
    ldr r1, =comp_input
    bl copy_string
    bx lr

choose_scissors:
    ldr r0, =scissors
    ldr r1, =comp_input
    bl copy_string
    bx lr

; Function to copy a string
copy_string:
    ldrb r2, [r0], #1
    strb r2, [r1], #1
    cmp r2, #0
    bne copy_string
    bx lr

; Function to generate a random number (0, 1, or 2)
random_number:
    ; This is a placeholder for a random number generator
    ; In a real implementation, this would use a hardware RNG or a more complex algorithm
    mov r0, #2
    bx lr

; Function to determine the winner
determine_winner:
    ; Compare user input with computer input
    ldr r0, =user_input
    ldr r1, =comp_input
    bl compare_strings
    cmp r0, #0
    beq tie

    ; Check if user wins
    ldr r0, =user_input
    ldr r1, =rock
    bl compare_strings
    cmp r0, #0
    beq check_rock_win

    ldr r0, =user_input
    ldr r1, =paper
    bl compare_strings
    cmp r0, #0
    beq check_paper_win

    ldr r0, =user_input
    ldr r1, =scissors
    bl compare_strings
    cmp r0,