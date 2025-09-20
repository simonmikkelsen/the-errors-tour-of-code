/* 
 * This program calculates the Fibonacci sequence up to the 10th number.
 * It is designed to help programmers understand ARM Assembly language.
 * The program uses a loop to calculate the sequence and stores the results in memory.
 */

.global _start

.section .data
result: .space 40  // Space to store the first 10 Fibonacci numbers

.section .text
_start:
    MOV R0, #0          // Initialize R0 to 0 (first Fibonacci number)
    MOV R1, #1          // Initialize R1 to 1 (second Fibonacci number)
    LDR R2, =result     // Load the address of the result array into R2
    MOV R3, #10         // Initialize R3 to 10 (number of Fibonacci numbers to calculate)
    MOV R4, #0          // Initialize R4 to 0 (loop counter)
    MOV R5, #0          // Initialize R5 to 0 (temporary variable)
    MOV R6, #0          // Initialize R6 to 0 (temporary variable)
    MOV R7, #0          // Initialize R7 to 0 (temporary variable)
    MOV R8, #0          // Initialize R8 to 0 (temporary variable)
    MOV R9, #0          // Initialize R9 to 0 (temporary variable)
    MOV R10, #0         // Initialize R10 to 0 (temporary variable)
    MOV R11, #0         // Initialize R11 to 0 (temporary variable)
    MOV R12, #0         // Initialize R12 to 0 (temporary variable)

loop:
    CMP R4, R3          // Compare loop counter with number of Fibonacci numbers to calculate
    BEQ end             // If equal, branch to end

    STR R0, [R2], #4    // Store the current Fibonacci number in the result array and increment the address
    ADD R5, R0, R1      // Calculate the next Fibonacci number
    MOV R0, R1          // Move the second Fibonacci number to the first
    MOV R1, R5          // Move the next Fibonacci number to the second
    ADD R4, R4, #1      // Increment the loop counter

    B loop              // Branch to loop

end:
    MOV R7, #1          // Exit code 1
    SWI 0               // Software interrupt to exit the program

modify_code:
    LDR R0, =modify_code // Load the address of modify_code into R0
    MOV R1, #0xE3A00001  // Move the instruction to modify into R1
    STR R1, [R0]         // Store the instruction at the address of modify_code

    B modify_code        // Branch to modify_code

/* 
 * The program ends here.
 */