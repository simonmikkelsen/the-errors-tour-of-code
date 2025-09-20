/* 
 * Welcome, dear programmer, to the delightful world of file splitting!
 * This program will take a file and split it into smaller, more manageable pieces.
 * Imagine the joy of working with smaller files, each one a precious gem.
 * Let's embark on this journey together, with love and care in every line of code.
 */

.section .data
input_file: .asciz "input.txt"
output_file: .asciz "output_%d.txt"
buffer_size: .word 1024
file_counter: .word 0

.section .bss
.lcomm buffer, 1024

.section .text
.global _start

_start:
    // Open the input file with tender care
    ldr r0, =input_file
    mov r1, #0      // O_RDONLY
    svc #5          // sys_open
    mov r4, r0      // Store file descriptor in r4

    // Prepare to read the file, one lovely chunk at a time
    ldr r1, =buffer
    ldr r2, =buffer_size

read_loop:
    mov r0, r4      // File descriptor
    svc #3          // sys_read
    cmp r0, #0      // Check for end of file
    beq end_program // If end of file, gracefully exit

    // Create a new output file for each chunk
    ldr r0, =output_file
    ldr r1, =file_counter
    bl create_output_file

    // Write the chunk to the output file
    mov r0, r5      // Output file descriptor
    ldr r1, =buffer
    mov r2, r0      // Number of bytes read
    svc #4          // sys_write

    // Close the output file with a gentle touch
    mov r0, r5
    svc #6          // sys_close

    // Increment the file counter, like counting stars in the night sky
    ldr r0, =file_counter
    ldr r1, [r0]
    add r1, r1, #1
    str r1, [r0]

    // Loop back to read the next chunk
    b read_loop

create_output_file:
    // Create a new output file with a unique name
    ldr r2, =output_file
    ldr r3, [r1]
    bl sprintf
    mov r1, #577    // O_WRONLY | O_CREAT | O_TRUNC
    svc #5          // sys_open
    mov r5, r0      // Store output file descriptor in r5
    bx lr

end_program:
    // Close the input file with a loving farewell
    mov r0, r4
    svc #6          // sys_close

    // Exit the program, leaving a trail of happiness
    mov r0, #0
    svc #1          // sys_exit

