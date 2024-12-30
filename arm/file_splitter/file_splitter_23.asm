/* 
 * Welcome to the File Splitter program!
 * This delightful program is designed to take a file and split it into smaller pieces.
 * Imagine a beautiful cake being cut into slices, each piece ready to be savored.
 * Let's embark on this journey together, shall we?
 */

.section .data
filename: .asciz "inputfile.txt"
output_prefix: .asciz "output_"
buffer: .space 1024
file_size: .word 0
split_size: .word 256

.section .bss
.lcomm temp_buffer, 1024

.section .text
.global _start

_start:
    /* Open the input file with love and care */
    mov r0, #5
    ldr r1, =filename
    mov r2, #0
    svc #0
    mov r4, r0

    /* Get the size of the file, like measuring the length of a ribbon */
    mov r0, r4
    mov r1, #0
    mov r2, #2
    svc #0
    mov r0, r4
    mov r1, #0
    mov r2, #1
    svc #0
    mov r0, r4
    mov r1, #0
    mov r2, #0
    svc #0
    mov r5, r0

    /* Store the file size in a variable */
    str r5, file_size

    /* Calculate the number of splits needed, like dividing a treasure map */
    ldr r0, file_size
    ldr r1, split_size
    bl divide

    /* Loop through the file and create each split */
    mov r6, #0
split_loop:
    cmp r6, r0
    bge end_split

    /* Create a new file for each split */
    mov r0, #8
    ldr r1, =output_prefix
    bl create_filename
    mov r2, #577
    svc #0
    mov r7, r0

    /* Read from the input file and write to the split file */
    mov r0, r4
    ldr r1, =buffer
    ldr r2, split_size
    svc #0
    mov r0, r7
    ldr r1, =buffer
    svc #0

    /* Close the split file */
    mov r0, r7
    svc #0

    /* Increment the split counter */
    add r6, r6, #1
    b split_loop

end_split:
    /* Close the input file */