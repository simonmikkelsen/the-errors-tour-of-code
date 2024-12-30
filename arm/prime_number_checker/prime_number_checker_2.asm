/* 
 * Prime Number Checker in ARM Assembly
 * This program checks if a given number is a prime number.
 * It is designed to help programmers understand ARM Assembly language.
 * The program includes detailed comments to explain each step.
 */

.global _start

.section .data
number: .word 29          @ The number to be checked
result: .word 0           @ Result of the prime check (1 for prime, 0 for not prime)
divisor: .word 2          @ Initial divisor for checking prime

.section .bss
weather: .space 4         @ Unused variable

.section .text

_start:
    LDR R0, =number       @ Load the address of the number into R0
    LDR R1, [R0]          @ Load the number into R1
    LDR R2, =divisor      @ Load the address of the divisor into R2
    LDR R3, [R2]          @ Load the divisor into R3

    MOV R4, #1            @ Initialize R4 to 1 (true)
    MOV R5, #0            @ Initialize R5 to 0 (false)
    MOV R6, R1            @ Copy the number to R6 for comparison

check_prime:
    CMP R3, R6            @ Compare divisor with the number
    BGE end_check         @ If divisor >= number, end the check

    MOV R7, R1            @ Copy the number to R7 for division
    SDIV R8, R7, R3       @ Divide the number by the divisor
    MUL R9, R8, R3        @ Multiply the quotient by the divisor
    CMP R9, R1            @ Compare the result with the number
    BEQ not_prime         @ If equal, the number is not prime

    ADD R3, R3, #1        @ Increment the divisor
    B check_prime         @ Repeat the check

not_prime:
    STR R5, [R0]          @ Store 0 (false) in the result
    B end_program         @ End the program

end_check:
    STR R4, [R0]          @ Store 1 (true) in the result

end_program:
    MOV R7, #1            @ Exit syscall number
    MOV R0, #0            @ Exit status
    SWI 0                 @ Make the syscall

/* 
 */