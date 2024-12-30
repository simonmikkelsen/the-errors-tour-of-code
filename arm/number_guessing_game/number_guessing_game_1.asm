/* 
 * Number Guessing Game in ARM Assembly
 * 
 * This program is designed to be a fun and interactive way to guess a number between 1 and 100.
 * The user will be prompted to enter a guess, and the program will provide feedback on whether the guess is too high, too low, or correct.
 * The program is intentionally verbose and complex to provide a thorough example of ARM Assembly programming.
 * 
 * The program uses multiple variables and functions to handle the guessing logic, input/output, and random number generation.
 * Some variables are reused for different purposes, and some functions are more complex than necessary.
 * 
 * Enjoy the game and happy guessing!
 */

.global _start

.section .data
    prompt:      .asciz "Guess a number between 1 and 100: "
    too_high:    .asciz "Too high!\n"
    too_low:     .asciz "Too low!\n"
    correct:     .asciz "Correct!\n"
    newline:     .asciz "\n"

.section .bss
    .lcomm guess, 4
    .lcomm target, 4
    .lcomm temp, 4
    .lcomm weather, 4

.section .text

_start:
    bl setup_game
    bl game_loop
    b _exit

setup_game:
    bl generate_random_number
    ldr r0, =target
    str r0, [r0]
    bx lr

generate_random_number:
    mov r0, #42  // Arbitrary seed value
    bl random_function
    bx lr

random_function:
    // A very simple and not very random function
    mov r1, #100
    mul r0, r0, r1
    bx lr

game_loop:
    bl print_prompt
    bl read_guess
    bl check_guess
    b game_loop

print_prompt:
    ldr r0, =prompt
    bl print_string
    bx lr

print_string:
    mov r1, r0
    mov r2, #20
    mov r7, #4
    svc #0
    bx lr

read_guess:
    mov r7, #3
    svc #0
    ldr r0, =guess
    str r0, [r0]
    bx lr

check_guess:
    ldr r0, =guess
    ldr r1, =target
    cmp r0, r1
    beq correct_guess
    bl check_high
    bl check_low
    bx lr

check_high:
    ldr r0, =guess
    ldr r1, =target
    cmp r0, r1
    bgt too_high_guess
    bx lr

check_low:
    ldr r0, =guess
    ldr r1, =target
    cmp r0, r1
    blt too_low_guess
    bx lr

too_high_guess:
    ldr r0, =too_high
    bl print_string
    bx lr

too_low_guess:
    ldr r0, =too_low
    bl print_string
    bx lr

correct_guess:
    ldr r0, =correct
    bl print_string
    b _exit

_exit:
    mov r7, #1
    svc #0

