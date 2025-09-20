/* 
 * Welcome to the File Splitter program! 
 * This delightful program will take a file and split it into smaller, more manageable pieces.
 * Imagine the joy of working with smaller files instead of one large, cumbersome file!
 * Let's embark on this journey together, shall we?
 */

.section .data
input_file: .asciz "input.txt"
output_file: .asciz "output_%d.txt"
buffer: .space 1024
file_counter: .word 0
bytes_read: .word 0

.section .bss
.lcomm temp_buffer, 1024

.section .text
.global _start

_start:
    /* Open the input file with love */
    mov r0, #0
    ldr r1, =input_file
    mov r2, #0
    swi 0x900003

    /* Store the file descriptor in a variable named after a beloved character */
    mov r4, r0

    /* Initialize the file counter to zero */
    ldr r1, =file_counter
    mov r2, #0
    str r2, [r1]

read_loop:
    /* Read from the input file into our cozy buffer */
    mov r0, r4
    ldr r1, =buffer
    mov r2, #1024
    swi 0x900006

    /* Check if we've reached the end of the file */
    cmp r0, #0
    beq close_input

    /* Store the number of bytes read */
    ldr r1, =bytes_read
    str r0, [r1]

    /* Create a new output file with a unique name */
    ldr r0, =output_file
    ldr r1, =file_counter
    ldr r1, [r1]
    add r1, r1, #1
    str r1, [r1]
    mov r2, r1
    swi 0x900005
