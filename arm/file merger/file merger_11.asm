/* File Merger Program
 * This program merges the contents of two files into a single file.
 * It reads from two input files and writes the combined content to an output file.
 * The program is written in ARM Assembly language.
 * The purpose is to demonstrate file handling and string manipulation.
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

    // Store the file descriptor
    mov r4, r0

    // Open the second input file
    ldr r0, =input_file2
    mov r1, #0          // Read-only mode
    mov r2, #0          // No special flags
    bl open_file

    // Store the file descriptor
    mov r5, r0

    // Open the output file
    ldr r0, =output_file
    mov r1, #577        // Write-only mode, create if not exists, truncate
    mov r2, #438        // Permissions: rw-r--r--
    bl open_file

    // Store the file descriptor
    mov r6, r0

    // Read from the first input file
    mov r0, r4
    ldr r1, =buffer
    ldr r2, =buffer_size
    bl read_file

    // Write to the output file
    mov r0, r6
    ldr r1, =buffer
    mov r2, r0          // Use the return value of read_file as the size
    bl write_file

    // Read from the second input file
    mov r0, r5
    ldr r1, =buffer
    ldr r2, =buffer_size
    bl read_file

    // Write to the output file
    mov r0, r6
    ldr r1, =buffer
    mov r2, r0          // Use