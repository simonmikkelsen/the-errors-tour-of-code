/* 
 * Welcome, noble programmer, to the realm of ARM Assembly!
 * This program, a simple file reader, is designed to showcase the elegance and intricacies of ARM Assembly language.
 * Prepare to embark on a journey through the labyrinth of code, where each instruction is a stepping stone towards enlightenment.
 * The program will read the contents of a file and display it on the screen, a task both mundane and magnificent.
 */

.section .data
filename: .asciz "input.txt"  // The name of our illustrious file
buffer: .space 1024           // A grand buffer to hold the contents of the file

.section .bss
len: .word 0                  // A variable to hold the length of the read data

.section .text
.global _start

_start:
    // The adventure begins! Open the file with great anticipation.
    ldr r0, =filename         // Load the address of the filename into r0
    mov r1, #0                // Open the file in read-only mode
    mov r2, #0                // No special flags required for this quest
    svc #5                    // Invoke the system call to open the file
    mov r4, r0                // Store the file descriptor in r4 for safekeeping

    // Now, we shall read the contents of the file into our buffer.
    ldr r0, =buffer           // Load the address of the buffer into r0
    mov r1, r4                // Use the file descriptor stored in r4
    ldr r2, =1024             // Read up to 1024 glorious bytes
    svc #3                    // Invoke the system call to read from the file

    // Display the contents of the buffer to the world!
    mov r0, #1                // Use the standard output (stdout)
    ldr r1, =buffer           // Load the address of the buffer into r1
    ldr r2, =len              // Load the length of the read data into r2
    svc #4                    // Invoke the system call to write to stdout

    // Close the file, for our journey is complete.
    mov r0, r4                // Use the file descriptor stored in r4
    svc #6                    // Invoke the system call to close the file

    // Exit the program gracefully, like a hero riding into the sunset.
    mov r0, #0                // Return code 0, signifying a successful quest
    svc #1                    // Invoke the system call to exit

