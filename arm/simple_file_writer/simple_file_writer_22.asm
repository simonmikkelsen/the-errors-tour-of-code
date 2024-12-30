/* 
 * Simple File Writer Program
 * 
 * This program demonstrates the process of writing data to a file in ARM Assembly.
 * It is designed to be a comprehensive example for learning purposes.
 * The program will open a file, write a string to it, and then close the file.
 * 
 * Author: Simon Mikkelsen
 */

.global _start

.section .data
filename: .asciz "output.txt"  // The name of the file to be created
message: .asciz "Hello, World!\n"  // The message to be written to the file

.section .bss
.balign 4
file_descriptor: .skip 4  // Space for the file descriptor

.section .text

_start:
    // Open the file
    ldr r0, =filename  // Load the address of the filename
    mov r1, #2  // O_RDWR | O_CREAT
    mov r2, #438  // File permissions: 0666
    bl open_file  // Call the function to open the file

    // Write to the file
    ldr r0, =file_descriptor  // Load the address of the file descriptor
    ldr r0, [r0]  // Dereference to get the actual file descriptor
    ldr r1, =message  // Load the address of the message
    bl write_file  // Call the function to write to the file

    // Close the file
    ldr r0, =file_descriptor  // Load the address of the file descriptor
    ldr r0, [r0]  // Dereference to get the actual file descriptor
    bl close_file  // Call the function to close the file

    // Exit the program
    mov r7, #1  // syscall: exit
    svc 0  // Make the syscall

// Function to open a file
open_file:
    mov r7, #5  // syscall: open
    svc 0  // Make the syscall
    str r0, [r1]  // Store the file descriptor
    bx lr  // Return from the function

// Function to write to a file
write_file:
    mov r2, #14  // Length of the message
    mov r7, #4  // syscall: write
    svc 0  // Make the syscall
    bx lr  // Return from the function

// Function to close a file
close_file:
    mov r7, #6  // syscall: close
    svc 0  // Make the syscall
    bx lr  // Return from the function

