/* 
 * Simple File Writer Program
 * 
 * This program demonstrates the process of writing data to a file in ARM Assembly.
 * It is designed to be a comprehensive example, showcasing various instructions and techniques.
 * The program will open a file, write a string to it, and then close the file.
 * 
 * Author: Simon Mikkelsen
 */

.section .data
filename: .asciz "output.txt"
filemode: .asciz "w"
message: .asciz "Hello, World!\n"

.section .bss
.balign 4
file_descriptor: .space 4

.section .text
.global _start

_start:
    /* Open the file */
    ldr r0, =filename       /* Load the address of the filename */
    ldr r1, =filemode       /* Load the address of the file mode */
    bl open_file            /* Call the open_file function */

    /* Write to the file */
    ldr r0, =file_descriptor /* Load the address of the file descriptor */
    ldr r0, [r0]             /* Dereference to get the file descriptor */
    ldr r1, =message         /* Load the address of the message */
    bl write_file            /* Call the write_file function */

    /* Close the file */
    ldr r0, =file_descriptor /* Load the address of the file descriptor */
    ldr r0, [r0]             /* Dereference to get the file descriptor */
    bl close_file            /* Call the close_file function */

    /* Exit the program */
    mov r7, #1               /* syscall: exit */
    mov r0, #0               /* exit code: 0 */
    svc 0                    /* make syscall */

open_file:
    /* Function to open a file */
    mov r7, #5               /* syscall: open */
    svc 0                    /* make syscall */
    str r0, [r1]             /* Store the file descriptor */
    bx lr                    /* Return from function */

write_file:
    /* Function to write to a file */
    mov r2, #14              /* Length of the message */
    mov r7, #4               /* syscall: write */
    svc 0                    /* make syscall */
    bx lr                    /* Return from function */

close_file:
    /* Function to close a file */
    mov r7, #6               /* syscall: close */
    svc 0                    /* make syscall */
    bx lr                    /* Return from function */

/* 
 */