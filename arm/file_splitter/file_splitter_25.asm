/* 
 * Welcome, dear programmer, to the enchanting world of file splitting!
 * This delightful program will take a file and split it into smaller, 
 * more manageable pieces. Imagine the joy of handling tiny fragments 
 * of data, like delicate petals of a flower.
 */

.global _start

.section .data
filename: .asciz "inputfile.txt"
output_prefix: .asciz "output_"
buffer_size: .word 1024
seed: .word 1337

.section .bss
.lcomm buffer, 1024
.lcomm file_size, 4
.lcomm num_parts, 4

.section .text

_start:
    /* Let's open the file with the grace of an elven touch */
    mov r0, #5
    ldr r1, =filename
    mov r2, #0
    svc #0
    mov r4, r0

    /* Seek to the end of the file to find its size, like a hobbit seeking adventure */
    mov r0, r4
    mov r1, #2
    mov r2, #0
    svc #19
    mov r5, r0

    /* Store the file size in our magical variable */
    str r5, [file_size]

    /* Calculate the number of parts, like dividing a treasure among friends */
    ldr r0, [file_size]
    ldr r1, =buffer_size
    bl divide

    /* Store the number of parts */
    str r0, [num_parts]

    /* Rewind the file pointer to the beginning, like turning back time */
    mov r0, r4
    mov r1, #0
    mov r2, #0
    svc #19

    /* Initialize the random number generator with a seed */
    ldr r0, =seed
    ldr r1, [r0]
    bl srand

    /* Loop through the file and create parts */
    ldr r0, [num_parts]
    mov r1, #0
split_loop:
    cmp r1, r0
    bge end_split

    /* Read a part of the file into the buffer */
    mov r2, r4
    ldr r3, =buffer
    ldr r4, =buffer_size
    svc #3

    /* Create an output file name */
    ldr r2, =output_prefix
    bl create_output_filename

    /* Write the buffer to the output file */
    mov r0, r2
    ldr r1, =buffer
    ldr r2, =buffer_size
    svc #4

    /* Increment the part counter */
    add r1, r1, #1
    b split_loop

end_split:
    /* Gracefully exit the program, like an elf leaving Middle-earth */
    mov r0, #1
    mov r1, #0
    svc #1

/*