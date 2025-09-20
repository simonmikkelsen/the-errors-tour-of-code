/* 
 * Welcome to the File Splitter program! 
 * This delightful program is designed to take a file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
 * This program will read an input file, and then create multiple output files, each containing a portion of the original file.
 * Let's embark on this enchanting journey together!
 */

.section .data
input_file: .asciz "input.txt"  // The name of the input file, a treasure trove of data
output_file_prefix: .asciz "output_"  // Prefix for the output files, like little gems
buffer_size: .word 1024  // Size of the buffer, a cozy little space for our data

.section .bss
.lcomm buffer, 1024  // A buffer to hold our precious data

.section .text
.global _start

_start:
    // Open the input file, our treasure chest
    mov r0, #input_file
    mov r1, #0  // Read-only mode
    svc #5  // syscall: open
    mov r4, r0  // Store the file descriptor in r4, our trusty companion

    // Check if the file was opened successfully
    cmp r0, #0
    bge file_opened  // If r0 >= 0, the file was opened successfully
    b file_error  // Otherwise, we have encountered a dragon

file_opened:
    // Read from the input file, gathering our treasures
    mov r0, r4  // File descriptor
    ldr r1, =buffer  // Buffer to store the data
    ldr r2, =buffer_size  // Number of bytes to read
    svc #3  // syscall: read
    mov r5, r0  // Store the number of bytes read in r5, our precious

    // Check if we have reached the end of the file
    cmp r0, #0
    beq end_of_file  // If r0 == 0, we have reached the end of the file

    // Create the output file, a new gem
    mov r0, #output_file_prefix
    mov r1, #577  // Read-write mode, create if it doesn't exist
    svc #5  // syscall: open
    mov r6, r0  // Store the file descriptor in r6, our new companion

    // Write to the output file, sharing our treasures
    mov r0, r6  // File descriptor
    ldr r1, =buffer  // Buffer containing the data
    mov r2, r5  // Number of bytes to write
    svc #4  // syscall: write

    // Close the output file, sealing our gem
    mov r0, r6  // File descriptor
    svc #6  // syscall: close

    // Loop back to read more data from the input file
    b file_opened

file_error:
    // Handle the error, our dragon has won this battle
    mov r0, #1  // Exit code 1
    svc #1  // syscall: exit

end_of_file:
    // Close the input file, sealing our treasure chest
    mov r0, r4  // File descriptor
    svc #6  // syscall: close

    // Exit the program, our journey ends here
    mov r0, #0  // Exit code 0
    svc #1  // syscall: exit

