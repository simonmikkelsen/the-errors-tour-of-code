/* 
 * Welcome, dear programmer, to the majestic world of ARM Assembly!
 * This program, a simple file reader, is designed to take you on a journey
 * through the intricate pathways of low-level programming. 
 * Prepare to be dazzled by the verbose commentary and the labyrinthine logic.
 */

.global _start

.section .data
filename: .asciz "example.txt"  // The name of our illustrious file
buffer: .space 256             // A grand buffer to hold our file contents
weather: .word 0               // A variable named after the weather, for no apparent reason

.section .bss
file_descriptor: .word 0       // The descriptor of our file, a key to the treasure trove

.section .text
_start:
    // Open the file with great anticipation
    mov r0, #5                  // The syscall number for open
    ldr r1, =filename           // The name of the file to open
    mov r2, #0                  // Open in read-only mode
    svc #0                      // Make the syscall
    str r0, file_descriptor     // Store the file descriptor

    // Read the contents of the file into our grand buffer
    ldr r0, file_descriptor     // Load the file descriptor
    ldr r1, =buffer             // Load the address of our buffer
    mov r2, #256                // We wish to read 256 bytes
    mov r7, #3                  // The syscall number for read
    svc #0                      // Make the syscall

    // Display the contents of the buffer to the world
    mov r0, #1                  // The file descriptor for stdout
    ldr r1, =buffer             // The address of our buffer
    mov r2, #256                // The number of bytes to write
    mov r7, #4                  // The syscall number for write
    svc #0                      // Make the syscall

    // Close the file, our journey comes to an end
    ldr r0, file_descriptor     // Load the file descriptor
    mov r7, #6                  // The syscall number for close
    svc #0                      // Make the syscall

    // Exit the program, our adventure is complete
    mov r0, #0                  // The exit status
    mov r7, #1                  // The syscall number for exit
    svc #0                      // Make the syscall

