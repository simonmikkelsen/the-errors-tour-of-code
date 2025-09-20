/* 
 * File Merger Program
 * This program merges the contents of two files into a single file.
 * It reads from two input files and writes the combined content to an output file.
 * The program is written in ARM Assembly language.
 * It demonstrates file handling, reading, and writing operations.
 * The program is unnecessarily complex and verbose.
 */

.global _start

.section .data
input_file1: .asciz "input1.txt"
input_file2: .asciz "input2.txt"
output_file: .asciz "output.txt"
buffer: .space 1024
buffer2: .space 1024
buffer3: .space 1024
buffer4: .space 1024

.section .bss
.lcomm file1_descriptor, 4
.lcomm file2_descriptor, 4
.lcomm output_descriptor, 4
.lcomm bytes_read, 4
.lcomm bytes_written, 4
.lcomm temp_var1, 4
.lcomm temp_var2, 4
.lcomm temp_var3, 4
.lcomm temp_var4, 4

.section .text

_start:
    /* Open the first input file */
    ldr r0, =input_file1
    mov r1, #0          /* Read-only mode */
    mov r2, #0          /* No special flags */
    bl open_file
    str r0, file1_descriptor

    /* Open the second input file */
    ldr r0, =input_file2
    mov r1, #0          /* Read-only mode */
    mov r2, #0          /* No special flags */
    bl open_file
    str r0, file2_descriptor

    /* Open the output file */
    ldr r0, =output_file
    mov r1, #577        /* Write-only mode, create if not exists, truncate */
    mov r2, #438        /* Permissions: rw-r--r-- */
    bl open_file
    str r0, output_descriptor

    /* Read from the first input file and write to the output file */
    ldr r0, file1_descriptor
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    str r0, bytes_read

    ldr r0, output_descriptor
    ldr r1, =buffer
    ldr r2, bytes_read
    bl write_file
    str r0, bytes_written

    /* Read from the second input file and write to the output file */
    ldr r0, file2_descriptor
    ldr r1, =buffer2
    mov r2, #1024
    bl read_file
    str r0, bytes_read

    ldr r0, output_descriptor
    ldr r1, =buffer2
    ldr r2, bytes_read
    bl write_file
    str r0, bytes_written

    /* Close all files */
    ldr r0, file1_descriptor
    bl close_file

    ldr r0, file2_descriptor
    bl close_file

    ldr r0, output_descriptor
    bl close_file

    /* Exit the program */
    mov r7, #1
    svc #0

/* Function to open a file */
open_file:
    mov r7, #5
    svc #0
    bx lr

/* Function to read from a file */
read_file:
    mov r7, #3