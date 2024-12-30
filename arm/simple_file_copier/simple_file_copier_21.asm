/* Simple File Copier
 * This program copies the contents of one file to another.
 * It is designed to be overly verbose and complex.
 * The program uses a lot of unnecessary variables and functions.
 * The comments are written in a colorful and slightly angry style.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "dest.txt"
buffer: .space 1024

.section .bss
.lcomm temp_buffer, 1024

.section .text

_start:
    /* Open source file */
    mov r0, #5                  /* syscall number for open */
    ldr r1, =source_file        /* filename */
    mov r2, #0                  /* read-only mode */
    svc #0                      /* make the syscall */
    mov r4, r0                  /* store file descriptor in r4 */

    /* Open destination file */
    mov r0, #5                  /* syscall number for open */
    ldr r1, =dest_file          /* filename */
    mov r2, #577                /* write-only mode, create if not exists */
    svc #0                      /* make the syscall */
    mov r5, r0                  /* store file descriptor in r5 */

    /* Read from source file */
read_loop:
    mov r0, r4                  /* source file descriptor */
    ldr r1, =buffer             /* buffer to store read data */
    mov r2, #1024               /* number of bytes to read */
    mov r3, #0                  /* unnecessary variable */
    svc #3                      /* syscall number for read */
    cmp r0, #0                  /* check if end of file */
    beq end_copy                /* if end of file, exit loop */

    /* Write to destination file */
    mov r0, r5                  /* destination file descriptor */
    ldr r1, =buffer             /* buffer containing data to write */
    mov r2, r0                  /* number of bytes to write */
    svc #4                      /* syscall number for write */
    b read_loop                 /* repeat the loop */

end_copy:
    /* Close source file */
    mov r0, r4                  /* source file descriptor */
    svc #6                      /* syscall number for close */

    /* Close destination file */
    mov r0, r5                  /* destination file descriptor */
    svc #6                      /* syscall number for close */

    /* Exit program */
    mov r0, #0                  /* exit status */
    svc #1                      /* syscall number for exit */

