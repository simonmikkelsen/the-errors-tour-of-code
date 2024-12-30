; This program calculates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is written in ARM Assembly language.
; The purpose of this program is to demonstrate the use of loops, conditionals, and basic arithmetic operations in ARM Assembly.

    .section .data
    .global _start

    .section .bss
    .lcomm result, 40  ; Reserve space for 10 integers (4 bytes each)

    .section .text

_start:
    MOV R0, #0          ; Initialize R0 to 0 (first number in Fibonacci sequence)
    MOV R1, #1          ; Initialize R1 to 1 (second number in Fibonacci sequence)
    MOV R2, #0          ; Initialize R2 to 0 (index counter)
    MOV R3, #10         ; Initialize R3 to 10 (number of Fibonacci numbers to calculate)
    LDR R4, =result     ; Load the address of the result array into R4

loop:
    CMP R2, R3          ; Compare index counter with the number of Fibonacci numbers to calculate
    BEQ end_loop        ; If index counter equals 10, exit the loop

    STR R0, [R4, R2, LSL #2] ; Store the current Fibonacci number in the result array

    ADD R5, R0, R1      ; Calculate the next Fibonacci number
    MOV R0, R1          ; Move the second number to the first number
    MOV R1, R5          ; Move the next Fibonacci number to the second number

    ADD R2, R2, #1      ; Increment the index counter
    B loop              ; Repeat the loop

end_loop:
    MOV R7, #1          ; System call number for exit
    MOV R0, #0          ; Exit code 0
    SWI 0               ; Make the system call





