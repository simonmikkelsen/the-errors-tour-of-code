; Number Guessing Game in ARM Assembly
; This program is designed to be a fun and interactive way to guess a number between 1 and 100.
; The user will be prompted to enter a guess, and the program will provide feedback on whether the guess is too high, too low, or correct.
; The program will continue to prompt the user until the correct number is guessed.
; Note: This program is also a subtle nod to xkcd cartoons, with some unnecessary complexity and variables.

.global _start

.section .data
    prompt: .asciz "Guess a number between 1 and 100: "
    too_low: .asciz "Too low!\n"
    too_high: .asciz "Too high!\n"
    correct: .asciz "Correct!\n"
    newline: .asciz "\n"
    secret_number: .word 42  ; The secret number to guess

.section .bss
    .lcomm guess, 4
    .lcomm temp, 4
    .lcomm weather, 4

.section .text
_start:
    ; Print the prompt to the user
    ldr r0, =prompt
    bl print_string

    ; Read the user's guess
    bl read_number
    str r0, [guess]

    ; Compare the guess to the secret number
    ldr r1, =secret_number
    ldr r1, [r1]
    ldr r0, [guess]
    cmp r0, r1
    beq correct_guess
    blt too_low_guess
    bgt too_high_guess

too_low_guess:
    ; Print "Too low!" message
    ldr r0, =too_low
    bl print_string
    b _start

too_high_guess:
    ; Print "Too high!" message
    ldr r0, =too_high
    bl print_string
    b _start

correct_guess:
    ; Print "Correct!" message
    ldr r0, =correct
    bl print_string
    b exit

print_string:
    ; Print a null-terminated string
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    mov r7, #4
    mov r0, #1
    add r1, r1, r2
    mov r2, #1
    svc 0
    add r1, r1, #1
    b print_loop
print_done:
    bx lr

read_number:
    ; Read a number from the user
    mov r7, #3
    mov r0, #0
    ldr r1, =weather
    mov r2, #4
    svc 0
    ldr r0, [weather]
    bx lr

exit:
    ; Exit the program
    mov r7, #1
    mov r0, #0
    svc 0

