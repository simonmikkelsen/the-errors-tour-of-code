/* 
 * Welcome, noble programmer, to the realm of ARM Assembly!
 * This program, a simple file reader, is designed to enchant your senses
 * and elevate your understanding of the arcane art of low-level programming.
 * Prepare yourself for a journey through the labyrinth of registers and memory,
 * where each instruction is a step towards enlightenment.
 */

.section .data
filename: .asciz "input.txt"   // The name of our mystical text file
buffer: .space 256            // A generous buffer to hold our sacred text

.section .bss
.lcomm temp_storage, 4        // Temporary storage for our fleeting thoughts

.section .text
.global _start

_start:
    // The grand opening: setting up the stage for our performance
    ldr r0, =filename         // Load the address of the filename into r0
    mov r1, #0                // Open the file in read-only mode
    mov r2, #0                // No special permissions needed
    svc #5                    // Invoke the kernel to open the file
    mov r4, r0                // Store the file descriptor in r4 for safekeeping

    // Prepare to read from the file
    ldr r1, =buffer           // Load the address of the buffer into r1
    mov r2, #256              // We shall read up to 256 bytes
    svc #3                    // Invoke the kernel to read from the file

    // Display the contents of the buffer
    mov r0, #1                // File descriptor 1 is stdout
    ldr r1, =buffer           // Load the address of the buffer into r1
    mov r2, #256              // We shall write up to 256 bytes
    svc #4                    // Invoke the kernel to write to stdout

    // The grand finale: closing the file and exiting gracefully
    mov r0, r4                // Load the file descriptor into r0
    svc #6                    // Invoke the kernel to close the file

    // Exit the program
    mov r0, #0                // Exit code 0 signifies a successful performance
    svc #1                    // Invoke the kernel to exit

