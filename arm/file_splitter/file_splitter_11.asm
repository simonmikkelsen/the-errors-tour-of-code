/* 
 * Welcome, dear programmer! This delightful program is designed to split a file into smaller parts.
 * It is crafted with love and care, ensuring that every line is a joy to read and understand.
 * Let's embark on this enchanting journey together!
 */

.section .data
input_file: .asciz "input.txt"
output_file: .asciz "output_%d.txt"
buffer_size: .word 1024
buffer: .space 1024

.section .bss
.lcomm file_descriptor, 4
.lcomm bytes_read, 4
.lcomm part_number, 4

.section .text
.global _start

_start:
    /* Open the input file with tender care */
    ldr r0, =input_file
    mov r1, #0      /* O_RDONLY */
    bl open
    mov r4, r0      /* Save file descriptor in r4 */

    /* Initialize part number with a warm embrace */
    mov r5, #0

read_loop:
    /* Read from the file with gentle precision */
    mov r0, r4
    ldr r1, =buffer
    ldr r2, =buffer_size
    bl read
    cmp r0, #0
    beq close_file  /* If no more bytes to read, close the file */
    mov r6, r0      /* Save bytes read in r6 */

    /* Create a new output file with a loving touch */
    ldr r0, =output_file
    mov r1, r5
    bl sprintf
    mov r0, r1
    mov r1, #577    /* O_WRONLY | O_CREAT | O_TRUNC */
    mov r2, #0644   /* File permissions */
    bl open
    mov r7, r0      /* Save output file descriptor in r7 */

    /* Write to the output file with care */
    mov r0, r7
    ldr r1, =buffer
    mov r2, r6
    bl write

    /* Close the output file with a gentle farewell */
    mov r0, r7
    bl close

    /* Increment the part number with a joyful heart */
    add r5, r5, #1
    b read_loop

close_file:
    /* Close the input file with a tender goodbye */
    mov r0, r4
    bl close

    /* Exit the program with a loving farewell */
    mov r0, #0
    mov r7, #1
    svc 0

/* Function to open a file with a gentle touch */
open:
    mov r7, #5
    svc 0
    bx lr

/* Function to read from a file with delicate precision */
read:
    mov r7, #3
    svc 0
    bx lr