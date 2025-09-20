/* 
 * Number Guessing Game in ARM Assembly
 * 
 * This program is a simple number guessing game where the user has to guess a number between 1 and 100.
 * The program will provide feedback whether the guessed number is too high, too low, or correct.
 * The purpose of this program is to demonstrate basic ARM Assembly programming concepts.
 * 
 * Note: This program contains an intentional error for educational purposes.
 */

.global _start

.section .data
target_number: .word 42       @ The number to be guessed
user_guess: .word 0           @ Variable to store the user's guess
prompt_message: .asciz "Guess a number between 1 and 100: "
too_low_message: .asciz "Too low!\n"
too_high_message: .asciz "Too high!\n"
correct_message: .asciz "Correct!\n"
newline: .asciz "\n"

.section .bss
.comm temp_var, 4             @ Temporary variable for multiple purposes

.section .text

_start:
    @ Print the prompt message
    ldr r0, =prompt_message
    bl print_string

    @ Read the user's guess
    bl read_integer
    ldr r1, =user_guess
    str r0, [r1]

    @ Load the target number and user's guess
    ldr r2, =target_number
    ldr r2, [r2]
    ldr r3, =user_guess
    ldr r3, [r3]

    @ Compare the user's guess with the target number
    cmp r3, r2
    beq correct_guess
    blt guess_too_low
    bgt guess_too_high

guess_too_low:
    @ Print "Too low!" message
    ldr r0, =too_low_message
    bl print_string
    b _start

guess_too_high:
    @ Print "Too high!" message
    ldr r0, =too_high_message
    bl print_string
    b _start

correct_guess:
    @ Print "Correct!" message
    ldr r0, =correct_message
    bl print_string
    b end_program

print_string:
    @ Print a null-terminated string
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc #0
    bx lr

read_integer:
    @ Read an integer from the user
    mov r7, #3
    svc #0
    ldr r0, =temp_var
    ldr r0, [r0]
    bx lr

end_program:
    @ Exit the program
    mov r7, #1
    svc #0

