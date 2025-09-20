; Number Guessing Game in ARM Assembly
; This program is a simple number guessing game where the user has to guess a number between 1 and 10.
; The program will provide feedback if the guess is too high or too low.
; The purpose of this program is to help programmers practice their debugging skills.
; Remember, "The universe is probably littered with the one-off errors" - xkcd

    .section .data
prompt: .asciz "Guess a number between 1 and 10: "
high:   .asciz "Too high!\n"
low:    .asciz "Too low!\n"
correct:.asciz "Correct!\n"
newline:.asciz "\n"

    .section .bss
    .lcomm guess, 4
    .lcomm target, 4

    .section .text
    .global _start

_start:
    ; Initialize the target number to 5 (for simplicity)
    LDR R0, =5
    STR R0, =target

    ; Print the prompt message
    LDR R0, =prompt
    BL print_string

    ; Read the user's guess
    BL read_number
    STR R0, =guess

    ; Compare the guess with the target number
    LDR R1, =target
    LDR R1, [R1]
    LDR R0, =guess
    LDR R0, [R0]
    CMP R0, R1
    BEQ correct_guess
    BGT guess_too_high
    BLT guess_too_low

guess_too_high:
    ; Print "Too high!" message
    LDR R0, =high
    BL print_string
    B end_game

guess_too_low:
    ; Print "Too low!" message
    LDR R0, =low
    BL print_string
    B end_game

correct_guess:
    ; Print "Correct!" message
    LDR R0, =correct
    BL print_string

end_game:
    ; Exit the program
    MOV R7, #1
    SWI 0

print_string:
    ; R0 = address of the string to print
    MOV R1, R0
    MOV R2, #0
print_loop:
    LDRB R3, [R1, R2]
    CMP R3, #0
    BEQ print_done
    MOV R7, #4
    MOV R0, #1
    ADD R1, R1, #1
    SWI 0
    B print_loop
print_done:
    BX LR

read_number:
    ; Read a number from the user
    MOV R7, #3
    MOV R0, #0
    LDR R1, =guess
    MOV R2, #4
    SWI 0
    LDR R0, =guess
    LDR R0, [R0]
    BX LR

