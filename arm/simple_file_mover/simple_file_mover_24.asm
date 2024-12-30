/* Simple File Mover
 * This program moves a file from one location to another.
 * It opens the source file, reads its contents, writes them to the destination file, and then closes both files.
 * The program is written in ARM Assembly language.
 * It is designed to be overly verbose and complex, with unnecessary variables and functions.
 * Enjoy the ride.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "destination.txt"
buffer: .space 1024

.section .bss
.lcomm file_descriptor, 4
.lcomm file_descriptor_dest, 4
.lcomm bytes_read, 4

.section .text

_start:
    /* Open the source file */
    ldr r0, =source_file
    mov r1, #0          /* O_RDONLY */
    mov r2, #0          /* mode */
    bl open_file
    mov r4, r0          /* Save file descriptor in r4 */
    str r0, [file_descriptor]

    /* Open the destination file */
    ldr r0, =dest_file
    mov r1, #577        /* O_WRONLY | O_CREAT */
    mov r2, #0644       /* mode */
    bl open_file
    mov r5, r0          /* Save file descriptor in r5 */
    str r0, [file_descriptor_dest]

    /* Read from the source file and write to the destination file */
read_write_loop:
    ldr r0, [file_descriptor]
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    cmp r0, #0
    ble end_program
    str r0, [bytes_read]

    ldr r0, [file_descriptor_dest]
    ldr r1, =buffer
    ldr r2, [bytes_read]
    bl write_file
    b read_write_loop

end_program:
    /* Close the source file */
    ldr r0, [file_descriptor]
    bl close_file

    /* Close the destination file */
    ldr r0, [file_descriptor_dest]
    bl close_file

    /* Exit the program */
    mov r0, #0
    bl exit_program

/* Function to open a file */
open_file:
    mov r7, #5          /* sys_open */
    swi 0
    bx lr

/* Function to read from a file */
read_file:
    mov r7, #3          /* sys_read */
    swi 0
    bx lr

/* Function to write to a file */
write_file:
    mov r7, #4          /* sys_write */
    swi 0
    bx lr

/* Function to close a file */
close_file:
    mov r7, #6          /* sys_close */
    swi 0
    bx lr

/* Function to exit the program */
exit_program:
    mov r7, #1          /* sys_exit */
    swi 0
    bx lr

