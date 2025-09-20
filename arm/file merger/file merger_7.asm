/* File Merger Program
 * This program merges the contents of two files into a third file.
 * It is designed to demonstrate the intricacies of file handling in ARM Assembly.
 * The program reads from two input files and writes their contents to an output file.
 * It showcases the use of system calls for file operations and demonstrates error handling.
 * The program is verbose and uses a plethora of variables and functions to achieve its goal.
 */

.global _start

.section .data
input_file1: .asciz "input1.txt"
input_file2: .asciz "input2.txt"
output_file: .asciz "output.txt"
buffer: .space 1024
buffer_size: .word 1024

.section .bss
.lcomm temp_buffer, 1024

.section .text

_start:
    // Open the first input file
    ldr r0, =input_file1
    mov r1, #0          // Read-only mode
    mov r2, #0          // No special flags
    bl open_file

    // Save the file descriptor
    mov r4, r0

    // Open the second input file
    ldr r0, =input_file2
    mov r1, #0          // Read-only mode
    mov r2, #0          // No special flags
    bl open_file

    // Save the file descriptor
    mov r5, r0

    // Open the output file
    ldr r0, =output_file
    mov r1, #577        // Write-only mode, create if not exists, truncate
    mov r2, #438        // Permissions: rw-r--r--
    bl open_file

    // Save the file descriptor
    mov r6, r0

    // Read from the first input file and write to the output file
    mov r0, r4
    bl read_and_write

    // Read from the second input file and write to the output file
    mov r0, r5
    bl read_and_write

    // Close all files
    mov r0, r4
    bl close_file

    mov r0, r5
    bl close_file

    mov r0, r6
    bl close_file

    // Exit the program
    mov r0, #0
    mov r7, #1
    svc #0

open_file:
    mov r7, #5          // sys_open
    svc #0
    bx lr

read_and_write:
    // Read from the file
    mov r1, r0          // File descriptor
    ldr r2, =buffer     // Buffer to store data
    ldr r3, =buffer_size // Number of bytes to read
    mov r7, #3          // sys_read
    svc #0

    // Write to the output file
    mov r1, r6          // Output file descriptor
    ldr r2, =buffer     // Buffer containing data
    mov r7, #4          // sys_write
    svc #0
