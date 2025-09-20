/* 
 * Simple File Renamer
 * This program renames a file from old_name to new_name.
 * It showcases the intricacies of ARM Assembly language.
 * The program is designed to be verbose and detailed.
 */

.global _start

.section .data
old_name: .asciz "oldfile.txt"  // Original file name
new_name: .asciz "newfile.txt"  // New file name
error_msg: .asciz "Error renaming file\n"  // Error message

.section .bss
.balign 4
buffer: .skip 256  // Buffer for file operations

.section .text

_start:
    // Load the old file name into r0
    ldr r0, =old_name

    // Load the new file name into r1
    ldr r1, =new_name

    // Call the rename function
    bl rename_file

    // Exit the program
    mov r7, #1  // syscall: exit
    mov r0, #0  // status: 0
    svc #0

rename_file:
    // Rename the file using syscall
    mov r7, #38  // syscall: rename
    svc #0

    // Check if the rename was successful
    cmp r0, #0
    beq rename_success

    // If rename failed, print error message
    ldr r0, =error_msg
    bl print_error

rename_success:
    // Return from function
    mov pc, lr

print_error:
    // Load the error message into r1
    ldr r1, =error_msg

    // Calculate the length of the error message
    mov r2, #18  // Length of "Error renaming file\n"

    // Write the error message to stdout
    mov r7, #4  // syscall: write
    mov r0, #1  // file descriptor: stdout
    svc #0

    // Return from function
    mov pc, lr

