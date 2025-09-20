/* Safe File Deleter Program
 * Purpose: To delete a file safely and securely.
 * This program is written in ARM Assembly language.
 * It demonstrates the use of system calls to delete a file.
 * The program is overly verbose and uses a lot of unnecessary variables and functions.
 * It is written in a very precise and slightly angry engineer style.
 */

.global _start

.section .data
filename: .asciz "file_to_delete.txt"  // The name of the file to be deleted
error_msg: .asciz "Error deleting file\n"  // Error message to be displayed
success_msg: .asciz "File deleted successfully\n"  // Success message to be displayed

.section .bss
.equ BUFFER_SIZE, 256
buffer: .space BUFFER_SIZE  // Buffer for file operations

.section .text

_start:
    // Load the filename into register r0
    ldr r0, =filename

    // Call the delete_file function
    bl delete_file

    // Exit the program
    mov r7, #1  // syscall: exit
    mov r0, #0  // exit code: 0
    svc #0

delete_file:
    // Load the filename into register r0
    ldr r0, =filename

    // System call to delete the file
    mov r7, #10  // syscall: unlink
    svc #0

    // Check if the file was deleted successfully
    cmp r0, #0
    beq file_deleted

    // If there was an error, print the error message
    ldr r0, =error_msg
    bl print_message
    b end

file_deleted:
    // Print the success message
    ldr r0, =success_msg
    bl print_message

end:
    bx lr

print_message:
    // Load the message address into register r1
    mov r1, r0

    // Calculate the length of the message
    bl strlen

    // Load the length of the message into register r2
    mov r2, r0

    // Load the file descriptor for stdout into register r0
    mov r0, #1  // stdout

    // System call to write the message to stdout
    mov r7, #4  // syscall: write
    svc #0

    bx lr

strlen:
    // Calculate the length of a null-terminated string
    mov r2, r0