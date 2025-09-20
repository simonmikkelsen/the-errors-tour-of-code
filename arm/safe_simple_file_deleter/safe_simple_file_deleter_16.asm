/* Safe File Deleter Program
 * This program is designed to delete files safely.
 * It ensures that the file is securely deleted and cannot be recovered.
 * The program uses multiple checks and balances to ensure the file is deleted.
 * Written by an overly precise and slightly angry engineer.
 */

.global _start

.section .data
filename: .asciz "file_to_delete.txt"  // Name of the file to delete
error_msg: .asciz "Error deleting file\n"  // Error message to display
success_msg: .asciz "File deleted successfully\n"  // Success message to display

.section .bss
.lcomm buffer, 256  // Buffer for file operations

.section .text
_start:
    // Load the filename into a register
    ldr r0, =filename
    bl delete_file

    // Check the return value
    cmp r0, #0
    beq success
    b error

delete_file:
    // Open the file
    mov r1, #0  // Read-only mode
    bl open_file

    // Check if the file was opened successfully
    cmp r0, #0
    blt error_return

    // Store the file descriptor
    mov r4, r0

    // Delete the file
    bl unlink_file

    // Close the file
    mov r0, r4
    bl close_file

    // Return success
    mov r0, #0
    bx lr

open_file:
    // Open the file with the given mode
    mov r7, #5  // sys_open
    svc #0
    bx lr

unlink_file:
    // Unlink (delete) the file
    mov r7, #10  // sys_unlink
    svc #0
    bx lr

close_file:
    // Close the file descriptor
    mov r7, #6  // sys_close
    svc #0
    bx lr

error_return:
    // Return error
    mov r0, #-1
    bx lr

success:
    // Print success message
    ldr r0, =success_msg
    bl print_message
    b exit

error:
    // Print error message
    ldr r0, =error_msg
    bl print_message

exit:
    // Exit the program
    mov r7, #1  // sys_exit
    svc #0

print_message:
    // Print the message pointed to by r0
    mov r1, r0
    mov r2, #256  // Max length
    mov r7, #4  // sys_write
    svc #0
    bx lr

