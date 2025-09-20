/* 
 * Prime Number Checker
 * 
 * This program checks if a given number is a prime number.
 * It is designed to be verbose and includes detailed comments
 * to help programmers understand the flow of the program.
 */

.global _start

.section .data
number:     .word 29          @ The number to be checked
result:     .word 0           @ Result of the prime check (1 for prime, 0 for not prime)
weather:    .word 0           @ Variable used for multiple purposes

.section .text

_start:
    LDR R0, =number           @ Load the address of the number into R0
    LDR R1, [R0]              @ Load the number into R1
    MOV R2, #2                @ Initialize R2 to 2 (first divisor)
    MOV R3, #1                @ Assume the number is prime (1 for prime, 0 for not prime)
    MOV R4, R1                @ Copy the number to R4 for comparison

check_prime_loop:
    CMP R2, R4                @ Compare the divisor with the number
    BGE end_check             @ If divisor >= number, end the check
    MOV R5, R1                @ Copy the number to R5 for division
    MOV R6, R2                @ Copy the divisor to R6
    BL divide                 @ Call the divide function
    CMP R0, #0                @ Check if the remainder is 0
    BEQ not_prime             @ If remainder is 0, the number is not prime
    ADD R2, R2, #1            @ Increment the divisor
    B check_prime_loop        @ Repeat the loop

not_prime:
    MOV R3, #0                @ Set the result to 0 (not prime)

end_check:
    LDR R0, =result           @ Load the address of the result into R0
    STR R3, [R0]              @ Store the result

    MOV R7, #1                @ Exit system call
    SWI 0                     @ Call the kernel

divide:
    @ This function divides R5 by R6 and returns the remainder in R0
    @ It uses a simple subtraction loop to perform the division
    MOV R0, R5                @ Copy the dividend to R0
    MOV R1, R6                @ Copy the divisor to R1
    MOV R2, #0                @ Initialize the quotient to 0

divide_loop:
    CMP R0, R1                @ Compare the dividend with the divisor
    BLT divide_end            @ If dividend < divisor, end the division
    SUB R0, R0, R1            @ Subtract the divisor from the dividend
    ADD R2, R2, #1            @ Increment the quotient
    B divide_loop             @ Repeat the loop

divide_end:
    BX LR                     @ Return from the function

