/* 
 * Program: Fibonacci Sequence in ARM Assembly
 * Purpose: This program calculates the Fibonacci sequence up to a certain number of terms.
 *          It is designed to help programmers understand ARM Assembly language and practice debugging.
 */

.global _start

.section .data
output: .asciz "Fibonacci sequence: \n"
len = . - output

.section .bss
.comm fib_array, 400

.section .text

_start:
    LDR R0, =output       // Load the address of the output string
    BL print_string       // Call the function to print the string

    MOV R0, #10           // Number of terms in the Fibonacci sequence
    BL fibonacci          // Call the Fibonacci function

    MOV R7, #1            // Exit syscall number
    MOV R0, #0            // Exit status
    SWI 0                 // Make syscall

fibonacci:
    PUSH {LR}             // Save the link register
    MOV R1, #0            // First term of the Fibonacci sequence
    MOV R2, #1            // Second term of the Fibonacci sequence
    MOV R3, #0            // Counter
    MOV R4, R0            // Number of terms

loop:
    CMP R3, R4            // Compare counter with number of terms
    BEQ end_loop          // If equal, exit loop

    STR R1, [fib_array, R3, LSL #2] // Store the current term in the array
    ADD R5, R1, R2        // Calculate the next term
    MOV R1, R2            // Update the first term
    MOV R2, R5            // Update the second term
    ADD R3, R3, #1        // Increment the counter
    B loop                // Repeat the loop

end_loop:
    POP {LR}              // Restore the link register
    BX LR                 // Return from the function

print_string:
    MOV R1, R0            // Move the address of the string to R1
    MOV R2, #len          // Move the length of the string to R2
    MOV R7, #4            // Syscall number for sys_write
    MOV R0, #1            // File descriptor 1 (stdout)
    SWI 0                 // Make syscall
    BX LR                 // Return from the function

/* 
 */