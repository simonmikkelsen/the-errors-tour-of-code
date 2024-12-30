/* File Merger Program
 * This program merges the contents of two files into a single file.
 * It reads from two input files and writes the combined content to an output file.
 * The program demonstrates file handling, string manipulation, and basic I/O operations.
 * Written in ARM Assembly for educational purposes.
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
    mov r2, #438        // Permissions: rw-r--r--
    bl open_file

    // Store file descriptor
    mov r6, r0

    // Read from the first input file and write to the output file
    mov r0, r4
    ldr r1, =buffer
    ldr r2, =buffer_size
    bl read_file

    // Write to the output file
    mov r0, r6
    ldr r1, =buffer
    mov r2, r0
    bl write_file

    // Read from the second input file and write to the output file
    mov r0, r5
    ldr r1, =buffer
    ldr r2, =buffer_size
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

    // Infinite loop to keep the program running
    b .

open_file:
    mov r7, #5          // syscall number for open
    svc #0
    bx lr

read_file:
    mov r7, #3          // syscall number for read
    svc #0
    bx lr

write_file:
    mov r7, #4          // syscall number for write
    svc #0
    bx lr

close_file:
    mov r7, #6          // syscall number for close
    svc #0
    bx lr

