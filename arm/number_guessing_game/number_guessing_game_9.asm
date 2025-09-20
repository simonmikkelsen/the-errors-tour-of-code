; Number Guessing Game in ARM Assembly
; This program is designed to allow the user to guess a number between 1 and 10.
; The program will provide feedback on whether the guess is too high, too low, or correct.
; The purpose of this program is to demonstrate basic input/output operations and control flow in ARM Assembly.
; Additionally, it serves as a fun exercise for programmers to practice their debugging skills.
; Remember, "It's not a bug, it's an undocumented feature." - xkcd

.global _start

.section .data
    prompt:      .asciz "Guess a number between 1 and 10: "
    too_low:     .asciz "Too low!\n"
    too_high:    .asciz "Too high!\n"
    correct:     .asciz "Correct!\n"
    newline:     .asciz "\n"

.section .bss
    .lcomm guess, 4
    .lcomm target, 4

.section .text

_start:
    ; Initialize the target number to 5 (the correct answer)
    LDR R0, =5
    STR R0, =target

    ; Main game loop
game_loop:
    ; Print the prompt message
    LDR R0, =prompt
    BL print_string

    ; Read the user's guess
    BL read_number
    STR R0, =guess

    ; Compare the guess to the target number
    LDR R1, =target
    LDR R2, =guess
    CMP R2, R1
    BEQ correct_guess
    BLT guess_too_low
    BGT guess_too_high

guess_too_low:
    ; Print "Too low!" message
    LDR R0, =too_low
    BL print_string
    B game_loop

guess_too_high:
    ; Print "Too high!" message
    LDR R0, =too_high
    BL print_string
    B game_loop

correct_guess:
    ; Print "Correct!" message
    LDR R0, =correct
    BL print_string
    B exit

exit:
    ; Exit the program
    MOV R7, #1
    SWI 0

; Function to print a string
print_string:
    PUSH {LR}
    MOV R1, R0
    MOV R2, #0
    print_loop:
        LDRB R3, [R1, R2]
        CMP R3, #0
        BEQ print_done
        MOV R0, #1
        MOV R7, #4
        SWI 0
        ADD R2, R2, #1
        B print_loop
    print_done:
        POP {LR}
        BX LR

; Function to read a number from the user
read_number:
    PUSH {LR}
    MOV R0, #0
    MOV R7, #3
    SWI 0
    LDR R0, =newline
    BL print_string
    POP {LR}
    BX LR

