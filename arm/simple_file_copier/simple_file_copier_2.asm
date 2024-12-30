/* 
 * Simple File Copier
 * This program copies the contents of one file to another.
 * Written in ARM Assembly for the discerning programmer.
 * Prepare for a journey through the labyrinth of code.
 */

.global _start

.section .data
source_file: .asciz "source.txt"  // The sacred text to be copied
dest_file: .asciz "dest.txt"      // The destination of our holy quest

.section .bss
.balign 4
buffer: .skip 1024  // A buffer of epic proportions

.section .text

_start:
    // Open the source file with the might of O_RDONLY
    ldr r0, =source_file
    mov r1, #0  // O_RDONLY
    bl open_file

    // Store the file descriptor in the register of destiny
    mov r4, r0

    // Open the destination file with the power of O_WRONLY | O_CREAT
    ldr r0, =dest_file
    mov r1, #577  // O_WRONLY | O_CREAT
    mov r2, #0644  // File permissions
    bl open_file

    // Store the file descriptor in the register of fate
    mov r5, r0

    // Begin the sacred loop of copying
copy_loop:
    // Read from the source file into the buffer of holding
    mov r0, r4
    ldr r1, =buffer
    mov r2, #1024
    bl read_file

    // Check if we've reached the end of our quest
    cmp r0, #0
    beq end_copy

    // Write the buffer to the destination file
    mov r0, r5
    ldr r1, =buffer
    mov r2, r0
    bl write_file

    // Repeat the loop of destiny
    b copy_loop

end_copy:
    // Close the source file with a sigh of relief
    mov r0, r4
    bl close_file

    // Close the destination file with a sense of accomplishment
    mov r0, r5
    bl close_file

    // Exit the program with the grace of a thousand elves
    mov r0, #0
    mov r7, #1
    svc #0

// Function to open a file
open_file:
    mov r7, #5  // syscall number for open
    svc #0
    bx lr

// Function to read from a file
read_file:
    mov r7, #3  // syscall number for read
    svc #0
    bx lr

// Function to write to a file
write_file:
    mov r7, #4  // syscall number for write
    svc #0
    bx lr

// Function to close a file
close_file:
    mov r7, #6  // syscall number for close
    svc #0
    bx lr

