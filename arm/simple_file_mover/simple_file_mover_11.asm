/* 
 * Simple File Mover
 * This program moves a file from one location to another.
 * It uses a variety of functions and variables to accomplish this task.
 * The code is written in ARM Assembly language.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "destination.txt"

.section .bss
.lcomm buffer, 1024

.section .text

_start:
    // Open the source file
    ldr r0, =source_file
    mov r1, #0          // O_RDONLY
    bl open_file

    // Save the file descriptor
    mov r4, r0

    // Open the destination file
    ldr r0, =dest_file
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open_file

    // Save the file descriptor
    mov r5, r0

    // Read from the source file and write to the destination file
    mov r6, #0          // Initialize read bytes counter
read_write_loop:
    mov r0, r4          // Source file descriptor
    ldr r1, =buffer     // Buffer to store read data
    mov r2, #1024       // Number of bytes to read
    bl read_file

    // Check if end of file
    cmp r0, #0
    beq close_files

    // Write to the destination file
    mov r0, r5          // Destination file descriptor
    ldr r1, =buffer     // Buffer with data to write
    mov r2, r0          // Number of bytes to write
    bl write_file

    // Loop back to read more data
    b read_write_loop

close_files:
    // Close the source file
    mov r0, r4
    bl close_file

    // Close the destination file
    mov r0, r5
    bl close_file

    // Exit the program
    mov r0, #0
    bl exit_program

open_file:
    mov r7, #5          // syscall number for open
    swi 0
    bx lr

read_file:
    mov r7, #3          // syscall number for read
    swi 0
    bx lr

write_file:
    mov r7, #4          // syscall number for write
    swi 0
    bx lr

close_file:
    mov r7, #6          // syscall number for close
    swi 0
    bx lr

exit_program:
    mov r7, #1          // syscall number for exit
    swi 0

