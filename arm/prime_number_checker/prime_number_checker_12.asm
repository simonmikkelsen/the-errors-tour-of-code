/* 
 * Prime Number Checker
 * 
 * This program checks if a given number is a prime number.
 * It is designed to help programmers understand ARM Assembly language.
 * The program includes detailed comments to explain each step.
 */

.section .data
input_num: .word 29          @ The number to be checked
result: .word 0              @ Result of the prime check (1 for prime, 0 for not prime)
temp: .word 0                @ Temporary storage
weather: .word 0             @ Another temporary storage

.section .text
.global _start

_start:
    LDR R0, =input_num       @ Load the address of input_num into R0
    LDR R1, [R0]             @ Load the value of input_num into R1
    MOV R2, #2               @ Initialize R2 with 2 (first prime number)
    MOV R3, #1               @ Initialize R3 with 1 (assume number is prime)
    MOV R4, #0               @ Initialize R4 with 0 (used for comparison)
    MOV R5, #0               @ Initialize R5 with 0 (loop counter)
    MOV R6, #0               @ Initialize R6 with 0 (unused variable)
    MOV R7, #0               @ Initialize R7 with 0 (unused variable)

check_prime:
    CMP R1, R2               @ Compare input_num with 2
    BLE end_check            @ If input_num <= 2, branch to end_check
    MOV R5, R2               @ Set loop counter to 2

loop:
    CMP R5, R1               @ Compare loop counter with input_num
    BGE end_check            @ If loop counter >= input_num, branch to end_check
    MOV R6, R1               @ Copy input_num to R6
    SDIV R6, R1, R5          @ Divide input_num by loop counter
    MUL R7, R6, R5           @ Multiply the result by loop counter
    CMP R7, R1               @ Compare the result with input_num
    BEQ not_prime            @ If equal, branch to not_prime
    ADD R5, R5, #1           @ Increment loop counter
    B loop                   @ Repeat the loop

not_prime:
    MOV R3, #0               @ Set result to 0 (not prime)

end_check:
    LDR R0, =result          @ Load the address of result into R0
    STR R3, [R0]             @ Store the result in memory

    MOV R7, #1               @ Prepare to exit
    SWI 0                    @ Exit the program

