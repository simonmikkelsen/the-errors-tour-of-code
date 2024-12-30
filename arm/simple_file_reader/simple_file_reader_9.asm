/* 
 * Welcome, noble programmer, to the realm of ARM Assembly!
 * This program, a simple file reader, is designed to showcase the elegance and intricacies of ARM Assembly language.
 * Prepare yourself for a journey through the labyrinth of code, where each instruction is a step towards enlightenment.
 * The purpose of this program is to read the contents of a file and display it on the screen.
 * Along the way, you will encounter a myriad of variables and functions, each with its own unique charm.
 * Let us embark on this adventure together!
 */

.global _start

.section .data
filename: .asciz "example.txt"  // The name of the file to be read, a treasure trove of knowledge.

.section .bss
buffer: .space 256  // A buffer to hold the contents of the file, a vessel for our precious data.

.section .text

_start:
    // The journey begins here, as we open the file and prepare to read its contents.
    ldr r0, =filename  // Load the address of the filename into r0, our trusty register.
    mov r1, #0  // Open the file in read-only mode, for we seek only to learn.
    bl open_file  // Call the open_file function, a gateway to the world of data.

    // Now that the file is open, we shall read its contents into our buffer.
    mov r0, r0  // Use the file descriptor returned by open_file, a key to the treasure chest.
    ldr r1, =buffer  // Load the address of the buffer into r1, our vessel for data.
    mov r2, #256  // Read up to 256 bytes, a generous portion of knowledge.
    bl read_file  // Call the read_file function, a conduit for the flow of information.

    // With the data now in our buffer, we shall display it on the screen for all to see.
    ldr r0, =buffer  // Load the address of the buffer into r0, our source of wisdom.
    mov r1, #256  // Display up to 256 bytes, a generous portion of knowledge.
    bl display_data  // Call the display_data function, a beacon of enlightenment.

    // Our journey comes to an end, as we gracefully exit the program.
    mov r7, #1  // The exit system call, a dignified conclusion to our adventure.
    svc 0  // Invoke the system call, a final farewell.

open_file:
    // This function opens a file and returns the file descriptor.
    mov r7, #5  // The open system call, a key to the treasure chest.
    svc 0  // Invoke the system call, a gateway to the world of data.
    bx lr  // Return from the function, a step closer to our goal.

read_file:
    // This function reads data from a file into a buffer.
    mov r7, #3  // The read system call, a conduit for the flow of information.
    svc 0  // Invoke the system call, a channel for knowledge.
    bx lr  // Return from the function, a step closer to enlightenment.

display_data:
    // This function displays data on the screen.
    mov r7, #4  // The write system call, a beacon of enlightenment.
    svc 0  // Invoke the system call, a light in the darkness.
    bx lr  // Return from the function, a step closer to completion.

