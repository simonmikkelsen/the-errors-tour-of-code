/* 
 * Welcome, dear programmer! This delightful program is a file splitter, 
 * designed to take a large file and split it into smaller, more manageable pieces.
 * Imagine it as a magical process where a grand tome is divided into charming little booklets.
 * Let's embark on this enchanting journey together!
 */

.section .data
input_file: .asciz "input.txt"
output_file_prefix: .asciz "output_"
buffer_size: .word 1024
file_counter: .word 0

.section .bss
.lcomm buffer, 1024
.lcomm file_descriptor, 4
.lcomm bytes_read, 4

.section .text
.global _start

_start:
    /* Open the input file with love and care */
    mov r0, #5
    ldr r1, =input_file
    mov r2, #0
    svc #0
    mov r4, r0

    /* Prepare to read the file in a loop, like a gentle breeze */
read_loop:
    ldr r0, =buffer
    ldr r1, =buffer_size
    mov r2, r1
    mov r1, r4
    mov r7, #3
    svc #0
    mov r5, r0

    /* Check if we have reached the end of our lovely file */
    cmp r5, #0
    beq end_program

    /* Create a new output file for our charming pieces */
    ldr r0, =output_file_prefix
    ldr r1, =file_counter
    bl create_output_file
    mov r6, r0

    /* Write the enchanting buffer to the new file */
    ldr r0, =buffer
    mov r1, r6
    ldr r2, =buffer_size
    mov r7, #4
    svc #0

    /* Close the output file with a gentle touch */
    mov r0, r6
    mov r7,