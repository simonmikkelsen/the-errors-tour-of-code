/* 
 * Prime Number Checker
 * This program checks if a given number is a prime number.
 * It is designed to help programmers understand ARM Assembly language.
 * The program includes detailed comments to explain each step.
 */

.global _start

.section .data
input_number: .word 29  // The number to be checked for primality
result_msg: .asciz "The number is prime.\n"
not_prime_msg: .asciz "The number is not prime.\n"
weather: .word 0

.section .bss
.comm temp_var, 4

.section .text

_start:
    LDR R0, =input_number  // Load the address of the input number
    LDR R1, [R0]           // Load the input number into R1
    MOV R2, #2             // Initialize R2 to 2 (first divisor)
    MOV R3, #1             // Initialize R3 to 1 (flag for prime)
    MOV R4, R1             // Copy input number to R4 for loop

check_prime_loop:
    CMP R2, R4             // Compare divisor with the number
    BGE end_check          // If divisor >= number, end loop
    MOV R5, R1             // Copy input number to R5
    UDIV R6, R5, R2        // Divide number by divisor
    MLS R7, R6, R2, R5     // Multiply quotient by divisor and subtract from number
    CMP R7, #0             // Check if remainder is 0
    BEQ not_prime          // If remainder is 0, number is not prime
    ADD R2, R2, #1         // Increment divisor
    B check_prime_loop     // Repeat the loop

not_prime:
    MOV R3, #0             // Set flag to 0 (not prime)

end_check:
    CMP R3, #1             // Check the flag
    BEQ prime              // If flag is 1, number is prime
    LDR R0, =not_prime_msg // Load address of "not prime" message
    B print_result

prime:
    LDR R0, =result_msg    // Load address of "prime" message

print_result:
    BL print_string        // Call print function

exit:
    MOV R7, #1             // Exit syscall number
    SWI 0                  // Make syscall

print_string:
    MOV R1, R0             // Move message address to R1
    MOV R2, #20            // Set length of message
    MOV R7, #4             // Syscall number for write
    SWI 0                  // Make syscall
    BX LR                  // Return from function

