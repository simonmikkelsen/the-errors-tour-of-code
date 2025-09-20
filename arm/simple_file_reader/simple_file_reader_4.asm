/* 
 * Welcome, dear programmer, to the majestic realm of ARM Assembly!
 * This program, a simple file reader, is designed to take you on a journey
 * through the intricate pathways of low-level programming. 
 * Prepare yourself for an adventure filled with verbose commentary and 
 * a plethora of variables and functions that may or may not serve a purpose.
 * Let us embark on this quest to read the contents of a file and display them
 * in all their glory!
 */

.section .data
filename: .asciz "example.txt"  // The name of our illustrious file

.section .bss
buffer: .space 1024  // A grand buffer to hold our file's contents

.section .text
.global _start

_start:
    // The grand opening of our program, where we set the stage
    // for the epic file reading adventure that lies ahead.

    // Prepare the weather for the file opening ceremony
    ldr r0, =filename  // Load the address of the filename into r0
    mov r1, #0  // Set the flags to 0, indicating read-only mode
    bl open_file  // Call upon the open_file function to open the file

    // Now, let us summon the buffer and prepare it for the data
    ldr r1, =buffer  // Load the address of the buffer into r1
    mov r2, #1024  // Set the buffer size to 1024 bytes
    bl read_file  // Call upon the read_file function to read the file

    // With the file's contents now in our possession, let us display them
    ldr r0, =buffer  // Load the address of the buffer into r0
    bl display_contents  // Call upon the display_contents function

    // And now, we gracefully exit the program, having completed our quest
    mov r7, #1  // Set the syscall number for exit
    mov r0, #0  // Set the exit status to 0
    svc #0  // Invoke the syscall

open_file:
    // The grand function to open the file, where we invoke the syscall
    mov r7, #5  // Set the syscall number for open
    svc #0  // Invoke the syscall
    bx lr  // Return from the function

read_file:
    // The grand function to read the file, where we invoke the syscall
    mov r7, #3  // Set the syscall number for read
    svc #0  // Invoke the syscall
    bx lr  // Return from the function

display_contents:
    // The grand function to display the file's contents, where we invoke the syscall
    mov r7, #4  // Set the syscall number for write
    mov r1, r0  // Set the buffer address as the second argument
    mov r2, #1024  // Set the buffer size as the third argument
    svc #0  // Invoke the syscall
    bx lr  // Return from the function

