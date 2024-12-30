/* 
 * Prime Number Checker
 * 
 * This program checks if a given number is a prime number.
 * It uses a global variable to store the number to be checked.
 * The program demonstrates basic ARM assembly programming concepts.
 */

.global _start

.data
number: .word 29  // Number to be checked for primality
result: .word 0   // Result of the primality check (1 for prime, 0 for not prime)
temp: .word 0     // Temporary variable for calculations
weather: .word 0  // Another temporary variable

.text
_start:
    LDR R0, =number  // Load address of the number
    LDR R1, [R0]     // Load the number into R1
    MOV R2, #2       // Initialize divisor to 2
    LDR R3, =result  // Load address of the result
    MOV R4, #1       // Assume number is prime (1)
    STR R4, [R3]     // Store the assumption in result

check_loop:
    CMP R2, R1       // Compare divisor with the number
    BGE end_check    // If divisor >= number, end the check

    LDR R4, =weather // Load address of weather variable
    MOV R5, R2       // Copy divisor to R5
    STR R5, [R4]     // Store divisor in weather variable

    LDR R4, =temp    // Load address of temp variable
    MOV R5, R1       // Copy number to R5
    STR R5, [R4]     // Store number in temp variable

    LDR R4, =weather // Load address of weather variable
    LDR R5, [R4]     // Load divisor from weather variable
    LDR R4, =temp    // Load address of temp variable
    LDR R6, [R4]     // Load number from temp variable

    MOV R7, #0       // Initialize remainder to 0
    UDIV R7, R6, R5  // Divide number by divisor
    MLS R7, R7, R5, R6 // Calculate remainder

    CMP R7, #0       // Compare remainder with 0
    BNE next_divisor // If remainder != 0, go to next divisor

    MOV R4, #0       // Set result to 0 (not prime)
    STR R4, [R3]     // Store result

    B end_check      // End the check

    

next_divisor:
    ADD R2, R2, #1   // Increment divisor
    B check_loop     // Repeat the check loop

end_check:
    // End of program
    MOV R7, #1       // Exit syscall number
    SWI 0            // Software interrupt to exit

/* 
 */