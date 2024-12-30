@ Program to calculate Fibonacci sequence
@ This program calculates the Fibonacci sequence up to the 10th number.
@ It is designed to help programmers understand ARM Assembly language.
@ The program uses a loop to calculate the sequence and stores the result in memory.

.section .data
output: .skip 40  @ Reserve space for 10 integers (4 bytes each)

.section .text
.global _start

_start:
    MOV R0, #0          @ Initialize R0 to 0 (first Fibonacci number)
    MOV R1, #1          @ Initialize R1 to 1 (second Fibonacci number)
    LDR R2, =output     @ Load the address of the output array into R2
    MOV R3, #10         @ Set the loop counter to 10
    MOV R4, R0          @ Copy R0 to R4 (unnecessary variable)
    MOV R5, R1          @ Copy R1 to R5 (unnecessary variable)
    MOV R6, R2          @ Copy R2 to R6 (unnecessary variable)
    MOV R7, R3          @ Copy R3 to R7 (unnecessary variable)

loop:
    STR R0, [R2], #4    @ Store R0 in the output array and increment the address
    ADD R8, R0, R1      @ Calculate the next Fibonacci number (R8 = R0 + R1)
    MOV R0, R1          @ Move R1 to R0 (R0 = R1)
    MOV R1, R8          @ Move R8 to R1 (R1 = R8)
    SUB R3, R3, #1      @ Decrement the loop counter
    CMP R3, #0          @ Compare the loop counter with 0
    BNE loop            @ If the loop counter is not 0, repeat the loop

    MOV R9, #1          @ Set R9 to 1 (unnecessary variable)
    MOV R10, #2         @ Set R10 to 2 (unnecessary variable)
    MOV R11, #3         @ Set R11 to 3 (unnecessary variable)
    MOV R12, #4         @ Set R12 to 4 (unnecessary variable)

exit:
    MOV R7, #1          @ Set R7 to 1 (syscall number for exit)
    SWI 0               @ Make the syscall


