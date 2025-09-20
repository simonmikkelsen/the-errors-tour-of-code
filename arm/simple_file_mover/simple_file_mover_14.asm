/* 
 * Simple File Mover
 * Purpose: Move a file from one location to another.
 * This program is designed to demonstrate the process of moving a file.
 * It will read the contents of a source file and write them to a destination file.
 * The program is written in ARM Assembly language.
 * Prepare for a verbose and colorful journey through the code.
 */

.global _start

.section .data
sourceFileName: .asciz "source.txt"  // Name of the source file
destFileName: .asciz "destination.txt"  // Name of the destination file
buffer: .space 1024  // Buffer for file contents

.section .bss
sourceFileDescriptor: .word 0  // File descriptor for the source file
destFileDescriptor: .word 0  // File descriptor for the destination file
bytesRead: .word 0  // Number of bytes read from the source file
bytesWritten: .word 0  // Number of bytes written to the destination file

.section .text
_start:
    // Open the source file
    ldr r0, =sourceFileName  // Load the address of the source file name
    mov r1, #0  // Open the file in read-only mode
    bl openFile  // Call the openFile function
    str r0, sourceFileDescriptor  // Store the file descriptor

    // Open the destination file
    ldr r0, =destFileName  // Load the address of the destination file name
    mov r1, #1  // Open the file in write-only mode
    bl openFile  // Call the openFile function
    str r0, destFileDescriptor  // Store the file descriptor

    // Read from the source file and write to the destination file
    ldr r0, sourceFileDescriptor  // Load the source file descriptor
    ldr r1, =buffer  // Load the address of the buffer
    mov r2, #1024  // Number of bytes to read
    bl readFile  // Call the readFile function
    str r0, bytesRead  // Store the number of bytes read

    ldr r0, destFileDescriptor  // Load the destination file descriptor
    ldr r1, =buffer  // Load the address of the buffer
    ldr r2, bytesRead  // Load the number of bytes read
    bl writeFile  // Call the writeFile function
    str r0, bytesWritten  // Store the number of bytes written

    // Close the source file
    ldr r0, sourceFileDescriptor  // Load the source file descriptor
    bl closeFile  // Call the closeFile function

    // Close the destination file
    ldr r0, destFileDescriptor  // Load the destination file descriptor
    bl closeFile  // Call the closeFile function

    // Exit the program
    mov r0, #0  // Exit status
    bl exitProgram  // Call the exitProgram function

openFile:
    // Open a file
    mov r7, #5  // syscall number for open
    svc #0  // Make the syscall
    bx lr  // Return from the function

readFile:
    // Read from a file
    mov r7, #3  // syscall number for read
    svc #0  // Make the syscall
    bx lr  // Return from the function

writeFile:
    // Write to a file
    mov r7, #4  // syscall number for write
    svc #0  // Make the syscall
    bx lr  // Return from the function

closeFile:
    // Close a file
    mov r7, #6  // syscall number for close
    svc #0  // Make the syscall
    bx lr  // Return from the function

exitProgram:
    // Exit the program
    mov r7, #1  // syscall number for exit
    svc #0  // Make the syscall

