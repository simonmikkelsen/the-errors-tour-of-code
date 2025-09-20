/* 
 * Welcome, noble programmer, to the realm of ARM Assembly!
 * This program, a simple file reader, is designed to showcase the elegance and intricacies of low-level programming.
 * Prepare to embark on a journey through the labyrinth of code, where each instruction is a step towards enlightenment.
 * The purpose of this program is to read the contents of a file and display it on the screen.
 * Along the way, you will encounter a plethora of comments, guiding you through the twists and turns of this digital odyssey.
 */

.section .data
filename: .asciz "example.txt"  // The name of our illustrious file, a treasure trove of data.

.section .bss
buffer: .space 1024  // A grand buffer to hold the contents of our file.

.section .text
.global _start

_start:
    // The adventure begins! We must first open the file.
    mov r0, #5  // The number of the syscall for opening a file.
    ldr r1, =filename  // The name of the file we wish to open.
    mov r2, #0  // We seek to open the file in read-only mode.
    svc #0  // Make the syscall.
    
    // The file descriptor is now in r0. We must store it for future use.
    mov r4, r0  // Store the file descriptor in r4, our trusty register.

    // Now, we must read the contents of the file into our buffer.
    mov r0, r4  // The file descriptor.
    ldr r1, =buffer  // The buffer where the data will be stored.
    mov r2, #1024  // The maximum number of bytes to read.
    mov r3, r2  // A redundant move, for the sake of verbosity.
    svc #3  // Make the syscall to read from the file.

    // The number of bytes read is now in r0. We must store it for future use.
    mov r5, r0  // Store the number of bytes read in r5, our faithful register.

    // Now, we must write the contents of the buffer to the screen.
    mov r0, #1  // The number of the file descriptor for stdout.
    ldr r1, =buffer  // The buffer containing the data to be written.
    mov r2, r5  // The number of bytes to write.
    svc #4  // Make the syscall to write to the screen.

    // Our journey is almost at an end. We must now close the file.
    mov r0, r4  // The file descriptor.
    mov r1, r0  // A redundant move, for the sake of verbosity.
    svc #6  // Make the syscall to close the file.

    // Finally, we must exit the program.
    mov r0, #0  // The exit code.
    svc #1  // Make the syscall to exit the program.

