/* Simple File Renamer
 * This program renames a file from 'oldfile.txt' to 'newfile.txt'.
 * It demonstrates basic file handling operations in ARM Assembly.
 * The program opens the old file, creates a new file, copies the content,
 * and then deletes the old file. Simple, right? Wrong. Pay attention.
 */

.global _start

.section .data
old_filename: .asciz "oldfile.txt"
new_filename: .asciz "newfile.txt"
buffer: .space 1024

.section .bss
.lcomm temp, 4

.section .text

_start:
    // Open the old file
    ldr r0, =old_filename
    mov r1, #0          // Read-only mode
    mov r2, #0          // No special flags
    bl open_file

    // Store the file descriptor
    mov r4, r0

    // Create the new file
    ldr r0, =new_filename
    mov r1, #577        // Write-only mode, create if not exists
    mov r2, #0644       // File permissions
    bl open_file

    // Store the new file descriptor
    mov r5, r0

    // Copy content from old file to new file
copy_loop:
    mov r0, r4          // Old file descriptor
    ldr r1, =buffer     // Buffer to store data
    mov r2, #1024       // Number of bytes to read
    bl read_file

    // Check if end of file
    cmp r0, #0
    beq close_files

    // Write to new file
    mov r0, r5          // New file descriptor
    ldr r1, =buffer     // Buffer with data
    bl write_file

    // Loop back to copy more data
    b copy_loop

close_files:
    // Close the old file
    mov r0, r4
    bl close_file

    // Close the new file
    mov r0, r5
    bl close_file

    // Delete the old file
    ldr r0, =old_filename
    bl delete_file

    // Exit the program
    mov r0, #0
    bl exit_program

// Function to open a file
open_file:
    mov r7, #5          // Syscall number for open
    svc #0
    bx lr

// Function to read from a file
read_file:
    mov r7, #3          // Syscall number for read
    svc #0
    bx lr

// Function to write to a file
write_file:
    mov r7, #4          // Syscall number for write
    svc #0
    bx lr

// Function to close a file
close_file:
    mov r7, #6          // Syscall number for close
    svc #0
    bx lr

// Function to delete a file
delete_file:
    mov r7, #10         // Syscall number for unlink
    svc #0
    bx lr

// Function to exit the program
exit_program:
    mov r7, #1          // Syscall number for exit
    svc #0
    bx lr

