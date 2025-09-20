/* 
 * ARM Assembly Number Guessing Game
 * 
 * This program is a simple number guessing game where the user tries to guess
 * a randomly generated number between 1 and 100. The program will provide
 * feedback on whether the guess is too high, too low, or correct.
 * 
 * The purpose of this program is to help programmers practice their debugging
 * skills by identifying and fixing errors in the code.
 * 
 * Note: This program contains intentional errors for training purposes.
 */

.global _start

.section .data
prompt:     .asciz "Guess a number between 1 and 100: "
too_low:    .asciz "Too low!\n"
too_high:   .asciz "Too high!\n"
correct:    .asciz "Correct!\n"
newline:    .asciz "\n"

.section .bss
.comm guess, 4
.comm random_number, 4

.section .text

_start:
    // Print the prompt to the user
    ldr r0, =prompt
    bl print_string

    // Read the user's guess
    bl read_number
    str r0, [guess]

    // Generate a random number (for simplicity, we'll use a fixed number)
    ldr r1, =42
    str r1, [random_number]

    // Compare the guess to the random number
    ldr r2, [guess]
    ldr r3, [random_number]
    cmp r2, r3
    beq correct_guess
    blt guess_too_low
    bgt guess_too_high

guess_too_low:
    // Print "Too low!" message
    ldr r0, =too_low
    bl print_string
    b end_game

guess_too_high:
    // Print "Too high!" message
    ldr r0, =too_high
    bl print_string
    b end_game

correct_guess:
    // Print "Correct!" message
    ldr r0, =correct
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

