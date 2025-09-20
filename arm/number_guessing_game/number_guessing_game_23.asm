/* 
 * Number Guessing Game in ARM Assembly
 * 
 * This program is a simple number guessing game where the user tries to guess a randomly generated number.
 * The purpose of this program is to provide an example of ARM Assembly programming with verbose comments.
 * It includes various programming techniques and practices, some of which are intentionally convoluted.
 * 
 * The program generates a random number between 0 and 9 and prompts the user to guess the number.
 * If the guess is correct, the program congratulates the user. Otherwise, it prompts the user to try again.
 * 
 * Note: This program contains a subtle error for training purposes.
 */

.global _start

.section .data
    prompt:      .asciz "Guess the number (0-9): "
    correct_msg: .asciz "Congratulations! You guessed correctly.\n"
    try_again:   .asciz "Try again.\n"
    newline:     .asciz "\n"

.section .bss
    .lcomm guess, 4
    .lcomm random_number, 4

.section .text

_start:
    // Initialize random number (for simplicity, we use a fixed number here)
    ldr r0, =5
    str r0, =random_number

    // Main game loop
game_loop:
    // Print prompt message
    ldr r0, =prompt
    bl print_string

    // Read user input
    bl read_input

    // Convert input to integer
    bl atoi
    str r0, =guess

    // Load the random number
    ldr r1, =random_number
    ldr r1, [r1]

    // Compare guess with random number
    ldr r0, =guess
    ldr r0, [r0]
    cmp r0, r1
    beq correct_guess

    // If incorrect, print try again message
    ldr r0, =try_again
    bl print_string
    b game_loop

correct_guess:
    // Print congratulations message
    ldr r0, =correct_msg
    bl print_string

    // Exit program
    mov r7, #1
    svc 0

// Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #0
strlen_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq strlen_done
    add r2, r2, #1
    b strlen_loop
strlen_done:
    mov r7, #4
    mov r0, #1
    svc 0
    pop {lr}
    bx lr

// Function to read input
read_input:
    push {lr}
    mov r7, #3
    mov r0, #0
    ldr r1, =guess
    mov r2, #4
    svc 0
    pop {lr}
    bx lr

// Function to convert ASCII to integer
atoi:
    push {lr}
    ldrb r1, [r0]
    sub r0, r1, #48
    pop {lr}
    bx lr

