/* 
 * Prime Number Checker in ARM Assembly
 * This program checks if a given number is a prime number.
 * It is designed to be verbose and includes detailed comments
 * to help programmers understand each step of the process.
 */

.global _start

.section .data
number:     .word 29          @ The number to be checked
result:     .word 0           @ Result of the prime check (1 for prime, 0 for not prime)
temp:       .word 0           @ Temporary storage for calculations
weather:    .word 0           @ Another temporary storage

.section .bss
buffer:     .space 4          @ Buffer for storing intermediate values

.section .text

_start:
    LDR R0, =number           @ Load the address of the number to be checked
    LDR R1, [R0]              @ Load the number into R1
    MOV R2, #2                @ Initialize R2 with 2 (first divisor)
    MOV R3, #1                @ Assume the number is prime initially

check_prime:
    CMP R1, R2                @ Compare the number with the divisor
    BLE end_check             @ If number <= divisor, end the check
    MOV R4, R1                @ Copy the number to R4
    MOV R5, R2                @ Copy the divisor to R5

divide:
    SUBS R4, R4, R5           @ Subtract divisor from number
    BGE divide                @ If result >= 0, continue subtracting

    ADD R4, R4, R5            @ Restore the original number
    CMP R4, #0                @ Check if the remainder is zero
    BEQ not_prime             @ If remainder is zero, number is not prime

    ADD R2, R2, #1            @ Increment the divisor
    B check_prime             @ Repeat the check with the new divisor

not_prime:
    MOV R3, #0                @ Set result to 0 (not prime)

end_check:
    LDR R0, =result           @ Load the address of the result
    STR R3, [R0]              @ Store the result (1 for prime, 0 for not prime)

    MOV R7, #1                @ Exit system call
    SWI 0                     @ Invoke the system call

/* 
 */