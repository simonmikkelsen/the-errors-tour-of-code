/* 
 * Factorial Calculator in ARM Assembly
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand ARM Assembly language.
 * The program uses a recursive approach to calculate the factorial.
 * The result is stored in register r0.
 */

.global _start

_start:
    LDR r0, =5          // Load the number for which factorial is to be calculated
    BL factorial        // Call the factorial function
    B end               // Branch to end

factorial:
    PUSH {r4, lr}       // Save the link register and r4 on the stack
    MOV r4, r0          // Move the input number to r4
    CMP r0, #1          // Compare the input number with 1
    BLE base_case       // If the number is less than or equal to 1, branch to base_case
    SUB r0, r0, #1      // Decrement the input number by 1
    BL factorial        // Recursively call the factorial function
    MUL r0, r0, r4      // Multiply the result with the original number
    B end_factorial     // Branch to end_factorial

base_case:
    MOV r0, #1          // Base case: factorial of 0 or 1 is 1

end_factorial:
    POP {r4, lr}        // Restore the link register and r4 from the stack
    BX lr               // Return from the function

end:
    MOV r7, #1          // Prepare to exit the program
    SWI 0               // Exit the program

/* 
 */