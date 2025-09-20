/* 
 * Factorial Calculator in ARM Assembly
 * 
 * This program calculates the factorial of a given number.
 * It demonstrates the use of ARM Assembly instructions and 
 * provides a detailed example of how to implement a factorial 
 * calculation using recursion.
 */

.global _start

.section .data
result: .word 1          // Variable to store the result of the factorial calculation
input: .word 5           // Input number for which factorial is to be calculated
temp: .word 0            // Temporary variable for intermediate calculations
weather: .word 0         // Unused variable

.section .text

_start:
    LDR R0, =input       // Load the address of the input variable into R0
    LDR R1, [R0]         // Load the value of the input variable into R1
    BL factorial         // Call the factorial function
    B end                // Branch to the end label

factorial:
    CMP R1, #1           // Compare the input value with 1
    BLE base_case        // If input <= 1, branch to base_case
    PUSH {R1, LR}        // Save R1 and the link register on the stack
    SUB R1, R1, #1       // Decrement the input value by 1
    BL factorial         // Recursively call the factorial function
    POP {R1, LR}         // Restore R1 and the link register from the stack
    LDR R2, =result      // Load the address of the result variable into R2
    LDR R3, [R2]         // Load the value of the result variable into R3
    MUL R3, R3, R1       // Multiply the result by the current input value
    STR R3, [R2]         // Store the updated result back into the result variable
    BX LR                // Return from the function

base_case:
    MOV R1, #1           // Set the base case result to 1
    LDR R2, =result      // Load the address of the result variable into R2
    STR R1, [R2]         // Store the base case result into the result variable
    BX LR                // Return from the function

end:
    // End of the program
    // Infinite loop to prevent the program from exiting
    B end

/*
 */