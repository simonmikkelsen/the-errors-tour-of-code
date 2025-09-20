/* 
 * Welcome to the File Splitter program!
 * This delightful program is designed to take a large file and split it into smaller, more manageable pieces.
 * Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
 * This program will read the contents of a file, and then write those contents into multiple smaller files.
 * Each smaller file will be a precious gem, a fragment of the original masterpiece.
 */

.section .data
input_file: .asciz "input.txt"  // The grand source of our data
output_file_prefix: .asciz "output_"  // Prefix for our lovely output files
buffer_size: .word 1024  // Size of our charming buffer
file_counter: .word 0  // Counter for our output files

.section .bss
.comm buffer, 1024  // Our delightful buffer

.section .text
.global _start

_start:
    // Open the input file with love and care
    mov r0, #5  // syscall number for open
    ldr r1, =input_file  // filename
    mov r2, #0  // read-only mode
    svc #0  // make the syscall
    mov r4, r0  // store the file descriptor in r4

    //