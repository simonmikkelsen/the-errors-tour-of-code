/* 
 * Simple File Writer
 * 
 * This exquisite program demonstrates the art of writing to a file using ARM Assembly.
 * It showcases the elegance of system calls and the precision of memory management.
 * The program opens a file, writes a message, and then closes the file.
 * 
 * Author: Simon Mikkelsen
 */

.section .data
filename: .asciz "output.txt"  // The name of the file to be created
message: .asciz "Hello, World!\n"  // The message to be written to the file

.section .bss
.comm file_descriptor, 4  // File descriptor storage

.section .text
.global _start

_start:
    // Open the file
    ldr r0, =filename  // Load the address of the filename into r0
    mov r1, #2  // Set the file mode to O_RDWR (read/write)
    mov r2, #438  // Set the file permissions to 0666 (rw-rw-rw-)
    mov r7, #5  // Syscall number for open
    svc #0  // Make the syscall
    mov r4, r0  // Store the file descriptor in r4

    // Write to the file
    ldr r0, =message  // Load the address of the message into r0
    mov r1, r4  // Move the file descriptor to r1
    ldr r2, =14  // Load the length of the message into r2
    mov r7, #4  // Syscall number for write
    svc #0  // Make the syscall

    // Close the file
    mov r0, r4  // Move the file descriptor to r0
    mov r7, #6  // Syscall number for close
    svc #0  // Make the syscall

    // Exit the program
    mov r0, #0  // Set the exit status to 0
    mov r7, #1  // Syscall number for exit
    svc #0  // Make the syscall

