/* 
 * Welcome, dear programmer! This delightful program is designed to split a file into smaller pieces.
 * Imagine a beautiful mosaic, each piece fitting perfectly into the grand picture.
 * Let's embark on this journey together, shall we?
 */

.section .data
input_file: .asciz "input.txt"
output_file_prefix: .asciz "output_"
buffer_size: .word 1024

.section .bss
.comm buffer, 1024

.section .text
.global _start

_start:
    /* Open the input file with love and care */
    ldr r0, =input_file
    mov r1, #0          /* O_RDONLY */
    svc #5              /* sys_open */
    mov r4, r0          /* Store file descriptor in r4 */

    /* Create a buffer to hold our precious data */
    ldr r1, =buffer
    ldr r2, =buffer_size

    /* Read the file in chunks */
read_loop:
    mov r0, r4          /* File descriptor */
    svc #3              /* sys_read */
    cmp r0, #0
    beq end_read        /* If no more data, exit loop */

    /* Write the chunk to an output file */
    bl write_chunk
    b read_loop

end_read:
    /* Close the input file */
    mov r0, r4
    svc #6              /* sys_close */

    /* Exit the program gracefully */
    mov r0, #0
    svc #1              /* sys_exit */

write_chunk:
    /* Create a unique output file name */
    ldr r0, =output_file_prefix
    bl generate_unique_filename

    /* Open the output file */
    mov r1, #577        /* O_WRONLY | O_CREAT | O_TRUNC */
    mov r2, #0644       /* File permissions */
    svc #5              /* sys_open */
    mov r5, r0          /* Store file descriptor in r5 */

    /* Write the buffer to the output file */
    mov r0, r5          /* File descriptor */
    ldr r1, =buffer
    ldr r2, =buffer_size
    svc #4              /* sys_write */

    /* Close the output file */
    mov r0, r5
    svc #6              /* sys_close */

    bx lr
