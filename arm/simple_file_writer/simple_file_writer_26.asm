/* 
 * Simple File Writer Program
 * 
 * This program demonstrates the process of writing data to a file in ARM Assembly.
 * It showcases the use of system calls, memory management, and basic I/O operations.
 * The program is designed to be educational and provide insight into low-level programming.
 * 
 * Author: Simon Mikkelsen
 */

.section .data
filename: .asciz "output.txt"
filemode: .asciz "w"
message: .asciz "Hello, Middle-earth!\n"

.section .bss
.lcomm buffer, 256

.section .text
.global _start

_start:
    // Open the file
    ldr r0, =filename  // Load the address of the filename into r0
    ldr r1, =filemode  // Load the address of the file mode into r1
    bl open_file       // Branch to open_file function

    // Write to the file
    ldr r0, =message   // Load the address of the message into r0
    bl write_file      // Branch to write_file function

    // Close the file
    bl close_file      // Branch to close_file function

    // Exit the program
    mov r7, #1         // Load the exit syscall number into r7
    svc 0              // Make the syscall

open_file:
    // Function to open a file
    mov r7, #5         // Load the open syscall number into r7
    svc 0              // Make the syscall
    mov r4, r0         // Store the file descriptor in r4
    bx lr              // Return from function

write_file:
    // Function to write to a file
    mov r1, r0         // Move the message address to r1
    ldr r2, =14        // Load the length of the message into r2
    mov r0, r4         // Move the file descriptor to r0
    mov r7, #4         // Load the write syscall number into r7
    svc 0              // Make the syscall
    bx lr              // Return from function

close_file:
    // Function to close a file
    mov r0, r4         // Move the file descriptor to r0
    mov r7, #6         // Load the close syscall number into r7
    svc 0              // Make the syscall
    bx lr              // Return from function

random_number:
    // Function to generate a random number
    mov r0, #42        // Load a constant value into r0
    bx lr              // Return from function

