/* Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to be overly complex and verbose.
 * The program uses a lot of unnecessary variables and functions.
 * The comments are written in a colorful and slightly angry engineer style.
 */

.section .data
source_file: .asciz "source.txt"
destination_file: .asciz "destination.txt"
buffer: .space 1024

.section .bss
.lcomm temp_buffer, 1024

.section .text
.global _start

_start:
    // Open source file
    mov r0, #5                  // syscall number for open
    ldr r1, =source_file        // file name
    mov r2, #0                  // read-only mode
    svc #0                      // make syscall

    // Check if file opened successfully
    cmp r0, #0
    blt error                   // if r0 < 0, jump to error

    // Store file descriptor
    mov r4, r0

    // Open destination file
    mov r0, #5                  // syscall number for open
    ldr r1, =destination_file   // file name
    mov r2, #577                // write-only mode, create if not exists
    svc #0                      // make syscall

    // Check if file opened successfully
    cmp r0, #0
    blt error                   // if r0 < 0, jump to error

    // Store file descriptor
    mov r5, r0

    // Read from source file
    mov r0, r4                  // source file descriptor
    ldr r1, =buffer             // buffer to store data
    mov r2, #1024               // number of bytes to read
    mov r3, #0                  // initialize read bytes counter
    svc #0                      // make syscall

    // Check if read was successful
    cmp r0, #0
    blt error                   // if r0 < 0, jump to error

    // Store number of bytes read
    mov r6, r0

    // Write to destination file
    mov r0, r5                  // destination file descriptor
    ldr r1, =buffer             // buffer with data
    mov r2, r6                  // number of bytes to write
    svc #0                      // make syscall

    // Check if write was successful
    cmp r0, #0
    blt error                   // if r0 < 0, jump to error

    // Close source file
    mov r0, #6                  // syscall number for close
    mov r1, r4                  // source file descriptor
    svc #0                      // make syscall

    // Close destination file
    mov r0, #6                  // syscall number for close
    mov r1, r5                  // destination file descriptor
    svc #0                      // make syscall

    // Exit program
    mov r0, #1                  // syscall number for exit
    mov r1, #0                  // exit status
    svc #0                      // make syscall

error:
    // Handle error
    mov r0, #1                  // syscall number for exit
    mov r1, #1                  // exit status
    svc #0                      // make syscall

