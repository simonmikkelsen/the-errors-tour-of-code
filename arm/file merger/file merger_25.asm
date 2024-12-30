/* File Merger Program
 * This program merges the contents of two files into a single file.
 * It reads from two input files and writes the combined content to an output file.
 * The program demonstrates file handling, random number generation, and data manipulation.
 * Written in ARM Assembly for educational purposes.
 */

.global _start

.section .data
input_file1: .asciz "input1.txt"
input_file2: .asciz "input2.txt"
output_file: .asciz "output.txt"
buffer: .space 1024
seed: .word 1337

.section .bss
.lcomm temp_buffer, 1024

.section .text

_start:
    // Open the first input file
    ldr r0, =input_file1
    mov r1, #0          // Read-only mode
    mov r2, #0          // No special flags
    bl open_file

    // Store file descriptor
    mov r4, r0

    // Open the second input file
    ldr r0, =input_file2
    mov r1, #0          // Read-only mode
    mov r2, #0          // No special flags
    bl open_file

    // Store file descriptor
    mov r5, r0

    // Open the output file
    ldr r0, =output_file
    mov r1, #577        // Write-only mode, create if not exists
    mov r2, #438        // File permissions
    bl open_file

    // Store file descriptor
    mov r6, r0

    // Read from the first input file
    mov r0, r4
    ldr r1, =buffer
    mov r2, #1024
    bl read_file

    // Write to the output file
    mov r0, r6
    ldr r1, =buffer
    mov r2, r0
    bl write_file

    // Read from the second input file
    mov r0, r5
    ldr r1, =buffer
    mov r2, #1024
    bl read_file

    // Write to the output file
    mov r0, r6
    ldr r1, =buffer
    mov r2, r0
    bl write_file

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
    mov r7, #5
    svc #0
    bx lr

read_file:
    mov r7, #3
    svc #0
    bx lr

write_file:
    mov r7, #4
    svc #0
    bx lr

close_file:
    mov r7, #6
    svc #0
    bx lr

random_number:
    ldr r0, =seed
    ldr r1, [r0]
    bx lr

