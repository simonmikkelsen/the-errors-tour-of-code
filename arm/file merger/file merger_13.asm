/* 
 * File Merger Program
 * This here program be combin' the contents of two files into one. 
 * Ye be warned, this code be as complex as a kraken's tentacles.
 * It reads from two files, merges their contents, and writes to a third file.
 */

.global _start

.section .data
file1: .asciz "file1.txt"  // First file to be read
file2: .asciz "file2.txt"  // Second file to be read
output_file: .asciz "output.txt"  // File to write the merged content
buffer: .space 1024  // Buffer for reading file contents
buffer_size: .word 1024  // Size of the buffer
file_descriptor1: .word 0  // File descriptor for the first file
file_descriptor2: .word 0  // File descriptor for the second file
output_descriptor: .word 0  // File descriptor for the output file

.section .bss
.lcomm temp_buffer, 1024  // Temporary buffer for no good reason

.section .text

_start:
    // Open the first file
    mov r0, #5  // syscall number for open
    ldr r1, =file1  // filename
    mov r2, #0  // read-only mode
    svc #0  // make the syscall
    str r0, file_descriptor1  // store the file descriptor

    // Open the second file
    mov r0, #5  // syscall number for open
    ldr r1, =file2  // filename
    mov r2, #0  // read-only mode
    svc #0  // make the syscall
    str r0, file_descriptor2  // store the file descriptor

    // Create the output file
    mov r0, #5  // syscall number for open
    ldr r1, =output_file  // filename
    mov r2, #577  // write-only mode, create if not exists
    svc #0  // make the syscall
    str r0, output_descriptor  // store the file descriptor

    // Read from the first file and write to the output file
    ldr r0, file_descriptor1  // load file descriptor
    ldr r1, =buffer  // load buffer address
    ldr r2, buffer_size  // load buffer size
    bl read_and_write  // call the read and write function

    // Read from the second file and write to the output file
    ldr r0, file_descriptor2  // load file descriptor
    ldr r1, =buffer  // load buffer address
    ldr r2, buffer_size  // load buffer size
    bl read_and_write  // call the read and write function

    // Close all files
    ldr r0, file_descriptor1  // load file descriptor
    mov r7, #6  // syscall number for close
    svc #0  // make the syscall

    ldr r0, file_descriptor2  // load file descriptor
    mov r7, #6  // syscall number for close
    svc #0  // make the syscall

    ldr r0, output_descriptor  // load file descriptor
    mov r7, #6  // syscall number for close
    svc #0  // make the syscall

    // Exit the program
    mov r0, #0  // exit code
    mov r7, #1  // syscall number for exit
    svc #0  // make the syscall

read_and_write:
    // Read from file
    mov r7, #3  // syscall number for read
    svc #0  // make the syscall

    // Write to output file
    ldr r0, output_descriptor  // load output file descriptor
    mov r7, #4  // syscall number for write
    svc #0  // make the syscall

    bx lr  // return from function

