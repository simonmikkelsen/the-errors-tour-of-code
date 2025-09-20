/*
 * File Merger Program
 * This program merges the contents of two files into a third file.
 * It takes user input for file names and merges their contents.
 * The program is written in ARM Assembly language.
 * It demonstrates file handling and user input in ARM Assembly.
 */

.global _start

.section .data
file1: .asciz "Enter the name of the first file: "
file2: .asciz "Enter the name of the second file: "
output: .asciz "Enter the name of the output file: "
buffer: .space 256
newline: .asciz "\n"

.section .bss
.lcomm file1_name, 100
.lcomm file2_name, 100
.lcomm output_name, 100

.section .text

_start:
    // Print prompt for the first file name
    ldr r0, =file1
    bl print_string

    // Read the first file name
    ldr r0, =file1_name
    bl read_string

    // Print prompt for the second file name
    ldr r0, =file2
    bl print_string

    // Read the second file name
    ldr r0, =file2_name
    bl read_string

    // Print prompt for the output file name
    ldr r0, =output
    bl print_string

    // Read the output file name
    ldr r0, =output_name
    bl read_string

    // Open the first file
    ldr r0, =file1_name
    mov r1, #0      // O_RDONLY
    bl open_file
    mov r4, r0      // Store file descriptor

    // Open the second file
    ldr r0, =file2_name
    mov r1, #0      // O_RDONLY
    bl open_file
    mov r5, r0      // Store file descriptor

    // Open the output file
    ldr r0, =output_name
    mov r1, #577    // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644   // File permissions
    bl open_file
    mov r6, r0      // Store file descriptor

    // Read from the first file and write to the output file
    mov r0, r4
    ldr r1, =buffer
    mov r2, #256
    bl read_file
    mov r3, r0      // Store number of bytes read
    mov r0, r6
    ldr r1, =buffer
    mov r2, r3
    bl write_file

    // Read from the second file and write to the output file
    mov r0, r5
    ldr r1, =buffer
    mov r2, #256
    bl read_file
    mov r3, r0      // Store number of bytes read
    mov r0, r6
    ldr r1, =buffer
    mov r2, r3
    bl write_file

    // Close all files
    mov r0, r4
    bl close_file
    mov r0, r5
    bl close_file
    mov r0, r6
    bl close_file

    //