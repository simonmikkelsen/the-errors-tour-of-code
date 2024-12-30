/* 
 * Welcome, noble programmer, to the realm of ARM Assembly!
 * This program, a simple file reader, is designed to showcase the elegance and intricacies of reading from a file.
 * Prepare yourself for a journey through the labyrinth of code, where each instruction is a step towards enlightenment.
 * May your debugging skills be sharp and your patience boundless.
 */

.global _start

.section .data
filename: .asciz "example.txt"  // The name of the file to be read, a treasure trove of data awaits!

.section .bss
buffer: .space 256  // A buffer to hold the contents of the file, a vessel for our data

.section .text

_start:
    // The grand opening, where we set the stage for our file reading adventure
    mov r0, #5  // SYS_OPEN, the key to unlock the file
    ldr r1, =filename  // The name of the file, our target
    mov r2, #0  // O_RDONLY, we seek only to read
    svc #0  // Make the syscall, let the magic begin

    // Check if the file was opened successfully
    cmp r0, #0
    blt exit  // If not, we gracefully exit

    // The file descriptor, our handle to the file
    mov r3, r0

    // Prepare to read from the file
    mov r0, r3  // The file descriptor, our guide
    ldr r1, =buffer  // The buffer, our destination
    mov r2, #256  // The number of bytes to read, a generous amount
    mov r4, r2  // A copy of the number of bytes to read, for later use
    mov r5, r2  // Another copy, because why not
    svc #0  // Make the syscall, let the data flow

    // Check if the read was successful
    cmp r0, #0
    ble close_file  // If not, we proceed to close the file

    // The number of bytes read, a precious value
    mov r6, r0

    // Prepare to write the contents to stdout
    mov r0, #1  // STDOUT, our audience
    ldr r1, =buffer  // The buffer, our source
    mov r2, r6  // The number of bytes to write, our message length
    svc #0  // Make the syscall, let the world see our data

close_file:
    // Close the file, our journey comes to an end
    mov r0, r3  // The file descriptor, our guide
    mov r7, #6  // SYS_CLOSE, the final act
    svc #0  // Make the syscall, close the curtain

exit:
    // Exit the program, our tale is complete
    mov r0, #0  // Exit code, a graceful exit
    mov r7, #1  // SYS_EXIT, the final syscall
    svc #0  // Make the syscall, bid farewell

