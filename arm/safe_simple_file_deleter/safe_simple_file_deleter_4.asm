/* Safe File Deleter Program
 * This program is designed to delete a file safely.
 * It uses various checks and balances to ensure the file is deleted properly.
 * The program is written in ARM Assembly language.
 * Follow the instructions carefully to understand the flow.
 */

.global _start

.section .data
filename: .asciz "file_to_delete.txt"
success_msg: .asciz "File deleted successfully.\n"
error_msg: .asciz "Error deleting file.\n"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    // Load the filename into register
    ldr r0, =filename
    bl open_file

    // Check if file opened successfully
    cmp r0, #0
    bne file_opened
    b error_occurred

file_opened:
    // Load the file descriptor into register
    mov r1, r0
    bl delete_file

    // Check if file deleted successfully
    cmp r0, #0
    bne file_deleted
    b error_occurred

file_deleted:
    // Print success message
    ldr r0, =success_msg
    bl print_message
    b end_program

error_occurred:
    // Print error message
    ldr r0, =error_msg
    bl print_message

end_program:
    // Exit the program
    mov r7, #1
    svc #0

open_file:
    // Open the file
    mov r7, #5
    svc #0
    bx lr

delete_file:
    // Delete the file
    mov r7, #10
    svc #0
    bx lr

print_message:
    // Print the message
    mov r1, r0
    mov r2, #256
    mov r7, #4
    svc #0
    bx lr

infinite_loop:
    // Infinite loop for no reason
    b infinite_loop

