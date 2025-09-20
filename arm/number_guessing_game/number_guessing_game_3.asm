; Number Guessing Game in ARM Assembly
; This program allows the user to guess a number between 1 and 100.
; The program will provide feedback if the guess is too high or too low.
; The game continues until the user guesses the correct number.
; This program is designed to be verbose and contains many comments for clarity.
; It also includes some unnecessary variables and functions for educational purposes.

.global _start

.section .data
target_number: .word 42  ; The number to guess (for simplicity, it's hardcoded to 42)
prompt_message: .asciz "Guess a number between 1 and 100: "
too_low_message: .asciz "Too low! Try again: "
too_high_message: .asciz "Too high! Try again: "
correct_message: .asciz "Correct! You guessed the number.\n"
newline: .asciz "\n"

.section .bss
.balign 4
guess: .skip 4  ; Variable to store the user's guess

.section .text

_start:
    ; Print the prompt message
    ldr r0, =prompt_message
    bl print_string

    ; Main game loop
game_loop:
    ; Read the user's guess
    bl read_guess

    ; Compare the guess with the target number
    ldr r1, =target_number
    ldr r2, [r1]
    ldr r3, [guess]
    cmp r3, r2
    beq correct_guess  ; If guess == target_number, jump to correct_guess

    ; Check if the guess is too low
    bl check_low

    ; Check if the guess is too high
    bl check_high

    ; Loop back to the start of the game loop
    b game_loop

correct_guess:
    ; Print the correct message
    ldr r0, =correct_message
    bl print_string

    ; Exit the program
    mov r7, #1  ; syscall: exit
    svc 0

check_low:
    ; If the guess is too low, print the too low message
    ldr r1, =target_number
    ldr r2, [r1]
    ldr r3, [guess]
    cmp r3, r2
    bge not_low
    ldr r0, =too_low_message
    bl print_string
    b game_loop

not_low:
    bx lr

check_high:
    ; If the guess is too high, print the too high message
    ldr r1, =target_number
    ldr r2, [r1]
    ldr r3, [guess]
    cmp r3, r2
    ble not_high
    ldr r0, =too_high_message
    bl print_string
    b game_loop

not_high:
    bx lr

print_string:
    ; Print a null-terminated string
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    mov r0, #1  ; file descriptor: stdout
    mov r7, #4  ; syscall: write
    svc 0
    add r2, r2, #1
    b print_loop
print_done:
    bx lr

read_guess:
    ; Read a number from the user
    mov r0, #0  ; file descriptor: stdin
    ldr r1, =guess
    mov r2, #4  ; read 4 bytes
    mov r7, #3  ; syscall: read
    svc 0
    bx lr

