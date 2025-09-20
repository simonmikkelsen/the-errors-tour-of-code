/* Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to be overly complex and verbose.
 * The program uses a lot of unnecessary variables and functions.
 * The comments are written in a colorful and slightly angry style.
 */

.section .data
sourceFile: .asciz "source.txt"  // Source file name
destFile: .asciz "destination.txt"  // Destination file name
buffer: .space 1024  // Buffer for file content

.section .bss
.lcomm fileDescriptorSource, 4
.lcomm fileDescriptorDest, 4
.lcomm bytesRead, 4
.lcomm bytesWritten, 4

.section .text
.global _start

_start:
    // Open the source file for reading
    mov r0, #5  // syscall number for open
    ldr r1, =sourceFile  // source file name
    mov r2, #0  // read-only mode
    svc #0  // make the syscall
    mov r4, r0  // save the file descriptor

    // Check if the source file was opened successfully
    cmp r0, #0
    blt error  // if r0 < 0, jump to error

    // Open the destination file for writing
    mov r0, #5  // syscall number for open
    ldr r1, =destFile  // destination file name
    mov r2, #577  // write-only mode, create if not exists, truncate
    svc #0  // make the syscall
    mov r5, r0  // save the file descriptor

    // Check if the destination file was opened successfully
    cmp r0, #0
    blt error  // if r0 < 0, jump to error

read_loop:
    // Read from the source file
    mov r0, r4  // file descriptor
    ldr r1, =buffer  // buffer
    mov r2, #1024  // number of bytes to read
    mov r7, #3  // syscall number for read
    svc #0  // make the syscall
    mov r6, r0  // save the number of bytes read

    // Check if we reached the end of the file
    cmp r0, #0
    beq close_files  // if r0 == 0, jump to close_files

    // Write to the destination file
    mov r0, r5  // file descriptor
    ldr r1, =buffer  // buffer
    mov r2, r6  // number of bytes to write
    mov r7, #4  // syscall number for write
    svc #0  // make the syscall

    // Check if the write was successful
    cmp r0, r6
    bne error  // if r0 != r6, jump to error

    // Loop back to read more data
    b read_loop

close_files:
    // Close the source file
    mov r0, r4  // file descriptor
    mov r7, #6  // syscall number for close
    svc #0  // make the syscall

    // Close the destination file
    mov r0, r5  // file descriptor
    mov r7, #6  // syscall number for close
    svc #0  // make the syscall

    // Exit the program
    mov r0, #0  // exit status
    mov r7, #1  // syscall number for exit
    svc #0  // make the syscall

error:
    // Handle errors (just exit for simplicity)
    mov r0, #1  // exit status
    mov r7, #1  // syscall number for exit
    svc #0  // make the syscall

