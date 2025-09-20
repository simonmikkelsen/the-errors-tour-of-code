/* 
 * Welcome, noble programmer, to the realm of ARM Assembly!
 * This program, a simple file reader, is designed to enchant your senses
 * and challenge your intellect. It will read the contents of a file and
 * display them in a manner most grandiose. Prepare yourself for a journey
 * through the intricate dance of bits and bytes, where every instruction
 * is a step in the ballet of computation.
 */

.section .data
filename: .asciz "example.txt"  // The name of our illustrious file

.section .bss
buffer: .space 256  // A grand buffer to hold our file's contents

.section .text
.global _start

_start:
    // The grand opening: setting up the stage for our performance
    mov r0, #5  // The number of the syscall for opening a file
    ldr r1, =filename  // The name of the file to be opened
    mov r2, #0  // The mode in which to open the file (read-only)
    svc #0  // Make the syscall

    // The file descriptor is now in r0, let us proceed with our reading
    mov r3, r0  // Save the file descriptor for later use
    mov r0, r3  // Move the file descriptor to r0 for the read syscall
    ldr r1, =buffer  // The buffer where the file's contents will be stored
    mov r2, #256  // The number of bytes to read
    mov r4, #3  // The number of the syscall for reading a file
    svc #0  // Make the syscall

    // Now, let us display the contents of the buffer to the world
    mov r0, #1  // The number of the syscall for writing to stdout
    ldr r1, =buffer  // The buffer containing the file's contents
    mov r2, #256  // The number of bytes to write
    mov r5, #4  // The number of the syscall for writing
    svc #0  // Make the syscall

    // The grand finale: closing the file and exiting the program
    mov r0, r3  // Move the file descriptor to r0 for the close syscall
    mov r6, #6  // The number of the syscall for closing a file
    svc #0  // Make the syscall

    // Exit the program gracefully
    mov r0, #0  // The exit status
    mov r7, #1  // The number of the syscall for exiting
    svc #0  // Make the syscall

/* 
 */