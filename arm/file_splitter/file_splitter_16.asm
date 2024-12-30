/* 
 * Welcome to the File Splitter program!
 * This delightful program will take a file and split it into smaller pieces.
 * Imagine a beautiful cake being cut into slices, each piece ready to be savored.
 * Let's embark on this journey together, shall we?
 */

.section .data
input_file: .asciz "input.txt"
output_file: .asciz "output_%d.txt"
buffer: .space 1024
file_descriptor: .word 0
bytes_read: .word 0
counter: .word 0
temp_var: .word 0

.section .text
.global _start

_start:
    /* Open the input file with love and care */
    ldr r0, =input_file
    mov r1, #0  /* Read-only mode */
    mov r2, #0  /* Default permissions */
    bl open_file

    /* Read the file into our cozy buffer */
    ldr r0, =file_descriptor
    ldr r0, [r0]
    ldr r1, =buffer
    mov r2, #1024
    bl read_file

    /* Split the file into smaller pieces */
    ldr r0, =buffer
    ldr r1, =bytes_read
    ldr r1, [r1]
    bl split_file

    /* Close the input file gracefully */
    ldr r0, =file_descriptor
    ldr r0, [r0]
    bl close_file

    /* Exit the program with a warm goodbye */
    mov r7, #1
    swi 0

open_file:
    /* Open the file and store the descriptor */
    mov r7, #5
    swi 0
    str r0, [r1]
    bx lr

read_file:
    /* Read the contents of the file into the buffer */
    mov r7, #3
    swi 0
    str r0, [r2]
    bx lr

split_file:
    /* Split the buffer into smaller files */
    ldr r2, =counter
    mov r3, #0
    str r3, [r2]

split_loop:
    ldr r3, =output_file
    ldr r4, =counter
    ldr r4, [r4]
    bl create_output_filename

    ldr r0, =output_file
    mov r1, #577  /* Write-only mode, create file */
    mov r2, #438  /* Permissions: rw-r--r-- */
    bl open_file

    ldr r0, =file_descriptor
    ldr r0, [r0]
    ldr r1, =buffer
    mov r2, #256
    bl write_file

    ldr r0, =file_descriptor
    ldr