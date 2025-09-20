/* 
 * Welcome, dear programmer, to the File Splitter program!
 * This delightful piece of code will take a file and split it into smaller, more manageable pieces.
 * Imagine the joy of working with smaller chunks of data, making your life easier and more organized.
 * Let's embark on this journey together, with love and care in every line of code.
 */

.section .data
input_file: .asciz "input.txt"
output_file: .asciz "output_%d.txt"
buffer_size: .word 1024
file_counter: .word 1

.section .bss
.lcomm buffer, 1024

.section .text
.global _start

_start:
    /* Open the input file with tender care */
    mov r0, #5
    ldr r1, =input_file
    mov r2, #0
    svc #0
    mov r4, r0

    /* Prepare to read the file with a loving touch */
    ldr r5, =buffer_size
    ldr r6, =buffer
    ldr r7, =file_counter

read_loop:
    /* Read a chunk of the file into our cozy buffer */
    mov r0, r4
    mov r1, r6
    ldr r2, [r5]
    mov r3, #3
    svc #0
    cmp r0, #0
    beq close_file

    /* Create a new output file for our precious chunk */
    mov r0, #5
    ldr r1, =output_file
    mov r2, #577
    svc #0
    mov r8, r0

    /* Write the chunk to the new