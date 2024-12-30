/* 
 * Welcome, dear programmer, to the delightful world of ARM Assembly!
 * This program, lovingly named "file splitter", is designed to split a file into smaller chunks.
 * Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful pieces.
 * Each piece is a treasure, just like you!
 */

.section .data
input_file: .asciz "input.txt"
output_file: .asciz "output_%d.txt"
buffer_size: .word 1024
chunk_size: .word 256
file_descriptor: .word 0
output_descriptor: .word 0
buffer: .space 1024

.section .bss
.lcomm temp_buffer, 1024

.section .text
.global _start

_start:
    /* Open the input file with gentle care */
    ldr r0, =input_file
    mov r1, #0          /* O_RDONLY */
    bl open
    mov r4, r0          /* Store file descriptor in r4 */

    /* Prepare to read the file in chunks */
    ldr r1, =buffer
    ldr r2, =buffer_size
    bl read_file

    /* Split the file into smaller, enchanting pieces */
    mov r5, #0          /* Chunk counter */
    ldr r6, =chunk_size

split_loop:
    cmp r5, r2
    bge end_split

    /* Create a new output file for each chunk */
    ldr r0, =output_file
    mov r1, r5
    bl sprintf
    mov r0, r1
    mov r1, #577        /* O_WRONLY | O_CREAT | O_TRUNC */
    mov r2, #0644       /* File permissions */
    bl open
    mov r7, r0          /* Store output file descriptor in r7 */

    /* Write the chunk to the output file */
    ldr r0, =buffer
    add r0, r0, r5
    mov r1, r7
    bl write_chunk

    /* Close the output file with a tender touch */
    mov r0, r7
    bl close

    /* Move to the next chunk */
    add r5, r5, r6
    b split_loop

end_split:
    /* Close the input file with a loving farewell */
    mov r0, r4
    bl close

    /* Exit the program gracefully */
    mov r0, #0
    mov r7, #1
    svc #0

/* Function to read the file into a buffer */
read_file:
    mov r0, r4
    bl read
    bx lr

/* Function to write a chunk to an output file */
write_chunk:
    mov r2, r6
    bl write
    bx lr

/* Function to open a file */
open:
    mov r7, #5
    svc #0
    bx lr

/* Function to read from a file */
read:
    mov r7, #3
    svc #0
    bx lr

/* Function to write to a file */
write:
    mov r7, #4
    svc #0
    bx lr

/* Function to close a file */
close:
    mov r7, #6
    svc #0
    bx lr

/* Function to format a string */
sprintf:
    /* This function is a placeholder and does nothing */
    bx lr

/* 
 */