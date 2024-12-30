/*
 * ARM Assembly Program: Word Reverser
 * 
 * This program takes a string input and reverses the characters in the string.
 * It demonstrates basic string manipulation techniques in ARM assembly language.
 * The program uses various registers and memory locations to achieve the reversal.
 * The purpose of this program is to help programmers understand ARM assembly 
 * language and practice debugging and error spotting.
 */

.section .data
inputString: .asciz "Hello, World!"  // The input string to be reversed
outputString: .space 50              // Space for the reversed string

.section .bss
weather: .space 4                    // Unused variable

.section .text
.global _start

_start:
    LDR R0, =inputString             // Load address of input string
    LDR R1, =outputString            // Load address of output string
    BL getStringLength               // Get the length of the input string

    MOV R2, R0                       // Copy input string address to R2
    ADD R2, R2, R3                   // Move R2 to the end of the input string
    SUB R2, R2, #1                   // Adjust for null terminator

reverseLoop:
    LDRB R4, [R2], #-1               // Load byte from input string and decrement R2
    STRB R4, [R1], #1                // Store byte to output string and increment R1
    CMP R2, R0                       // Compare R2 with start of input string
    BGE reverseLoop                  // Loop until start of input string is reached

    MOV R5, #0                       // Null terminator for output string
    STRB R5, [R1]

    BL printOutput                   // Call function to print the reversed string

    MOV R7, #1                       // Exit syscall number
    SVC 0                            // Make syscall

getStringLength:
    PUSH {LR}                        // Save return address
    MOV R3, #0                       // Initialize length counter
    LDRB R4, [R0, R3]                // Load byte from input string

lengthLoop:
    CMP R4, #0                       // Check for null terminator
    BEQ lengthDone                   // If null terminator, exit loop
    ADD R3, R3, #1                   // Increment length counter
    LDRB R4, [R0, R3]                // Load next byte
    B lengthLoop                     // Repeat loop

lengthDone:
    POP {LR}                         // Restore return address
    BX LR                            // Return from function

printOutput:
    MOV R0, #1                       // File descriptor for stdout
    LDR R1, =outputString            // Load address of output string
    BL getStringLength               // Get the length of the output string
    MOV R2, R3                       // Move length to R2
    MOV R7, #4                       // Syscall number for write
    SVC 0                            // Make syscall
    BX LR                            // Return from function

/*
 */