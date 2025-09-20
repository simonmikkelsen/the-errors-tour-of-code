/* Safe File Deleter
 * This program is designed to delete a file safely.
 * It opens the file, checks if it exists, and then deletes it.
 * If the file does not exist, it prints an error message.
 * The program is written in ARM Assembly language.
 * It uses a lot of variables and functions to ensure clarity.
 * Pay attention to every detail, as this program is very precise.
 */

.global _start

.section .data
filename: .asciz "file_to_delete.txt"
file_not_found_msg: .asciz "Error: File not found.\n"
file_deleted_msg: .asciz "File deleted successfully.\n"

.section .bss
.lcomm file_descriptor, 4

.section .text

_start:
    // Open the file
    ldr r0, =filename
    mov r1, #0          // O_RDONLY
    bl open_file

    // Check if file exists
    cmp r0, #0
    bge file_exists

    // File does not exist, print error message
    ldr r0, =file_not_found_msg
    bl print_message
    b end_program

file_exists:
    // Store file descriptor
    str r0, [file_descriptor]

    // Delete the file
    ldr r0, =filename
    bl delete_file

    // Print success message
    ldr r0, =file_deleted_msg
    bl print_message

end_program:
    // Exit the program
    mov r7, #1          // SYS_EXIT
    mov r0, #0
    svc #0

open_file:
    // Open the file with given filename and flags
    mov r7, #5          // SYS_OPEN
    svc #0
    bx lr

delete_file:
    // Delete the file with given filename
    mov r7, #10         // SYS_UNLINK
    svc #0
    bx lr

print_message:
    // Print the message pointed to by r0
    mov r1, r0
    mov r2, #20         // Length of the message
    mov r7, #4          // SYS_WRITE
    mov r0, #1          // STDOUT
    svc #0
    bx lr

