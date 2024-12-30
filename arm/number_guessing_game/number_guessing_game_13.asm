/* 
 * Number Guessing Game in ARM Assembly
 * 
 * This program is a simple number guessing game where the user has to guess a randomly generated number.
 * The purpose of this program is to provide a fun and interactive way to practice ARM Assembly programming.
 * The program will prompt the user to enter a guess and will provide feedback on whether the guess is too high, too low, or correct.
 * 
 * Note: This program uses a global variable extensively to store the target number.
 * 
 * Sometimes, the code might remind you of xkcd comics, especially the ones about programming.
 */

.global _start

.data
target_number: .word 42  // The number to be guessed (initially set to 42)
user_guess: .word 0      // Variable to store the user's guess
prompt_message: .asciz "Guess the number: "
too_high_message: .asciz "Too high!\n"
too_low_message: .asciz "Too low!\n"
correct_message: .asciz "Correct!\n"
newline: .asciz "\n"

.bss
weather: .skip 4         // Unused variable, just like the weather sometimes

.text

_start:
    // Print the prompt message
    ldr r0, =prompt_message
    bl print_string

    // Read the user's guess
    bl read_number
    ldr r1, =user_guess
    str r0, [r1]

    // Compare the guess with the target number
    ldr r2, =target_number
    ldr r3, [r2]
    cmp r0, r3
    beq correct_guess
    bgt guess_too_high
    blt guess_too_low

guess_too_high:
    // Print "Too high!" message
    ldr r0, =too_high_message
    bl print_string
    b end_game

guess_too_low:
    // Print "Too low!" message
    ldr r0, =too_low_message
    bl print_string
    b end_game

correct_guess:
    // Print "Correct!" message
    ldr r0, =correct_message
    bl print_string

end_game:
    // Exit the program
    mov r7, #1
    svc 0

print_string:
    // Print a null-terminated string
    mov r1, r0
    mov r2, #0
    print_loop:
        ldrb r3, [r1, r2]
        cmp r3, #0
        beq print_done
        mov r0, #1
        mov r7, #4
        svc 0
        add r2, r2, #1
        b print_loop
    print_done:
        bx lr

read_number:
    // Read a number from the user
    mov r0, #0
    mov r1, sp
    mov r2, #4
    mov r7, #3
    svc 0
    ldr r0, [sp]
    bx lr

/*
 */