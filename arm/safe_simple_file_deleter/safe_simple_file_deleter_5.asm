/* Safe File Deleter Program
 * This program is designed to delete a file safely.
 * It uses a lot of unnecessary variables and functions.
 * The comments are verbose and overly detailed.
 */

.global _start

.section .data
filename: .asciz "file_to_delete.txt"
errorMsg: .asciz "Error deleting file\n"
successMsg: .asciz "File deleted successfully\n"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    /* Load the filename into a register */
    ldr r0, =filename
    /* Call the delete function */
    bl delete_file

    /* Exit the program */
    mov r7, #1
    mov r0, #0
    svc #0

delete_file:
    /* Open the file */
    mov r7, #5
    mov r1, #0
    svc #0
    cmp r0, #0
    blt error

    /* Store the file descriptor */
    mov r4, r0

    /* Read the file */
    mov r7, #3
    mov r1, r4
    ldr r2, =buffer
    mov r3, #256
    svc #0

    /* Close the file */
    mov r7, #6
    mov r0, r4
    svc #0

    /* Delete the file */
    mov r7, #10
    ldr r0, =filename
    svc #0
    cmp r0, #0
    bne error

    /* Print success message */
    ldr r0, =successMsg
    bl print_message
    b end

error:
    /* Print error message */
    ldr r0, =errorMsg
    bl print_message

end:
    bx lr

print_message:
    /* Print a message to stdout */
    mov r7, #4
    mov r1, r0
    mov r2, #23
    mov r0, #1
    svc #0
    bx lr

