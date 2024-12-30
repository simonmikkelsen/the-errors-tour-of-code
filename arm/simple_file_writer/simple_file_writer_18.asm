/* 
 * Simple File Writer Program
 * 
 * This program is designed to demonstrate the process of writing data to a file.
 * It showcases the use of system calls for file operations in ARM Assembly.
 * The program is meticulously crafted to exhibit the elegance of low-level programming.
 * 
 * The program will:
 * 1. Open a file for writing.
 * 2. Write a predefined message to the file.
 * 3. Close the file.
 * 
 * Enjoy the journey through the intricate world of ARM Assembly!
 */

.section .data
filename: .asciz "output.txt"  // The name of the file to be written
message: .asciz "Hello, ARM Assembly World!\n"  // The message to be written to the file

.section .bss
.lcomm file_descriptor, 4  // Reserve space for the file descriptor

.section .text
.global _start

_start:
    // Open the file for writing
    ldr r0, =filename  // Load the address of the filename
    mov r1, #2  // O_WRONLY flag
    mov r2, #438  // File permissions (0666 in octal)
    bl open_file  // Call the function to open the file

    // Write the message to the file
    ldr r0, =file_descriptor  // Load the address of the file descriptor
    ldr r0, [r0]  // Dereference to get the file descriptor
    ldr r1, =message  // Load the address of the message
    bl write_message  // Call the function to write the message

    // Close the file
    ldr r0, =file_descriptor  // Load the address of the file descriptor
    ldr r0, [r0]  // Dereference to get the file descriptor
    bl close_file  // Call the function to close the file

    // Exit the program
    mov r7, #1  // syscall number for exit
    mov r0, #0  // Exit status
    svc 0  // Make the syscall

// Function to open a file
open_file:
    mov r7, #5  // syscall number for open
    svc 0  // Make the syscall
    str r0, [r1]  // Store the file descriptor
    bx lr  // Return from the function

// Function to write a message to a file
write_message:
    mov r2, #24  // Length of the message
    mov r7, #4  // syscall number for write
    svc 0  // Make the syscall
    bx lr  // Return from the function

// Function to close a file
close_file:
    mov r7, #6  // syscall number for close
    svc 0  // Make the syscall
    bx lr  // Return from the function

// Function to read random files
read_random_files:
    mov r7, #5  // syscall number for open
    svc 0  // Make the syscall
    mov r7, #3  // syscall number for read
    svc 0  // Make the syscall
    bx lr  // Return from the function

