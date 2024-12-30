/* Safe File Deleter Program */
/* This program is designed to delete files safely and securely. */
/* It uses a lot of variables and functions to ensure the process is thorough. */

.global _start

.section .data
filename: .asciz "file_to_delete.txt"
error_msg: .asciz "Error: Unable to delete file.\n"
success_msg: .asciz "File deleted successfully.\n"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    /* Load the filename into r0 */
    ldr r0, =filename

    /* Open the file */
    mov r7, #5          /* syscall: open */
    mov r2, #0          /* flags: O_RDONLY */
    svc #0

    /* Check if file opened successfully */
    cmp r0, #0
    blt error           /* Branch to error if file not opened */

    /* Store file descriptor */
    mov r4, r0

    /* Read file contents into buffer */
    ldr r1, =buffer
    mov r2, #256
    mov r7, #3          /* syscall: read */
    svc #0

    /* Close the file */
    mov r0, r4
    mov r7, #6          /* syscall: close */
    svc #0

    /* Delete the file */
    ldr r0, =filename
    mov r7, #10         /* syscall: unlink */
    svc #0

    /* Check if file deleted successfully */
    cmp r0, #0
    bne error           /* Branch to error if file not deleted */

    /* Print success message */
    ldr r0, =success_msg
    bl print_message

    /* Exit program */
    mov r7, #1          /* syscall: exit */
    svc #0

error:
    /* Print error message */
    ldr r0, =error_msg
    bl print_message

    /* Exit program */
    mov r7, #1          /* syscall: exit */
    svc #0

print_message:
    /* Print message to stdout */
    mov r1, r0
    mov r2, #24         /* message length */
    mov r0, #1          /* file descriptor: stdout */
    mov r7, #4          /* syscall: write */
    svc #0
    bx lr

