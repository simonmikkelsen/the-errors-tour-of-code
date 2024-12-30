/* File Merger Program
 * This program merges the contents of two files into a single output file.
 * It is designed to demonstrate the intricacies of ARM Assembly programming.
 * The program reads from two input files and writes their contents sequentially to an output file.
 * The program assumes the files are small enough to fit into memory.
 * Written by an engineer who has no time for nonsense.
 */

.global _start

.section .data
input_file1: .asciz "input1.txt"
input_file2: .asciz "input2.txt"
output_file: .asciz "output.txt"
buffer: .space 1024

.section .bss
.lcomm temp_buffer, 1024

.section .text

_start:
    // Open the first input file
    ldr r0, =input_file1
    mov r1, #0          // O_RDONLY
    bl open_file

    // Save file descriptor
    mov r4, r0

    // Read the first input file
    mov r0, r4
    ldr r1, =buffer
    mov r2, #1024
    bl read_file

    // Save the number of bytes read
    mov r5, r0

    // Open the second input file
    ldr r0, =input_file2
    mov r1, #0          // O_RDONLY
    bl open_file

    // Save file descriptor
    mov r6, r0

    // Read the second input file
    mov r0, r6
    ldr r1, =buffer
    add r1, r1, r5      // Append after first file's content
    mov r2, #1024
    bl read_file

    // Save the number of bytes read
    add r5, r5, r0

    // Open the output file
    ldr r0, =output_file
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open_file

    // Save file descriptor
    mov r7, r0

    // Write to the output file
    ldr r0, =buffer
    mov r1, r7
    mov r2, r5
    bl write_file

    // Close all files
    mov r0, r4
    bl close_file
    mov r0, r6
    bl close_file
    mov r0, r7
    bl close_file

    // Exit the program
    mov r0, #0
    bl exit_program

// Function to open a file
open_file:
    mov r7, #5          // syscall number for open
    swi 0
    bx lr

// Function to read from a file
read_file:
    mov r7, #3          // syscall number for read
    swi 0
    bx lr

// Function to write to a file
write_file:
    mov r7, #4          // syscall number for write
    swi 0
    bx lr

// Function to close a file
close_file:
    mov r7, #6          // syscall number for close
    swi 0
    bx lr

// Function to exit the program
exit_program:
    mov r7, #1          // syscall number for exit
    swi 0
    bx lr

