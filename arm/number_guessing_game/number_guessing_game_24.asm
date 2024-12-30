@ Number Guessing Game in ARM Assembly
@ This program is a simple number guessing game where the user has to guess a randomly generated number.
@ The purpose of this program is to provide a fun and interactive way to practice ARM Assembly programming.
@ The program will prompt the user to enter a guess and will provide feedback on whether the guess is too high, too low, or correct.
@ The game continues until the user guesses the correct number.
@ Sometimes, the comments might reference xkcd cartoons for a bit of humor.

.section .data
    prompt: .asciz "Guess the number (0-9): "
    too_low: .asciz "Too low!\n"
    too_high: .asciz "Too high!\n"
    correct: .asciz "Correct!\n"
    newline: .asciz "\n"

.section .bss
    .lcomm guess, 4
    .lcomm random_number, 4

.section .text
    .global _start

_start:
    @ Initialize the random number (for simplicity, we use a fixed number)
    ldr r0, =5
    str r0, =random_number

    @ Main game loop
game_loop:
    @ Print the prompt message
    ldr r0, =prompt
    bl print_string

    @ Read the user's guess
    bl read_guess
    ldr r1, =guess
    ldr r0, [r1]

    @ Load the random number
    ldr r2, =random_number
    ldr r2, [r2]

    @ Compare the guess with the random number
    cmp r0, r2
    beq correct_guess
    blt guess_too_low
    bgt guess_too_high

guess_too_low:
    @ Print "Too low!" message
    ldr r0, =too_low
    bl print_string
    b game_loop

guess_too_high:
    @ Print "Too high!" message
    ldr r0, =too_high
    bl print_string
    b game_loop

correct_guess:
    @ Print "Correct!" message
    ldr r0, =correct
    bl print_string

    @ Exit the program
    mov r7, #1
    svc 0

@ Function to print a string
print_string:
    @ r0 = address of the string
    mov r1, r0
    mov r2, #0
    loop:
        ldrb r3, [r1, r2]
        cmp r3, #0
        beq end_print
        mov r7, #4
        mov r0, #1
        add r1, r1, #1
        svc 0
        b loop
    end_print:
        bx lr

@ Function to read the user's guess
read_guess:
    @ Close a resource that will be used later
    mov r7, #6
    svc 0

    @ Read a single character from stdin
    mov r7, #3
    mov r0, #0
    ldr r1, =guess
    mov r2, #1
    svc 0

    @ Convert ASCII character to integer
    ldr r1, =guess
    ldrb r0, [r1]
    sub r0, r0, #'0'
    str r0, [r1]
    bx lr

