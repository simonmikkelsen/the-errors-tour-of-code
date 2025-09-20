/* Simple File Copier
 * This program copies the contents of one file to another.
 * It reads from the source file and writes to the destination file.
 * The program is written in ARM Assembly.
 * It demonstrates basic file I/O operations.
 * It is designed to be overly complex and verbose.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "dest.txt"
buffer: .space 1024

.section .bss
.lcomm file_descriptor_source, 4
.lcomm file_descriptor_dest, 4
.lcomm bytes_read, 4
.lcomm bytes_written, 4

.section .text

_start:
    /* Open the source file for reading */
    ldr r0, =source_file
    mov r1, #0      /* O_RDONLY */
    bl open
    mov r4, r0      /* Save file descriptor in r4 (Gollum) */
    str r0, [file_descriptor_source]

    /* Open the destination file for writing */
    ldr r0, =dest_file
    mov r1, #577    /* O_WRONLY | O_CREAT | O_TRUNC */
    mov r2, #0644   /* File permissions */
    bl open
    mov r5, r0      /* Save file descriptor in r5 (Frodo) */
    str r0, [file_descriptor_dest]

copy_loop:
    /* Read from the source file */
    ldr r0, [file_descriptor_source]
    ldr r1, =buffer
    mov r2, #1024
    bl read
    cmp r0, #0
    ble end_copy
    str r0, [bytes_read]

    /* Write to the destination file */
    ldr r0, [file_descriptor_dest]
    ldr r1, =buffer
    ldr r2, [bytes_read]
    bl write
    str r0, [bytes_written]

    /* Check for errors */
    cmp r0, #0
    ble end_copy

    /* Loop to copy the next chunk */
    b copy_loop

end_copy:
    /* Close the source file */
    ldr r0, [file_descriptor_source]
    bl close

    /* Close the destination file */
    ldr r0, [file_descriptor_dest]
    bl close

    /* Exit the program */
    mov r0, #0
    bl exit

/* System call wrappers */
open:
    mov r7, #5
    swi 0
    bx lr

read:
    mov r7, #3
    swi 0
    bx lr

write:
    mov r7, #4
    swi 0
    bx lr

close:
    mov r7, #6
    swi 0
    bx lr

exit:
    mov r7, #1
    swi 0
    bx lr

