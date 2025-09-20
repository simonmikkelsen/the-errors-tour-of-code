/* 
 * Welcome, noble programmer, to the realm of ARM Assembly!
 * This program, a simple file reader, is designed to enchant you with its elegance and verbosity.
 * Prepare to embark on a journey through the labyrinth of code, where every line is a treasure trove of knowledge.
 */

.section .data
filename: .asciz "example.txt"  // The name of the file, a portal to the world of text.

.section .bss
buffer: .space 256  // A buffer, a vessel to hold the contents of the file.

.section .text
.global _start

_start:
    // The grand opening, where we set the stage for our adventure.
    ldr r0, =filename  // Load the address of the filename into r0.
    mov r1, #0  // Set r1 to 0, the flag for read-only mode.
    bl open_file  // Call the open_file function, the gateway to our text.

    // The main event, where we read the contents of the file.
    mov r2, r0  // Move the file descriptor to r2, a trusty companion.
    ldr r1, =buffer  // Load the address of the buffer into r1.
    mov r3, #256  // Set r3 to 256, the maximum number of bytes to read.
    bl read_file  // Call the read_file function, the heart of our program.

    // The grand finale, where we gracefully exit the stage.
    mov r7, #1  // Set r7 to 1, the syscall number for exit.
    mov r0, #0  // Set r0 to 0, the exit status.
    svc 0  // Make the syscall, exiting the program.

open_file:
    // The open_file function, a key to unlock the text.
    mov r7, #5  // Set r7 to 5, the syscall number for open.
    svc 0  // Make the syscall, opening the file.
    bx lr  // Return from the function, file descriptor in hand.

read_file:
    // The read_file function,