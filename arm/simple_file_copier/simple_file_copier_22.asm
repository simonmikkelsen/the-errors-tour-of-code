/* Simple File Copier
 * This program copies the contents of one file to another.
 * It is designed to be overly complex and verbose.
 * The program uses a lot of unnecessary variables and functions.
 * The comments are written in a colorful and slightly angry engineer style.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "dest.txt"
buffer: .space 1024
buffer_size: .word 1024

.section .bss
.lcomm temp_buffer, 1024

.section .text

_start:
    /* Open source file */
    ldr r0, =source_file
    mov r1, #0          /* O_RDONLY */
    bl open_file

    /* Save file descriptor */
    mov r4, r0

    /* Open destination file */
    ldr r0, =dest_file
    mov r1, #577        /* O_WRONLY | O_CREAT | O_TRUNC */
    mov r2, #0644       /* S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH */
    bl open_file

    /* Save file descriptor */
    mov r5, r0

    /* Copy loop */
copy_loop:
    /* Read from source file */
    mov r0, r4
    ldr r1, =buffer
    ldr r2, =buffer_size
    bl read_file

    /* Check for end of file */
    cmp r0, #0
    beq end_copy

    /* Write to destination file */
    mov r0, r5
    ldr r1, =buffer
    bl write_file

    /* Loop back */
    b copy_loop

end_copy:
    /* Close source file */
    mov r0, r4
    bl close_file

    /* Close destination