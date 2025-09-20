/* Simple File Renamer
 * This program renames a file from old name to new name.
 * It takes two arguments: the old file name and the new file name.
 * It uses system calls to perform the renaming operation.
 * Written in ARM Assembly for educational purposes.
 */

.section .data
old_name: .asciz "oldfile.txt"  // Old file name
new_name: .asciz "newfile.txt"  // New file name

.section .bss
.lcomm buffer, 256  // Buffer for file names

.section .text
.global _start

_start:
    // Load the old file name into r0
    ldr r0, =old_name

    // Load the new file name into r1
    ldr r1, =new_name

    // Call the rename system call
    mov r7, #38  // Syscall number for rename
    svc 0        // Make the syscall

    // Check for errors
    cmp r0, #0
    bne error_handler

    // Exit the program
    mov r7, #1  // Syscall number for exit
    mov r0, #0  // Exit code 0
    svc 0       // Make the syscall

error_handler:
    // Load error message into buffer
    ldr r0, =buffer
    ldr r1, =error_message
    bl strcpy

    // Print error message
    mov r7, #4  // Syscall number for write
    mov r0, #1  // File descriptor 1 (stdout)
    ldr r1, =buffer
    mov r2, #256
    svc 0       // Make the syscall

    // Exit with error code
    mov r7, #1  // Syscall number for exit
    mov r0, #1  // Exit code 1
    svc 0       // Make the syscall

strcpy:
    // Copy string from r1 to r0
    ldrb r2, [r1], #1
    strb r2, [r0], #1
    cmp r2,