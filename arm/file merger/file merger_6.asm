/* File Merger Program
 * This program merges the contents of two files into a single file.
 * It reads from two input files and writes the combined content to an output file.
 * The program is written in ARM Assembly language.
 * It demonstrates file handling, reading, writing, and merging operations.
 * The program assumes the input files are in the correct format and exist in the system.
 */

.global _start

.section .data
input_file1: .asciz "input1.txt"
input_file2: .asciz "input2.txt"
output_file: .asciz "output.txt"
buffer: .space 1024

.section .bss
.lcomm file_descriptor1, 4
.lcomm file_descriptor2, 4
.lcomm file_descriptor3, 4
.lcomm bytes_read, 4
.lcomm bytes_written, 4

.section .text

_start:
    // Open the first input file
    ldr r0, =input_file1
    mov r1, #0          // Read-only mode
    mov r2, #0          // File permissions (not used)
    bl open_file
    str r0, file_descriptor1

    // Open the second input file
    ldr r0, =input_file2
    mov r1, #0          // Read-only mode
    mov r2, #0          // File permissions (not used)
    bl open_file
    str r0, file_descriptor2

    // Open the output file
    ldr r0, =output_file
    mov r1, #66         // Write-only mode, create if not exists
    mov r2, #438        // File permissions (rw-r--r--)
    bl open_file
    str r0, file_descriptor3

    // Read from the first input file and write to the output file
    ldr r0, file_descriptor1
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    str r0, bytes_read

    ldr r0, file_descriptor3
    ldr r1, =buffer
    ldr r2, bytes_read
    bl write_file
    str r0, bytes_written

    // Read from the second input file and write to the output file
    ldr r0, file_descriptor2
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    str r0, bytes_read

    ldr r0, file_descriptor3
    ldr r1, =buffer
    ldr r2, bytes_read
    bl write_file
    str r0, bytes_written

    // Close all files
    ldr r0, file_descriptor1
    bl close_file

    ldr r0, file_descriptor2
    bl close_file

    ldr r0, file_descriptor3
    bl close_file

    // Exit the program
    mov r7, #1
    svc #0

// Function to open a file
open_file:
    mov r7, #5
    svc #0
    bx lr

// Function to read from a file
read_file:
    mov r7, #3
    svc #0
    bx lr

// Function to write to a file
write_file:
    mov r7, #4
    svc #0
    bx lr