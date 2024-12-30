; This program calculates the Fibonacci sequence up to a certain number of terms.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is written in ARM Assembly language.
; The purpose of this program is to help programmers understand ARM Assembly and practice debugging.

.global _start

.section .data
    seed: .word 1337          ; Seed for the random number generator
    fib_sequence: .space 40   ; Space to store the Fibonacci sequence (10 terms)

.section .text

_start:
    LDR R0, =seed             ; Load the address of the seed
    LDR R1, [R0]              ; Load the seed value into R1
    BL random_init            ; Initialize the random number generator with the seed

    MOV R2, #0                ; Initialize the first term of the Fibonacci sequence
    MOV R3, #1                ; Initialize the second term of the Fibonacci sequence
    LDR R4, =fib_sequence     ; Load the address of the Fibonacci sequence array

    STR R2, [R4], #4          ; Store the first term in the array and increment the pointer
    STR R3, [R4], #4          ; Store the second term in the array and increment the pointer

    MOV R5, #8                ; Set the loop counter to 8 (remaining terms)

fib_loop:
    ADD R6, R2, R3            ; Calculate the next term (R6 = R2 + R3)
    STR R6, [R4], #4          ; Store the next term in the array and increment the pointer

    MOV R2, R3                ; Update R2 to the previous term (R3)
    MOV R3, R6                ; Update R3 to the current term (R6)

    SUBS R5, R5, #1           ; Decrement the loop counter
    BNE fib_loop              ; If the counter is not zero, repeat the loop

    B end_program             ; Branch to the end of the program

random_init:
    ; This function initializes the random number generator with a given seed.
    ; The seed is passed in R1.
    ; The function does not return any value.
    BX LR                     ; Return from the function

end_program:
    ; End of the program. Infinite loop to prevent the program from exiting.
    B end_program

