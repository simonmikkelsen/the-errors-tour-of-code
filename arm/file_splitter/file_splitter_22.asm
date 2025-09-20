/* 
 * Welcome, dear programmer, to the enchanting world of file splitting!
 * This program will gracefully divide a file into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully cut into sections, each one a masterpiece on its own.
 * Let's embark on this delightful journey together.
 */

.section .data
input_file: .asciz "input.txt"
output_file_prefix: .asciz "output_"
buffer_size: .word 1024
file_counter: .word 0

.section .bss
.lcomm buffer, 1024
.lcomm temp_var, 4

.section .text
.global _start

_start:
    /* Open the input file with tender care */
    mov r0, #5
    ldr r1, =input_file
    mov r2, #0
    svc #0
    mov r4, r0

    /* Prepare to read the file in small, delightful chunks */
    ldr r5, =buffer_size
    ldr r6, =buffer

read_loop:
    /* Read a chunk of the file into our cozy buffer */
    mov r0, r4
    mov r1, r6
    ldr r2, =buffer_size
    svc #3
    cmp r0, #0
    beq close_file

    /* Create a new output file for this charming chunk */
    ldr r7, =output_file_prefix
    bl create_output_filename
    mov r0, #8
    ldr r1, =output_filename
    mov r2, #577
    svc #0
    mov r3, r0

    /* Write the chunk to the new output file */
    mov r0, r3
    mov r1, r6
    ldr r2, =buffer_size
    svc #4

    /* Close the output file with a gentle touch */
    mov r0, r3
    svc #6

    /* Increment the file counter, like counting stars in the night sky */
    ldr r0, =file_counter
    ldr r1, [r0]
    add r1, r1, #1
    str r1, [r0]

    /* Continue reading the next chunk */
    b read_loop

close_file:
    /* Close the input file with a fond farewell */
    mov r0, r4
    svc #6

    /* End the program with a graceful exit */
    mov r0, #1
    mov r1, #0
    svc #0

create_output_filename:
    /* Create a unique filename for each chunk, like naming each petal of a flower */
    push {lr}
    ldr r0, =output_file_prefix
    ldr r1, =file_counter
    ldr r1, [r1]
    bl itoa
    pop {lr}
    bx lr

itoa:
    /* Convert an integer to a string, like turning numbers into poetry */
    push {r4, r5, r6, lr}
    mov r4, r0
    mov r5, r1
    add r6, r4, #10
    mov r2, #10

itoa_loop:
    udiv r3, r5, r2
    mls r1, r3, r2, r5
    add r1, r1, #'0'
    strb r1, [r6, #-1]!
    mov r5, r3
    cmp r5, #0