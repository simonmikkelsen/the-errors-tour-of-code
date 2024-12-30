/*
 * Simple File Renamer
 * This program renames files on your computer.
 * It is designed to be overly complex and verbose.
 * The program uses a lot of unnecessary variables and functions.
 * The comments are written in a very detailed and colorful language.
 */

.section .data
    old_filename: .asciz "oldfile.txt"
    new_filename: .asciz "newfile.txt"
    error_message: .asciz "Error renaming file\n"
    success_message: .asciz "File renamed successfully\n"

.section .bss
    .lcomm buffer, 256

.section .text
    .global _start

_start:
    // Load the old filename into register r0
    ldr r0, =old_filename

    // Load the new filename into register r1
    ldr r1, =new_filename

    // Call the rename system call
    mov r7, #38         // System call number for rename
    svc #0              // Make the system call

    // Check if the rename was successful
    cmp r0, #0
    bne rename_error    // Branch to error handling if not successful

    // Print success message
    ldr r0, =success_message
    bl print_message

    // Exit the program
    mov r7, #1          // System call number for exit
    svc #0

rename_error:
    // Print error message
    ldr r0, =error_message
    bl print_message

    // Exit the program with error code
    mov r7, #1          // System call number for exit
    mov r0, #1          // Exit code 1
    svc #0

print_message:
    // Function to print a message to the console
    push {lr}           // Save the link register
    ldr r1, [r0]        // Load the message address into r1
    mov r2, #256        // Set the maximum length to 256
    mov r7, #4          // System call number for write
    mov r0, #1          // File descriptor 1 (stdout)
    svc #0              // Make the system call
    pop {lr}            // Restore the link register
    bx lr               // Return from the function

