/* 
 * ARM Assembly Number Guessing Game
 * 
 * This program is a simple number guessing game where the user has to guess a number between 0 and 9.
 * The program will provide feedback if the guess is too high or too low.
 * The purpose of this program is to help programmers practice their ARM Assembly skills.
 * 
 * Note: This program contains verbose comments to explain each step in detail.
 */

.global _start

.section .data
    prompt: .asciz "Guess a number between 0 and 9: "
    too_low: .asciz "Too low!\n"
    too_high: .asciz "Too high!\n"
    correct: .asciz "Correct!\n"
    newline: .asciz "\n"

.section .bss
    .lcomm guess, 4
    .lcomm target, 4

.section .text

_start:
    // Initialize the target number to 5 (the correct answer)
    ldr r0, =5
    str r0, =target

    // Main game loop
game_loop:
    // Print the prompt message
    ldr r0, =prompt
    bl print_string

    // Read the user's guess
    bl read_guess

    // Load the target number into r1
    ldr r1, =target
    ldr r1, [r1]

    // Compare the guess with the target number
    ldr r0, =guess
    ldr r0, [r0]
    cmp r0, r1

    // If the guess is less than the target, print "Too low!"
    blt too_low_message

    // If the guess is greater than the target, print "Too high!"
    bgt too_high_message

    // If the guess is equal to the target, print "Correct!" and exit
    beq correct_message

    // Loop back to the start of the game loop
    b game_loop

too_low_message:
    ldr r0, =too_low
    bl print_string
    b game_loop

too_high_message:
    ldr r0, =too_high
    bl print_string
    b game_loop

correct_message:
    ldr r0, =correct
    bl print_string
    b exit

print_string:
    // Print the string pointed to by r0
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc #0
    bx lr

read_guess:
    // Read a single character from stdin
    mov r0, #0
    ldr r1, =guess
    mov r2, #1
    mov r7, #3
    svc #0

    // Convert the ASCII character to an integer
    ldr r0, =guess
    ldrb r0, [r0]
    sub r0, r0, #'0'
    str r0, =guess
    bx lr

exit:
    // Exit the program
    mov r0, #0
    mov r7, #1
    svc #0

