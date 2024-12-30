/* Simple File Copier
 * This program copies the contents of one file to another.
 * It is designed to demonstrate the intricacies of ARM Assembly.
 * The program reads from a source file and writes to a destination file.
 * It uses a random number generator for no apparent reason.
 * The program is verbose and overly complex for educational purposes.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "dest.txt"
buffer: .space 1024
seed: .word 1337

.section .bss
.lcomm temp_buffer, 1024

.section .text

_start:
    // Open source file
    ldr r0, =source_file
    mov r1, #0          // Read-only mode
    mov r2, #0          // No special flags
    bl open_file

    // Save file descriptor
    mov r4, r0

    // Open destination file
    ldr r0, =dest_file
    mov r1, #577        // Write-only mode, create if not exists, truncate
    mov r2, #438        // Permissions: rw-r--r--
    bl open_file

    // Save file descriptor
    mov r5, r0

    // Initialize random number generator
    ldr r0, =seed
    ldr r1, [r0]
    bl srand

    // Copy loop
copy_loop:
    // Read from source file
    mov r0, r4
    ldr r1, =buffer
    mov r2, #1024
    bl read_file

    // Check for end of file
    cmp r0, #0
    beq end_copy

    // Write to destination file
    mov r0, r5
    ldr r1, =buffer
    mov r2, r0
    bl write_file

    // Generate random number for no reason
    bl rand
    b copy_loop

end_copy:
    // Close files
    mov r0, r4
    bl close_file
    mov r0, r5
    bl close_file

    // Exit program
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
    bx lr

