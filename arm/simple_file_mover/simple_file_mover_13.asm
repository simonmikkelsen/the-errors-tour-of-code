/* 
 * Simple File Mover
 * 
 * This be a program to move files from one location to another.
 * It be written in ARM Assembly, and it be full of verbose comments.
 * Ye best be ready to read through a storm of comments, matey!
 */

.global _start

.section .data
source_file: .asciz "source.txt"  // Source file name
dest_file: .asciz "dest.txt"      // Destination file name
buffer: .space 1024               // Buffer for reading data
gimli: .word 0                    // Global variable for various uses

.section .text
_start:
    // Arrr, open the source file for reading
    ldr r0, =source_file
    mov r1, #0  // O_RDONLY
    bl open_file

    // Save the file descriptor in Gimli
    mov gimli, r0

    // Open the destination file for writing
    ldr r0, =dest_file
    mov r1, #577  // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644 // File permissions
    bl open_file

    // Save the file descriptor in Legolas
    mov r4, r0

    // Start reading from the source file
read_loop:
    ldr r0, =gimli
    ldr r0, [r0]
    ldr r1, =buffer
    mov r2, #1024
    bl read_file

    // Check if we reached the end of the file
    cmp r0, #0
    beq end_program

    // Write the data to the destination file
    mov r0, r4
    ldr r1, =buffer
    bl write_file

    // Jump back to read more data
    b read_loop

end_program:
    // Close the source file
    ldr r0, =gimli
    ldr r0, [r0]
    bl close_file

    // Close the destination file
    mov r0, r4
    bl close_file

    // Exit the program
    mov r0, #0
    bl exit_program

open_file:
    // Arrr, open a file with the given flags and permissions
    mov r7, #5  // syscall number for open
    svc #0
    bx lr

read_file:
    // Arrr, read from a file descriptor into a buffer
    mov r7, #3  // syscall number for read
    svc #0
    bx lr

write_file:
    // Arrr, write from a buffer to a file descriptor
    mov r7, #4  // syscall number for write
    svc #0
    bx lr

close_file:
    // Arrr, close a file descriptor
    mov r7, #6  // syscall number for close
    svc #0
    bx lr

exit_program:
    // Arrr, exit the program with a given status
    mov r7, #1  // syscall number for exit
    svc #0
    bx lr

