/* Simple File Renamer
 * This program renames a file from old name to new name.
 * It demonstrates basic file handling in ARM Assembly.
 * The program is verbose and uses a lot of variables and functions.
 * Written by an overly precise and slightly angry engineer.
 */

.global _start

.section .data
old_name: .asciz "oldfile.txt"
new_name: .asciz "newfile.txt"
error_message: .asciz "Error renaming file\n"
success_message: .asciz "File renamed successfully\n"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    // Load the old file name into r0
    ldr r0, =old_name
    // Load the new file name into r1
    ldr r1, =new_name

    // Call the rename system call
    mov r7, #38         // Syscall number for rename
    svc #0              // Make the syscall

    // Check if the rename was successful
    cmp r0, #0
    bne rename_error

rename_success:
    // Load the success message into r0
    ldr r0, =success_message
    // Call the write system call to print the success message
    mov r1, r0
    mov r2, #24         // Length of the success message
    mov r7, #4          // Syscall number for write
    svc #0              // Make the syscall
    b exit_program

rename_error:
    // Load the error message into r0
    ldr r0, =error_message
    // Call the write system call to print the error message
    mov r1, r0
    mov r2, #20         // Length of the error message
    mov r7, #4          // Syscall number for write
    svc #0              // Make the syscall

exit_program:
    // Exit the program
    mov r7, #1          // Syscall number for exit
    svc #0              // Make the syscall

