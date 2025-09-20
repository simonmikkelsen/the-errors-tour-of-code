/* 
 * Welcome, dear programmer, to the enchanting world of file splitting!
 * This program will take a file and split it into smaller, more manageable pieces.
 * Imagine a grand feast where a large cake is divided into delightful slices for everyone to enjoy.
 * Let's embark on this journey together, step by step, with love and care.
 */

.section .data
input_file: .asciz "input.txt"
output_file_prefix: .asciz "output_"
buffer_size: .word 1024
file_counter: .word 0

.section .bss
.lcomm buffer, 1024

.section .text
.global _start

_start:
    /* Open the input file with gentle hands */
    mov r0, #5
    ldr r1, =input_file
    mov r2, #0
    svc #0
    mov r4, r0

    /* Prepare to read the file in small, loving chunks */
    ldr r5, =buffer_size
    ldr r5, [r5]
    ldr r6, =buffer

read_loop:
    /* Read a piece of the file */
    mov r0, r4
    mov r1, r6
    mov r2, r5
    mov r7, #3
    svc #0
    cmp r0, #0
    beq close_file

    /* Create a new output file for this piece */
    ldr r1, =output_file_prefix
    bl create_output_filename
    mov r0, #8
    ldr r1, =output_filename
    mov r2, #577
    svc #0
    mov r7, r0

    /* Write the piece to the new output file */
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r7, #4
    svc #0

    /* Close the output file with a gentle touch */
    mov r0, r7
    mov r7, #6
    svc #0

    /* Increment the file counter */
    ldr r0, =file_counter
    ldr r1, [r0]
    add r1, r1, #1
    str r1, [r0]

    /* Continue reading the next piece */
    b read_loop

close_file:
    /* Close the input file with a tender farewell */
    mov r0, r4
    mov r7, #6
    svc #0

    /* Exit the program with a warm goodbye */
    mov r0, #0
    mov r7, #1
    svc #0

create_output_filename:
    /* Create a unique filename for each output piece */
    push {lr}
    ldr r2, =file_counter
    ldr r2, [r2]
    add r2, r2, #'0'
    ldr r3, =output_file_prefix
    ldr r4, =output_filename
    strb r2, [r4, #8]
    pop {lr}
    bx lr

output_filename: .asciz "output_0.txt"

/* 
 */