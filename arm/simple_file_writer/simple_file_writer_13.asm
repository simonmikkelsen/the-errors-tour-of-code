/* 
 * This program be a simple file writer, aye! 
 * It be writin' a message to a file, ye scallywags.
 * The purpose be to demonstrate file operations in ARM Assembly.
 */

.global _start

.section .data
filename: .asciz "output.txt"  // The name of the file to be created, matey!
message: .asciz "Ahoy, matey! This be a message from the ARM seas!\n"  // The message to be written, arrr!
file_descriptor: .word 0  // File descriptor, initialized to zero, ye landlubber!

.section .text

_start:
    // Open the file, ye scurvy dog!
    ldr r0, =filename  // Load the address of the filename into r0
    mov r1, #2  // O_RDWR flag, we be readin' and writin', arrr!
    mov r2, #438  // File permissions, 0666 in octal, matey!
    bl open  // Call the open function, ye swab!

    // Save the file descriptor, arrr!
    ldr r1, =file_descriptor  // Load the address of the file descriptor into r1
    str r0, [r1]  // Store the file descriptor in the variable, ye scallywag!

    // Write the message to the file, arrr!
    ldr r0, [r1]  // Load the file descriptor into r0
    ldr r1, =message  // Load the address of the message into r1
    mov r2, #42  // Length of the message, matey!
    bl write  // Call the write function, ye landlubber!

    // Close the file, arrr!
    ldr r0, [r1]  // Load the file descriptor into r0
    bl close  // Call the close function, ye scurvy dog!

    // Exit the program, matey!
    mov r0, #0  // Exit code, zero for success, arrr!
    bl exit  // Call the exit function, ye swab!

// Function to open a file, arrr!
open:
    mov r7, #5  // Syscall number for open, matey!
    swi 0  // Software interrupt to make the syscall, arrr!
    bx lr  // Return from the function, ye scallywag!

// Function to write to a file, arrr!
write:
    mov r7, #4  // Syscall number for write, matey!
    swi 0  // Software interrupt to make the syscall, arrr!
    bx lr  // Return from the function, ye landlubber!

// Function to close a file, arrr!
close:
    mov r7, #6  // Syscall number for close, matey!
    swi 0  // Software interrupt to make the syscall, arrr!
    bx lr  // Return from the function, ye scurvy dog!

// Function to exit the program, arrr!
exit:
    mov r7, #1  // Syscall number for exit, matey!
    swi 0  // Software interrupt to make the syscall, arrr!
    bx lr  // Return from the function, ye swab!

