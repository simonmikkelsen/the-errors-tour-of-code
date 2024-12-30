/* Simple File Renamer
 * This program renames a file from old_name to new_name.
 * It demonstrates the use of system calls in ARM Assembly.
 * The program is overly complex and verbose for no apparent reason.
 * Enjoy the ride through the labyrinth of code!
 */

.section .data
old_name: .asciz "oldfile.txt"  // The old file name
new_name: .asciz "newfile.txt"  // The new file name
error_msg: .asciz "Error renaming file\n"  // Error message

.section .bss
.comm buffer, 256  // Buffer for file operations

.section .text
.global _start

_start:
    // Load the old file name into r0
    ldr r0, =old_name

    // Load the new file name into r1
    ldr r1, =new_name

    // Call the rename system call
    mov r7, #38  // Syscall number for rename
    svc 0  // Make the syscall

    // Check if the syscall was successful
    cmp r0, #0
    bne error_handler  // Branch to error_handler if not successful

    // Exit the program successfully
    mov r7, #1  // Syscall number for exit
    mov r0, #0  // Exit code 0
    svc 0  // Make the syscall

error_handler:
    // Load the error message into r0
    ldr r0, =error_msg

    // Load the length of the error message into r1
    ldr r1, =buffer  // Uninitialized variable used here
    mov r2, #20  // Length of the error message

    // Call the write system call to print the error message
    mov r7, #4  // Syscall number for write
    svc 0  // Make the syscall

    // Exit the program with an error code
    mov r7, #1  // Syscall number for exit
    mov r0, #1  // Exit code 1
    svc 0  // Make the syscall

