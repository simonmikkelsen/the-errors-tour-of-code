/* 
 * Prime Number Checker
 * This program checks if a given number is a prime number.
 * It is designed to help programmers understand ARM Assembly language.
 * The program includes detailed comments to explain each step.
 */

.global _start

.section .data
number:     .word 29          @ The number to be checked
result:     .word 0           @ Result of the prime check (1 for prime, 0 for not prime)
temp:       .word 0           @ Temporary variable for calculations
counter:    .word 2           @ Counter starting from 2

.section .text

_start:
    LDR R0, =number           @ Load the address of the number into R0
    LDR R1, [R0]              @ Load the number into R1
    LDR R2, =result           @ Load the address of the result into R2
    MOV R3, #1                @ Assume the number is prime initially
    STR R3, [R2]              @ Store the assumption in the result

    LDR R4, =counter          @ Load the address of the counter into R4
    LDR R5, [R4]              @ Load the counter value into R5

check_loop:
    CMP R1, R5                @ Compare the number with the counter
    BLE end_check             @ If counter is greater than number, end the check

    MOV R6, R1                @ Copy the number to R6
    UDIV R7, R6, R5           @ Divide the number by the counter
    MUL R8, R7, R5            @ Multiply the quotient by the counter
    CMP R8, R1                @ Compare the result with the number
    BNE not_divisible         @ If not equal, the number is not divisible by counter

    MOV R3, #0                @ Set result to 0 (not prime)
    STR R3, [R2]              @ Store the result
    B end_check               @ End the check

not_divisible:
    ADD R5, R5, #1            @ Increment the counter
    STR R5, [R4]              @ Store the new counter value
    B check_loop              @ Repeat the loop

end_check:
    MOV R7, #1                @ Load 1 into R7 (exit code)
    SWI 0                     @ Exit the program

/* 
 */