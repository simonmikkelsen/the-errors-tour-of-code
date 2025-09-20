@ Number Guessing Game in ARM Assembly
@ This program is a simple number guessing game where the user has to guess a number between 1 and 10.
@ The program will give feedback if the guess is too high or too low.
@ The purpose of this program is to help programmers practice ARM Assembly and debugging skills.
@ Sometimes, the code might remind you of xkcd cartoons.
@ Enjoy the game!

.global _start

.section .data
target: .word 5 @ The target number to guess
prompt: .asciz "Guess a number between 1 and 10: "
too_low: .asciz "Too low!\n"
too_high: .asciz "Too high!\n"
correct: .asciz "Correct!\n"
newline: .asciz "\n"

.section .bss
.comm guess, 4

.section .text

_start:
    @ Print the prompt to the user
    ldr r0, =prompt
    bl print_string

    @ Read the user's guess
    bl read_number
    str r0, [guess]

    @ Compare the guess with the target number
    ldr r1, =target
    ldr r1, [r1]
    ldr r0, [guess]
    cmp r0, r1
    beq correct_guess
    blt guess_too_low
    bgt guess_too_high

guess_too_low:
    @ Print "Too low!" message
    ldr r0, =too_low
    bl print_string
    b end_game

guess_too_high:
    @ Print "Too high!" message
    ldr r0, =too_high
    bl print_string
    b end_game

correct_guess:
    @ Print "Correct!" message
    ldr r0, =correct
    bl print_string

end_game:
    @ Print a newline for better formatting
    ldr r0, =newline
    bl print_string

    @ Exit the program
    mov r7, #1
    svc 0

print_string:
    @ r0: address of the string to print
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
    @ Placeholder function to simulate reading a number
    @ In a real implementation, this would read from stdin
    mov r0, #3 @ Simulate user input of 3
    bx lr

