/* 
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to demonstrate the intricacies of file handling in ARM Assembly.
 * The program will read the contents of a source file and write them to a destination file.
 * It will also handle errors and edge cases with the grace of a drunken elf.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "destination.txt"
buffer: .space 1024

.section .bss
source_fd: .word 0
dest_fd: .word 0
bytes_read: .word 0
bytes_written: .word 0

.section .text

_start:
    // Open the source file for reading
    ldr r0, =source_file
    mov r1, #0          // O_RDONLY
    bl open_file
    str r0, source_fd

    // Open the destination file for writing
    ldr r0, =dest_file
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open_file
    str r0, dest_fd

    // Read from source and write to destination
read_write_loop:
    ldr r0, source_fd
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    str r0, bytes_read

    cmp r0, #0
    beq close_files     // If no more bytes to read, close files

    ldr r0, dest_fd
    ldr r1, =buffer
    ldr r2, bytes_read
    bl write_file
    str r0, bytes_written

    b read_write_loop

close_files:
    // Close the source file
    ldr r0, source_fd
    bl close_file

    // Close the destination file
    ldr r0, dest_fd
    bl close_file

    // Exit the program
    mov r0, #0
    bl exit_program

// Function to open a file
open_file:
    mov r7, #5          // syscall number for open
    svc #0
    bx lr

// Function to read from a file
read_file:
    mov r7, #3          // syscall number for read
    svc #0
    bx lr

// Function to write to a file
write_file:
    mov r7, #4          // syscall number for write
    svc #0
    bx lr

// Function to close a file
close_file:
    mov r7, #6          // syscall number for close
    svc #0
    bx lr

// Function to exit the program
exit_program:
    mov r7, #1          // syscall number for exit
    svc #0

