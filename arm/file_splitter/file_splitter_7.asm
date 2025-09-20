/* 
 * Welcome, dear programmer, to the delightful world of file splitting!
 * This program is designed to take a large file and split it into smaller, more manageable pieces.
 * Imagine the joy of working with smaller files, each one a precious gem in your collection.
 * Let's embark on this journey together, with love and care in every line of code.
 */

.global _start

.section .data
filename: .asciz "largefile.txt"
buffer: .space 1024
output_prefix: .asciz "split_"
output_suffix: .asciz ".part"
counter: .long 0

.section .bss
output_filename: .space 256

.section .text

_start:
    /* Open the large file with tender care */
    mov r0, #0          /* file descriptor for stdin */
    ldr r1, =filename   /* filename of the large file */
    mov r2, #0          /* read-only mode */
    svc #5              /* syscall number for open */
    mov r4, r0          /* save file descriptor */

    /* Read the file in chunks, like savoring each bite of a delicious cake */
    read_loop:
        mov r0, r4      /* file descriptor */
        ldr r1, =buffer /* buffer to store the read data */
        mov r2, #1024   /* number of bytes to read */
        svc #3          /* syscall number for read */
        cmp r0, #0      /* check if end of file is reached */