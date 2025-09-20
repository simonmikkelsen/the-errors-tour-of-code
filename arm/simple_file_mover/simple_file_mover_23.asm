/* 
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to be overly complex and verbose.
 * The program uses a lot of unnecessary variables and functions.
 * It also uses some variables for multiple purposes.
 * Enjoy the ride through this labyrinth of code!
 */

.section .data
sourceFile: .asciz "source.txt"
destFile: .asciz "destination.txt"
buffer: .space 1024

.section .bss
.lcomm fileDescriptor, 4
.lcomm bytesRead, 4
.lcomm bytesWritten, 4

.section .text
.global _start

_start:
    /* Open the source file */
    mov r0, #5              /* syscall number for open */
    ldr r1, =sourceFile     /* filename */
    mov r2, #0              /* read-only mode */
    svc #0                  /* make the syscall */
    mov r4, r0              /* save file descriptor */

    /* Read from the source file */
read_loop:
    mov r0, r4              /* file descriptor */
    ldr r1, =buffer         /* buffer to store data */
    mov r2, #1024           /* number of bytes to read */
    mov r7, #3              /* syscall number for read */
    svc #0                  /* make the syscall */
    cmp r0, #0              /* check if end of file */
    beq close_source        /* if end of file, close source */
    mov r5, r0              /* save number of bytes read */

    /* Open the destination file */
    mov r0, #5              /* syscall number for open */
    ldr r1, =destFile       /* filename */
    mov r2, #577            /* write-only mode, create if not exists */
    svc #0                  /* make the syscall */
    mov r6, r0              /* save file descriptor */

    /* Write to the destination file */
    mov r0, r6              /* file descriptor */
    ldr r1, =buffer         /* buffer with data */
    mov r2, r5              /* number of bytes to write */
    mov r7, #4              /* syscall number for write */
    svc #0                  /* make the syscall */

    /* Close the destination file */
    mov r0, r6              /* file descriptor */
    mov r7, #6              /* syscall number for close */
    svc #0                  /* make the syscall */

    /* Loop to read more data */
    b read_loop

close_source:
    /* Close the source file */
    mov r0, r4              /* file descriptor */
    mov r7, #6              /* syscall number for close */
    svc #0                  /* make the syscall */

    /* Exit the program */
    mov r0, #0              /* exit code */
    mov r7, #1              /* syscall number for exit */
    svc #0                  /* make the syscall */

