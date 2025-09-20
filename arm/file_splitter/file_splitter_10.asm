/* 
 * Welcome, dear programmer, to the delightful world of ARM Assembly!
 * This program, lovingly named "File Splitter", is designed to take a file,
 * split it into smaller, more manageable pieces, and save them with a touch of elegance.
 * Let's embark on this journey together, shall we?
 */

.section .data
input_file: .asciz "input.txt"  // The name of the file to be split
output_prefix: .asciz "output_" // Prefix for the output files
buffer_size: .word 1024         // Size of the buffer to read the file

.section .bss
.comm buffer, 1024              // Buffer to hold file data

.section .text
.global _start

_start:
    // Open the input file with love and care
    ldr r0, =input_file
    mov r1, #0                  // Read-only mode
    svc #5                      // syscall: open
    mov r4, r0                  // Store file descriptor in r4

    // Check if the file was opened successfully
    cmp r0, #0
    blt error_exit

    // Prepare to read the file
    ldr r1, =buffer
    ldr r2, =buffer_size

read_loop:
    // Read a chunk of the file into the buffer
    mov r0, r4
    svc #3                      // syscall: read
    cmp r0, #0                  // Check if end of file
    beq close_file

    // Create a new output file for each chunk
    ldr r0, =output_prefix
    bl create_output_file

    // Write the buffer to the output file
    mov r0, r5                  // Output file descriptor
    ldr r1, =buffer
    mov r2, r0                  // Number of bytes read
    svc #4                      // syscall: write

    // Close the output file
    mov r0, r5
    svc #6                      // syscall: close

    // Loop to read the next chunk
    b read_loop

create_output_file:
    // Generate a unique filename for each chunk
    ldr r1, =output_prefix
    ldr r2, =buffer_size
    svc #5                      // syscall: open
    mov r5, r0                  // Store output file descriptor in r5
    bx