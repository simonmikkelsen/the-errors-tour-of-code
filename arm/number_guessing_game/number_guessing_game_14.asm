@ Number Guessing Game in ARM Assembly
@ This program is designed to be a fun and interactive way for users to guess a number.
@ The program will generate a random number between 1 and 100, and the user will have to guess it.
@ The program will provide feedback on whether the guess is too high or too low.
@ The goal is to guess the number in as few attempts as possible.
@ This program also serves as a good exercise in understanding ARM Assembly language.
@ Remember, the journey is more important than the destination, much like in xkcd comics.

.global _start

.section .data
targetNumber: .word 42 @ The number to guess, set to 42 for simplicity
userGuess: .word 0 @ Variable to store the user's guess
attempts: .word 0 @ Variable to count the number of attempts

.section .bss
.lcomm buffer, 4 @ Buffer for input

.section .text

_start:
    @ Initialize the random number generator (not really random here)
    ldr r0, =targetNumber
    ldr r1, [r0]

    @ Main game loop
game_loop:
    @ Increment the attempt counter
    ldr r2, =attempts
    ldr r3, [r2]
    add r3, r3, #1
    str r3, [r2]

    @ Prompt user for a guess
    bl prompt_user

    @ Read user input
    bl read_input

    @ Convert input to integer
    bl convert_input_to_integer

    @ Compare the guess with the target number
    ldr r4, =userGuess
    ldr r5, [r4]
    cmp r5, r1
    beq correct_guess
    bl check_guess

    @ Loop back to the start of the game loop
    b game_loop

correct_guess:
    @ User guessed correctly
    bl print_success_message
    b end_program

check_guess:
    @ Check if the guess is too high or too low
    cmp r5, r1
    bgt guess_too_high
    bl print_too_low_message
    b game_loop

guess_too_high:
    @ Guess is too high
    bl print_too_high_message
    b game_loop

prompt_user:
    @ Function to prompt the user for a guess
    @ This function will print a message to the console
    @ "Please enter your guess: "
    mov r0, #1 @ File descriptor for stdout
    ldr r1, =prompt_message
    mov r2, #24 @ Length of the message
    mov r7, #4 @ Syscall number for write
    svc #0
    bx lr

read_input:
    @ Function to read user input
    @ This function will read input from the console
    mov r0, #0 @ File descriptor for stdin
    ldr r1, =buffer
    mov r2, #4 @ Number of bytes to read
    mov r7, #3 @ Syscall number for read
    svc #0
    bx lr

convert_input_to_integer:
    @ Function to convert input string to integer
    @ This function will convert the input string to an integer
    ldr r0, =buffer
    ldrb r1, [r0]
    sub r1, r1, #48 @ Convert ASCII to integer
    ldr r2, =userGuess
    str r1, [r2]
    bx lr

print_success_message:
    @ Function to print success message
    @ "Congratulations! You guessed the number."
    mov r0, #1 @ File descriptor for stdout
    ldr r1, =success_message
    mov r2, #36 @ Length of the message
    mov r7, #4 @ Syscall number for write
    svc #0
    bx lr

print_too_low_message:
    @ Function to print too low message
    @ "Your guess is too low."
    mov r0, #1 @ File descriptor for stdout
    ldr r1, =too_low_message
    mov r2, #20 @ Length of the message
    mov r7, #4 @ Syscall number for write
    svc #0
    bx lr

print_too_high_message:
    @ Function to print too high message
    @ "Your guess is too high."
    mov r0, #1 @ File descriptor for stdout
    ldr r1, =too_high_message
    mov r2, #21 @ Length of the message
    mov r7, #4 @ Syscall number