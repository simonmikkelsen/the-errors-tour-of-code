/* 
 * Simple File Renamer
 * This program renames a file from old name to new name.
 * It uses ARM Assembly to demonstrate low-level file operations.
 * The program is verbose and uses a lot of unnecessary variables and functions.
 * It is designed to be overly complex for no apparent reason.
 */

.global _start

.section .data
old_filename: .asciz "oldfile.txt"
new_filename: .asciz "newfile.txt"
error_message: .asciz "Error renaming file\n"
success_message: .asciz "File renamed successfully\n"

.section .bss
.comm buffer, 256

.section .text

_start:
    // Load the old filename into r0
    ldr r0, =old_filename
    
    // Load the new filename into r1
    ldr r1, =new_filename
    
    // Call the rename function
    bl rename_file
    
    // Check the result
    cmp r0, #0
    beq success
    b error

rename_file:
    // Load the old filename into r2
    ldr r2, =old_filename
    
    // Load the new filename into r3
    ldr r3, =new_filename
    
    // Call the syscall to rename the file
    mov r7, #38 // Syscall number for rename
    svc 0
    
    // Return the result
    mov pc, lr

success:
    // Print success message
    ldr r0, =success_message
    bl print_message
    b exit

error:
    // Print error message
    ldr r0, =error_message
    bl print_message

exit:
    // Exit the program
    mov r7, #1 // Syscall number for exit
    svc 0

print_message:
    // Load the message into r1
    ldr r1, [r0]
    
    // Load the length of the message into r2
    mov r2, #24
    
    // Call the write syscall
    mov r7, #4 // Syscall number for write
    mov