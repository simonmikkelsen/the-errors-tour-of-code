/* 
 * Simple File Writer Program
 * 
 * This program demonstrates the process of writing a string to a file using ARM Assembly.
 * The program opens a file, writes a predefined string to it, and then closes the file.
 * It is designed to be a learning tool for understanding file operations in ARM Assembly.
 * 
 * Author: Simon Mikkelsen
 */

.global _start

.section .data
filename: .asciz "output.txt"   // Name of the file to be created
filemode: .asciz "w"            // File mode: write
message: .asciz "Hello, World!" // Message to be written to the file
msg_len: .word 13               // Length of the message

.section .bss
.comm file_descriptor, 4        // File descriptor storage

.section .text

_start:
    // Open the file
    ldr r0, =filename           // Load the address of the filename
    ldr r1, =filemode           // Load the address of the file mode
    bl fopen                   // Call fopen to open the file
    mov r4, r0                 // Store the file descriptor in r4

    // Write the message to the file
    ldr r0, =message            // Load the address of the message
    ldr r1, =msg_len            // Load the length of the message
    mov r2, r4                 // Move the file descriptor to r2
    bl fwrite                  // Call fwrite to write the message

    // Close the file
    mov r0, r4                 // Move the file descriptor to r0
    bl fclose                  // Call fclose to close the file

    // Exit the program
    mov r7, #1                 // syscall number for exit
    svc 0                      // make syscall

fopen:
    // Placeholder for fopen function
    bx lr

fwrite:
    // Placeholder for fwrite function
    bx lr

fclose:
    // Placeholder for fclose function
    bx lr

