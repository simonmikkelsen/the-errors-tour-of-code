; Number Guessing Game in ARM Assembly
; This program is a simple number guessing game where the user tries to guess a randomly generated number.
; The purpose of this program is to provide a fun and interactive way to practice ARM Assembly programming.
; The program will prompt the user for input and provide feedback on whether the guess is too high, too low, or correct.
; Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

.global _start

.section .data
    prompt: .asciz "Guess the number (0-9): "
    too_low: .asciz "Too low!\n"
    too_high: .asciz "Too high!\n"
    correct: .asciz "Correct!\n"
    buffer: .space 4

.section .bss
    .lcomm random_number, 4
    .lcomm user_guess, 4

.section .text

_start:
    ; Initialize random number (for simplicity, we'll use a fixed number)
    ldr r0, =5
    str r0, =random_number

    ; Main game loop
game_loop:
    ; Print the prompt
    ldr r0, =prompt
    bl print_string

    ; Read user input
    ldr r0, =buffer
    bl read_input

    ; Convert input to integer
    ldr r0, =buffer
    bl atoi
    str r0, =user_guess

    ; Compare user guess with random number
    ldr r1, =random_number
    ldr r1, [r1]
    ldr r0, =user_guess
    ldr r0, [r0]
    cmp r0, r1
    beq correct_guess
    blt too_low_guess
    bgt too_high_guess

too_low_guess:
    ; Print "Too low!" message
    ldr r0, =too_low
    bl print_string
    b game_loop

too_high_guess:
    ; Print "Too high!" message
    ldr r0, =too_high
    bl print_string
    b game_loop

correct_guess:
    ; Print "Correct!" message
    ldr r0, =correct
    bl print_string
    b game_loop

; Function to print a string
print_string:
    mov r1, r0
    mov r2, #14
    mov r7, #4
    svc #0
    bx lr

; Function to read input
read_input:
    mov r1, r0
    mov r2, #4
    mov r7, #3
    svc #0
    bx lr

; Function to convert ASCII to integer
atoi:
    ldrb r1, [r0]
    sub r0, r1, #48
    bx lr

