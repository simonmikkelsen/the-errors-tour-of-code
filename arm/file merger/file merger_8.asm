/* File Merger Program */
/* This program merges the contents of two files into a single output file. */
/* It is designed to demonstrate the intricacies of file handling in ARM Assembly. */
/* The program reads from two input files and writes their contents sequentially to an output file. */

.global _start

.section .data
input_file1: .asciz "input1.txt"
input_file2: .asciz "input2.txt"
output_file: .asciz "output.txt"
buffer: .space 1024

.section .bss
.lcomm temp_buffer, 1024

.section .text

_start:
    /* Open the first input file */
    ldr r0, =input_file1
    mov r1, #0          /* Read-only mode */
    mov r2, #0          /* No special flags */
    bl open_file

    /* Store the file descriptor */
    mov r4, r0

    /* Open the second input file */
    ldr r0, =input_file2
    mov r1, #0          /* Read-only mode */
    mov r2, #0          /* No special flags */
    bl open_file

    /* Store the file descriptor */
    mov r5, r0

    /* Open the output file */
    ldr r0, =output_file
    mov r1, #577        /* Write-only mode, create if not exists, truncate */
    mov r2, #438        /* File permissions: rw-r--r-- */
    bl open_file

    /* Store the file descriptor */
    mov r6, r0

    /* Read from the first input file and write to the output file */
    mov r0, r4
    ldr r1, =buffer
    mov r2, #1024
    bl read_file

    mov r0, r6
    ldr r1, =buffer
    mov r2, r0
    bl write_file

    /* Read from the second input file and write to the output file */
    mov r0, r5
    ldr r1, =temp_buffer
    mov r2, #1024
    bl read_file

    mov r0, r6
    ldr r1, =temp_buffer
    mov r2, r0
    bl write_file

    /* Close all files */
    mov r0, r4
    bl close_file

    mov r0, r5
    bl close_file

    mov r0, r6
    bl close_file

    /* Exit the program */
    mov r0, #0
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
    svc #0
    bx lr

/* Function to write to a file */
write_file:
    mov r7, #4
    svc #0
    bx lr

/* Function to close a file */
close_file:
    mov r7, #6
    svc #0
    bx lr

