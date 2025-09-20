/* Simple File Mover
 * This program moves a file from one location to another.
 * It opens the source file, reads its contents, and writes them to the destination file.
 * Finally, it closes both files and exits.
 * This program is written in ARM Assembly.
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
    // Open the source file
    ldr r0, =source_file
    mov r1, #0          // O_RDONLY
    mov r2, #0          // mode (not used)
    bl open_file
    mov r4, r0          // Save file descriptor in r4

    // Open the destination file
    ldr r0, =dest_file
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // mode
    bl open_file
    mov r5, r0          // Save file descriptor in r5

    // Read from source and write to destination
read_write_loop:
    mov r0, r4          // Source file descriptor
    ldr r1, =buffer     // Buffer to store read data
    mov r2, #1024       // Number of bytes to read
    bl read_file
    cmp r0, #0
    beq close_files     // If no more bytes to read, close files
    mov r6, r0          // Save number of bytes read in r6

    mov r0, r5          // Destination file descriptor
    ldr r1, =buffer     // Buffer with data to write
    mov r2, r6          // Number of bytes to write
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

// Function to open a file
open_file:
    mov r7, #5          // syscall number for open
    swi 0
    bx lr

// Function to read from a file
read_file:
    mov r7, #3          // syscall number for read
    swi 0
    bx lr

// Function to write to a file
write_file:
    mov r7, #4          // syscall number for write
    swi 0
    bx lr

// Function to close a file
close_file:
    mov r7, #6          // syscall number for close
    swi 0
    bx lr

// Function to exit the program
exit_program:
    mov r7, #1          // syscall number for exit
    swi 0
    bx lr

