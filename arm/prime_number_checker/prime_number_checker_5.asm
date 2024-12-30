/* 
 * Prime Number Checker in ARM Assembly
 * This program checks if a given number is a prime number.
 * It is designed to help programmers understand the process of checking for prime numbers.
 * The program uses a loop to test divisibility of the number by all integers up to its square root.
 * If the number is divisible by any of these integers, it is not a prime number.
 * Otherwise, it is a prime number.
 */

.global _start

.section .data
number: .word 29  // The number to be checked
result: .word 0   // Result of the prime check (1 for prime, 0 for not prime)

.section .text
_start:
    LDR R0, =number  // Load the address of the number
    LDR R1, [R0]     // Load the number into R1
    MOV R2, #2       // Initialize divisor to 2
    MOV R3, #1       // Assume number is prime (1 for prime, 0 for not prime)
    MOV R4, #0       // Initialize counter for loop

check_prime:
    CMP R1, #2       // Compare the number with 2
    BEQ is_prime     // If number is 2, it is prime
    BLT not_prime    // If number is less than 2, it is not prime

loop:
    MUL R5, R2, R2   // Calculate square of the divisor
    CMP R5, R1       // Compare square of divisor with the number
    BGT end_loop     // If square of divisor is greater than number, end loop

    MOV R6, R1       // Copy the number to R6
    SDIV R7, R6, R2  // Divide the number by the divisor
    MUL R8, R7, R2   // Multiply the quotient by the divisor
    CMP R8, R1       // Compare the result with the number
    BEQ not_prime    // If equal, number is not prime

    ADD R2, R2, #1   // Increment the divisor
    B loop           // Repeat the loop

end_loop:
    STR R3, [R0, #4] // Store the result (1 for prime) in memory
    B end            // End the program

is_prime:
    MOV R3, #1       // Set result to 1 (prime)
    B end_loop       // Jump to end_loop

not_prime:
    MOV R3, #0       // Set result to 0 (not prime)
    B end_loop       // Jump to end_loop

end:
    MOV R7, #1       // Exit syscall number
    SWI 0            // Make syscall to exit

/* 
 */