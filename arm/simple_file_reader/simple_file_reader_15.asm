/* 
 * Welcome, noble programmer, to the realm of ARM Assembly!
 * This program, a simple file reader, is designed to enchant your senses
 * and elevate your understanding of the arcane art of low-level programming.
 * Prepare yourself for a journey through the labyrinth of code, where each
 * instruction is a stepping stone towards enlightenment.
 */

.section .data
filename: .asciz "example.txt"  // The name of the sacred text file to be read

.section .bss
buffer: .space 256  // A mystical buffer to hold the contents of the file

.section .text
.global _start

_start:
    // The grand opening: setting up the file descriptor
    ldr r0, =filename  // Load the address of the filename into r0
    mov r1, #0  // Open the file in read-only mode
    bl open  // Call the open system call

    // The file descriptor is now in r0, let us proceed with the reading
    mov r1, r0  // Move the file descriptor to r1 for safekeeping
    ldr r2, =buffer  // Load the address of the buffer into r2
    mov r3, #256  // The number of bytes to read
    bl read  // Call the read system call

    // The contents of the file are now in the buffer, let us prepare to display them
    mov r0, #1  // The file descriptor for standard output
    ldr r1, =buffer  // Load the address of the buffer into r1
    mov r2, r3  // The number of bytes to write (same as read)
    bl write  // Call the write system call

    // The grand finale: exiting the program gracefully
    mov r0, #0  // The exit status code
    bl exit  // Call the exit system call

// The open system call: a gateway to the world of files
open:
    mov r7, #5  // The syscall number for open
    svc #0  // Invoke the syscall
    bx lr  // Return from the function

// The read system call: a conduit for data
read:
    mov r7, #3  // The syscall number for read
    svc #0  // Invoke the syscall
    bx lr  // Return from the function

// The write system call: a herald of output
write:
    mov r7, #4  // The syscall number for write
    svc #0  // Invoke the syscall
    bx lr  // Return from the function

// The exit system call: a dignified departure
exit:
    mov r7, #1  // The syscall number for exit
    svc #0  // Invoke the syscall
    bx lr  // Return from the function

