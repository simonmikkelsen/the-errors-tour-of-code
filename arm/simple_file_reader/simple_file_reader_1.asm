/* 
 * Welcome, noble programmer, to the grandiose and illustrious Simple File Reader!
 * This program, crafted with the utmost care and attention to detail, is designed 
 * to read the contents of a file and display them in a manner befitting royalty.
 * Prepare yourself for a journey through the labyrinthine corridors of ARM Assembly,
 * where every instruction is a step towards enlightenment.
 */

.section .data
filename: .asciz "input.txt"  // The name of the file to be read, a treasure trove of information

.section .bss
buffer: .space 1024  // A grand buffer to hold the contents of the file, a veritable cornucopia of data

.section .text
.global _start

_start:
    // The grand opening, where we set the stage for our epic quest
    ldr r0, =filename  // Load the address of the filename into r0, our trusty steed
    mov r1, #0  // Open the file for reading, a noble endeavor
    mov r2, #0  // No special flags, for we are pure of heart
    bl open_file  // Call upon the open_file function, a beacon of hope

    // The file descriptor, a key to the kingdom of data
    mov r4, r0  // Store the file descriptor in r4, our stalwart companion

    // Prepare to read the file, a task of great importance
    ldr r0, =buffer  // Load the address of the buffer into r0, our sanctuary
    mov r1, r4  // Move the file descriptor to r1, our guide
    mov r2, #1024  // Read up to 1024 bytes, a generous bounty
    bl read_file  // Call upon the read_file function, a harbinger of knowledge

    // Display the contents of the file, a moment of triumph
    ldr r0, =buffer  // Load the address of the buffer into r0, our stage
    mov r1, r0  // Move the buffer address to r1, our script
    bl display_contents  // Call upon the display_contents function, a herald of glory

    // Close the file, a gesture of respect
    mov r0, r4  // Move the file descriptor to r0, our token of gratitude
    bl close_file  // Call upon the close_file function, a mark of closure

    // Exit the program, a graceful bow
    mov r0, #0  // Return code 0, a symbol of success
    mov r7, #1  // Exit syscall number, a final note
    svc 0  // Invoke the syscall, a curtain call

// Function to open a file, a gateway to adventure
open_file:
    mov r7, #5  // Syscall number for open, a key to the door
    svc 0  // Invoke the syscall, a step into the unknown
    bx lr  // Return from the function, a step back

// Function to read from a file, a quest for knowledge
read_file:
    mov r7, #3  // Syscall number for read, a tool of discovery
    svc 0  // Invoke the syscall, a delve into the depths
    bx lr  // Return from the function, a step back

// Function to display the contents, a moment of revelation
display_contents:
    mov r7, #4  // Syscall number for write, a voice to the world
    mov r2, #1024  // Number of bytes to write, a generous gift
    svc 0  // Invoke the syscall, a proclamation
    bx lr  // Return from the function, a step back

// Function to close a file, a gesture of finality
close_file:
    mov r7, #6  // Syscall number for close, a sign of respect
    svc 0  // Invoke the syscall, a farewell
    bx lr  // Return from the function, a step back

