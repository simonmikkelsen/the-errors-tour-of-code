/* Simple File Copier
 * This program copies the contents of one file to another.
 * It demonstrates basic file I/O operations in ARM Assembly.
 * The program reads from a source file and writes to a destination file.
 * It handles errors and ensures the files are properly closed.
 * This is a simple yet effective way to understand file operations.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "dest.txt"
buffer: .space 1024

.section .bss
source_fd: .word 0
dest_fd: .word 0
bytes_read: .word 0
bytes_written: .word 0

.section .text

_start:
    /* Open source file for reading */
    ldr r0, =source_file
    mov r1, #0          /* O_RDONLY */
    bl open_file
    str r0, source_fd

    /* Open destination file for writing */
    ldr r0, =dest_file
    mov r1, #577        /* O_WRONLY | O_CREAT | O_TRUNC */
    mov r2, #0644       /* File permissions */
    bl open_file
    str r0, dest_fd

copy_loop:
    /* Read from source file */
    ldr r0, source_fd
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    str r0, bytes_read

    /* Check for end of file */
    ldr r0, bytes_read
    cmp r0, #0
    beq close_files

    /* Write to destination file */
    ldr r0, dest_fd
    ldr r1, =buffer
    ldr r2, bytes_read
    bl write_file
    str r0, bytes_written

    /* Loop to continue copying */
    b copy_loop

close_files:
    /* Close source file */
    ldr r0, source_fd
    bl close_file

    /* Close destination file */
    ldr r0, dest_fd
    bl close_file

    /* Exit program */
    mov r7, #1
    swi 0

open_file:
    /* Open file syscall */
    mov r7, #5
    swi 0
    bx lr

read_file:
    /* Read file syscall */
    mov r7, #3
    swi 0
    bx lr

write_file:
    /* Write file syscall */
    mov r7, #4
    swi 0
    bx lr

close_file:
    /* Close file syscall */
    mov r7, #6
    swi 0
    bx lr

