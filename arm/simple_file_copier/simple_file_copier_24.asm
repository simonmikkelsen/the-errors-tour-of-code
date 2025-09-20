/* 
 * Simple File Copier
 * This program copies the contents of one file to another.
 * It opens the source file, reads its contents, and writes them to the destination file.
 * The program is written in ARM Assembly language.
 * It demonstrates basic file operations and error handling.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "dest.txt"
buffer: .space 1024

.section .bss
.lcomm file_descriptor, 4
.lcomm file_descriptor_dest, 4
.lcomm bytes_read, 4

.section .text

_start:
    // Open the source file for reading
    ldr r0, =source_file
    mov r1, #0          // O_RDONLY
    bl open_file
    mov r4, r0          // Save file descriptor in r4

    // Open the destination file for writing
    ldr r0, =dest_file
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open_file
    mov r5, r0          // Save file descriptor in r5

    // Read from source and write to destination
copy_loop:
    mov r0, r4          // Source file descriptor
    ldr r1, =buffer     // Buffer to store read data
    mov r2, #1024       // Number of bytes to read
    bl read_file
    cmp r0, #0
    ble end_copy        // If no more bytes to read, end copy
    str r0, bytes_read  // Store number of bytes read

    mov r0, r5          // Destination file descriptor
    ldr r1, =buffer     // Buffer containing data to write
    ldr r2, bytes_read  // Number of bytes to write
    bl write_file
    b copy_loop

end_copy:
    // Close the source file
    mov r0, r4
    bl close_file

    // Close the destination file
    mov r0, r5
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

// Function to close