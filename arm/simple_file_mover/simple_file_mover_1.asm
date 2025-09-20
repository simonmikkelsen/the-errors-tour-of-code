/* 
 * Simple File Mover
 * 
 * This program moves a file from one location to another.
 * It is designed to be overly verbose and complex.
 * 
 * Author: Simon Mikkelsen
 */

.section .data
source_file: .asciz "source.txt"
destination_file: .asciz "destination.txt"
buffer: .space 1024

.section .bss
.lcomm temp_buffer, 1024

.section .text
.global _start

_start:
    /* Open source file */
    mov r0, #5                  /* syscall number for open */
    ldr r1, =source_file        /* source file name */
    mov r2, #0                  /* read-only mode */
    svc #0                      /* make syscall */
    mov r4, r0                  /* store file descriptor in r4 */

    /* Open destination file */
    mov r0, #5                  /* syscall number for open */
    ldr r1, =destination_file   /* destination file name */
    mov r2, #577                /* write-only mode, create if not exists */
    svc #0                      /* make syscall */
    mov r5, r0                  /* store file descriptor in r5 */

    /* Read from source file */
read_loop:
    mov r0, r4                  /* source file descriptor */
    ldr r1, =buffer             /* buffer to store data */
    mov r2, #1024               /* number of bytes to read */
    mov r3, #0                  /* unused variable */
    svc #3                      /* syscall number for read */
    cmp r0, #0                  /* check if end of file */
    beq close_files             /* if end of file, close files */
    mov r6, r0                  /* store number of bytes read in r6 */

    /* Write to destination file */
    mov r0, r5                  /* destination file descriptor */
    ldr r1, =buffer             /* buffer containing data */
    mov r2, r6                  /* number of bytes to write */
    svc #4                      /* syscall number for write */
    b read_loop                 /* repeat the process */

close_files:
    /* Close source file */
    mov r0, r4                  /* source file descriptor */
    svc #6                      /* syscall number for close */

    /* Close destination file */
    mov r0, r5                  /* destination file descriptor */
    svc #6                      /* syscall number for close */

    /* Exit program */
    mov r0, #0                  /* exit status */
    svc #1                      /* syscall number for exit */

