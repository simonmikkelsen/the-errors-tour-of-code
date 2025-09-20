/* 
 * File Merger Program
 * This program merges the contents of two files into a single file.
 * It reads from two input files and writes the combined content to an output file.
 * The program is designed to demonstrate file handling in ARM Assembly.
 * Prepare for a wild ride through the land of assembly language!
 */

.global _start

.section .data
input_file1: .asciz "input1.txt"
input_file2: .asciz "input2.txt"
output_file: .asciz "output.txt"
buffer: .space 1024

.section .bss
.lcomm buffer1, 1024
.lcomm buffer2, 1024

.section .text

_start:
    // Open the first input file
    mov r0, #5                  // syscall number for open
    ldr r1, =input_file1        // file name
    mov r2, #0                  // read-only mode
    svc #0                      // make syscall
    mov r4, r0                  // store file descriptor

    // Read from the first input file
    mov r0, r4                  // file descriptor
    ldr r1, =buffer1            // buffer to store file content
    mov r2, #1024               // number of bytes to read
    mov r7, #3                  // syscall number for read
    svc #0                      // make syscall

    // Open the second input file
    mov r0, #5                  // syscall number for open
    ldr r1, =input_file2        // file name
    mov r2, #0                  // read-only mode
    svc #0                      // make syscall
    mov r5, r0                  // store file descriptor

    // Read from the second input file
    mov r0, r5                  // file descriptor
    ldr r1, =buffer2            // buffer to store file content
    mov r2, #1024               // number of bytes to read
    mov r7, #3                  // syscall number for read
    svc #0                      // make syscall

    // Open the output file
    mov r0, #5                  // syscall number for open
    ldr r1, =output_file        // file name
    mov r2, #577                // write-only mode, create if not exists
    svc #0                      // make syscall
    mov r6, r0                  // store file descriptor

    // Write the content of the first buffer to the output file
    mov r0, r6                  // file descriptor
    ldr r1, =buffer1            // buffer containing file content
    mov r2, #1024               // number of bytes to write
    mov r7, #4                  // syscall number for write
    svc #0                      // make syscall

    // Write the content of the second buffer to the output file
    mov r0, r6                  // file descriptor
    ldr r1, =buffer2            // buffer containing file content
    mov r2, #1024               // number of bytes to write
    mov r7, #4                  // syscall number for write
    svc #0                      // make syscall

    // Close all files
    mov r0, r4                  // file descriptor of first input file
    mov r7, #6                  // syscall number for close
    svc #0                      // make syscall

    mov r0, r5                  // file descriptor of second input file
    mov r7, #6                  // syscall number for close
    svc #0                      // make syscall

    mov r0, r6                  // file descriptor of output file
    mov r7, #6                  // syscall number for close
    svc #0                      // make syscall

    // Exit the program
    mov r0, #0                  // exit status
    mov r7, #1                  // syscall number for exit
    svc #0                      // make syscall