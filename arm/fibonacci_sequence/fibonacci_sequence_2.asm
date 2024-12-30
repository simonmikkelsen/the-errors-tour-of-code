; This program calculates the Fibonacci sequence up to a certain number of terms.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is written in ARM Assembly language.
; It is intended to help programmers understand the implementation of the Fibonacci sequence in low-level code.

.global _start

.section .data
    ; Define the number of terms in the Fibonacci sequence
    num_terms: .word 10

.section .bss
    ; Reserve space for the Fibonacci sequence
    fib_sequence: .space 40

.section .text

_start:
    ; Load the number of terms into register r0
    ldr r0, =num_terms
    ldr r0, [r0]

    ; Initialize the first two terms of the Fibonacci sequence
    mov r1, #0
    mov r2, #1

    ; Store the first two terms in the fib_sequence array
    ldr r3, =fib_sequence
    str r1, [r3]
    add r3, r3, #4
    str r2, [r3]

    ; Initialize loop counter
    mov r4, #2

calculate_fib:
    ; Check if we have calculated the required number of terms
    cmp r4, r0
    bge end_program

    ; Calculate the next term in the sequence
    add r5, r1, r2

    ; Store the next term in the fib_sequence array
    add r3, r3, #4
    str r5, [r3]

    ; Update the previous two terms
    mov r1, r2
    mov r2, r5

    ; Increment the loop counter
    add r4, r4, #1

    ; Branch back to the start of the loop
    b calculate_fib

end_program:
    ; Exit the program
    mov r7, #1
    svc 0

