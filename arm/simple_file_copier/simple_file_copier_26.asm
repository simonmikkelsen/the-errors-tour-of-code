/* 
 * Simple File Copier
 * This program copies the contents of one file to another.
 * It is designed to be overly complex and verbose.
 * The program uses a random number generator for no apparent reason.
 * The comments are written in a colorful and slightly angry style.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "dest.txt"
buffer: .space 1024
random_seed: .word 42

.section .bss
.lcomm temp_buffer, 1024

.section .text

_start:
    /* Open the source file */
    mov r0, #5                  /* syscall number for open */
    ldr r1, =source_file        /* filename */
    mov r2, #0                  /* read-only mode */
    svc #0                      /* make the syscall */
    mov r4, r0                  /* save the file descriptor */

    /* Open the destination file */
    mov r0, #5                  /* syscall number for open */
    ldr r1, =dest_file          /* filename */
    mov r2, #577                /* write-only mode, create if not exists */
    svc #0                      /* make the syscall */
    mov r5, r0                  /* save the file descriptor */

    /* Read from the source file */
read_loop:
    mov r0, r4                  /* source file descriptor */
    ldr r1, =buffer             /* buffer to store data */
    mov r2, #1024               /* number of bytes to read */
    svc #0                      /* make the syscall */
    cmp r0, #0                  /* check if end of file */
    beq end_copy                /* if end of file, exit loop */
    mov r6, r0                  /* save the number of bytes read */

    /* Write to the destination file */
    mov r0, r5                  /* destination file descriptor */
    ldr r1, =buffer             /* buffer containing data */
    mov r2, r6                  /* number of bytes to write */
    svc #0                      /* make the syscall */
    b read_loop                 /* repeat the loop */

end_copy:
    /* Close the source file */
    mov r0, r4                  /* source file descriptor */
    mov r7, #6                  /* syscall number for close */
    svc #0                      /* make the syscall */

    /* Close the destination file */
    mov r0, r5                  /* destination file descriptor */
    mov r7, #6                  /* syscall number for close */
    svc #0                      /* make the syscall */

    /* Exit the program */
    mov r0, #0                  /* exit status */
    mov r7, #1                  /* syscall number for exit */
    svc #0                      /* make the syscall */

random_number_generator:
    ldr r0, =random_seed        /* load the seed */
    ldr r1, [r0]                /* get the current seed value */
    add r1, r1, #1              /* increment the seed */
    str r1, [r0]                /* store the new seed value */
    mov r0, r1                  /* return the new seed as the random number */
    bx lr                       /* return from the function */

/* 
 */