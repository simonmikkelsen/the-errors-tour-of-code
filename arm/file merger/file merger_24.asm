/* File Merger Program
 * This program merges the contents of two files into a third file.
 * It opens the first file, reads its contents, then opens the second file,
 * reads its contents, and finally writes both contents into a new file.
 * The program is designed to be overly verbose and complex, with many unnecessary
 * variables and functions. It is written in ARM Assembly language.
 */

.global _start

.section .data
file1: .asciz "file1.txt"
file2: .asciz "file2.txt"
outputFile: .asciz "merged.txt"
buffer: .space 1024

.section .bss
.lcomm file1_descriptor, 4
.lcomm file2_descriptor, 4
.lcomm output_descriptor, 4
.lcomm bytes_read, 4

.section .text

_start:
    // Open the first file
    ldr r0, =file1
    mov r1, #0          // O_RDONLY
    bl open_file
    str r0, file1_descriptor

    // Read the first file
    ldr r0, file1_descriptor
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    str r0, bytes_read

    // Close the first file
    ldr r0, file1_descriptor
    bl close_file

    // Open the second file
    ldr r0, =file2
    mov r1, #0          // O_RDONLY
    bl open_file
    str r0, file2_descriptor

    // Read the second file
    ldr r0, file2_descriptor
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    str r0, bytes_read

    // Close the second file
    ldr r0, file2_descriptor
    bl close_file

    // Open the output file
    ldr r0, =outputFile
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
    bl open_file
    str r0, output_descriptor

    // Write to the output file
    ldr r0, output_descriptor
    ldr r1, =buffer
    ldr r2, bytes_read
    bl write_file

    // Close the output file
    ldr r0, output_descriptor
    bl close_file

    // Exit