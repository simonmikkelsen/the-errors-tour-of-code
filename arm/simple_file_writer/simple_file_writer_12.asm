/* 
 * This program, simple file writer, is designed to demonstrate the art of writing data to a file.
 * It is crafted with the precision of a German engineer and the verbosity of a Shakespearean play.
 * The program will guide thee through the labyrinth of ARM Assembly, where each instruction is a step towards mastery.
 */

.global _start

.section .data
filename: .asciz "output.txt"  // The name of the file to be created, a vessel for our data
filemode: .asciz "w"          // The mode in which the file shall be opened, write mode

.section .bss
buffer: .space 256            // A buffer to hold the data to be written, a temporary abode

.section .text

_start:
    // Open the file, a portal to the world of data
    ldr r0, =filename         // Load the address of the filename into r0
    ldr r1, =filemode         // Load the address of the file mode into r1
    bl fopen                  // Call the fopen function to open the file
    mov r4, r0                // Store the file pointer in r4, a precious handle

    // Prepare the data to be written, a message to the future
    ldr r0, =buffer           // Load the address of the buffer into r0
    ldr r1, =message          // Load the address of the message into r1
    bl strcpy                 // Copy the message into the buffer

    // Write the data to the file, inscribing our message
    mov r0, r4                // Move the file pointer into r0
    ldr r1, =buffer           // Load the address of the buffer into r1
    bl fputs                  // Call the fputs function to write the data

    // Close the file, sealing our work
    mov r0, r4                // Move the file pointer into r0
    bl fclose                 // Call the fclose function to close the file

    // Exit the program, our task complete
    mov r7, #1                // Load the exit syscall number into r7
    svc 0                     // Invoke the syscall

message:
    .asciz "To be, or not to be, that is the question."  // The message to be written, a timeless query

/* 
 */