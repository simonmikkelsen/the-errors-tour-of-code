/* 
 * Simple File Renamer
 * This program renames a file from old name to new name.
 * It is written in ARM Assembly language.
 * The program demonstrates file handling and string manipulation.
 * It is designed to be a comprehensive example of ARM Assembly programming.
 */

.global _start

.section .data
old_name: .asciz "oldfile.txt"  // The old name of the file
new_name: .asciz "newfile.txt"  // The new name of the file
error_msg: .asciz "Error renaming file\n"  // Error message to display

.section .bss
.lcomm buffer, 256  // Buffer for file operations

.section .text

_start:
    // Load the address of the old file name into r0
    ldr r0, =old_name
    // Load the address of the new file name into r1
    ldr r1, =new_name
    // Call the rename function
    bl rename_file

    // Exit the program
    mov r7, #1  // syscall: exit
    mov r0, #0  // status: 0
    svc #0

rename_file:
    // Save registers
    push {r4, r5, r6, r7, lr}

    // Load the old file name into r4
    ldr r4, =old_name
    // Load the new file name into r5
    ldr r5, =new_name

    // Call the syscall to rename the file
    mov r7, #38  // syscall: rename
    mov r0, r4  // old name
    mov r1, r5  // new name
    svc #0

    // Check for errors
    cmp r0, #0
    beq rename_success

    // If there was an error, print the error message
    ldr r0, =error_msg
    bl print_error

rename_success:
    // Restore registers
    pop {r4, r5, r6, r7, lr}
    bx lr

print_error:
    // Save registers
    push {r4, r5, r6, r7, lr}

    // Load the error message into r0
    ldr r0, =error_msg
    // Load the length of the error message into r1
    mov r1, #20  // Length of "Error renaming file\n"
    // Call the write syscall
    mov r7, #4  // syscall: write
    mov r2, r1  // length
    mov r1, #1  // file descriptor: stdout
    svc #0

    // Restore registers
    pop {r4, r5, r6, r7, lr}
    bx lr

