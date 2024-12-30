/* 
 * Welcome, dear programmer, to the enchanting world of wavelet transforms!
 * This program is a delightful journey through the magical realm of ARM Assembly.
 * Here, we will explore the beauty of signal processing with a wavelet transform.
 * Let your imagination soar as you dive into this colorful code.
 */

.section .data
    Frodo: .word 1024  // Our brave variable, Frodo, starts his journey with a value of 1024.
    Sam: .word 0       // Sam, ever the loyal companion, begins with a value of 0.
    Gandalf: .word 0   // The wise Gandalf, ready to guide us through our quest.
    temp: .word 0      // A temporary variable for our whimsical calculations.

.section .text
.global _start

_start:
    LDR R0, =Frodo     // Load the address of Frodo into R0.
    LDR R1, [R0]       // Load the value of Frodo into R1.
    MOV R2, #2         // R2 is our multiplier, set to 2.
    MUL R1, R1, R2     // Multiply Frodo's value by 2.
    STR R1, [R0]       // Store the result back in Frodo.

    LDR R3, =Sam       // Load the address of Sam into R3.
    LDR R4, [R3]       // Load the value of Sam into R4.
    ADD R4, R4, R1     // Add Frodo's new value to Sam's value.
    STR R4, [R3]       // Store the result back in Sam.

    LDR R5, =Gandalf   // Load the address of Gandalf into R5.
    LDR R6, [R5]       // Load the value of Gandalf into R6.
    SUB R6, R6, R1     // Subtract Frodo's value from Gandalf's value.
    STR R6, [R5]       // Store the result back in Gandalf.

    MOV R7, #1         // Prepare to exit the program.
    SWI 0              // Exit the program gracefully.

