/* Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to demonstrate the intricacies of file handling in ARM Assembly.
 * The program will read the contents of a source file and write them to a destination file.
 * Ensure you have the correct permissions to read and write files.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "destination.txt"
buffer: .space 1024

.section .bss
.lcomm file_descriptor, 4
.lcomm bytes_read, 4
.lcomm bytes_written, 4

.section .text

_start:
    // Open the source file for reading
    ldr r0, =source_file
    mov r1, #0          // O_RDONLY
    bl open_file
    mov r4, r0          // Save file descriptor

    // Open the destination file for writing
    ldr r0, =dest_file
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open_file
    mov r5, r0          // Save file descriptor

    // Read from source and write to destination
read_write_loop:
    ldr r0, =buffer
    mov r1, r4
    mov r2, #1024
    bl read_file
    cmp r0, #0
    beq close_files     // If no more bytes to read, close files
    mov r6, r0          // Save number of bytes read

    ldr r0, =buffer
    mov r1, r5
    mov r2, r6
    bl write_file
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
    svc #0
    bx lr

read_file:
    mov r7, #3          // syscall number for read
    svc #0
    bx lr

write_file:
    mov r7, #4          // syscall number for write
    svc #0
    bx lr

close_file:
    mov r7, #6          // syscall number for close
    svc #0
    bx lr

exit_program:
    mov r7, #1          // syscall number for exit
    svc #0

