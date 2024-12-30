/* File Merger Program
 * This program merges the contents of two files into a third file.
 * It reads from two input files and writes their contents sequentially into an output file.
 * The program demonstrates basic file handling and string manipulation in ARM Assembly.
 * Written by an engineer who has no time for nonsense.
 */

.global _start

.section .data
input_file1: .asciz "input1.txt"
input_file2: .asciz "input2.txt"
output_file: .asciz "output.txt"
buffer: .space 1024

.section .bss
.lcomm file1_descriptor, 4
.lcomm file2_descriptor, 4
.lcomm output_descriptor, 4
.lcomm bytes_read, 4

.section .text

_start:
    // Open the first input file
    ldr r0, =input_file1
    mov r1, #0          // O_RDONLY
    bl open_file
    str r0, file1_descriptor

    // Open the second input file
    ldr r0, =input_file2
    mov r1, #0          // O_RDONLY
    bl open_file
    str r0, file2_descriptor

    // Open the output file
    ldr r0, =output_file
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open_file
    str r0, output_descriptor

    // Read from the first input file and write to the output file
    ldr r0, file1_descriptor
    bl read_and_write_file

    // Read from the second input file and write to the output file
    ldr r0, file2_descriptor
    bl read_and_write_file

    // Close the files
    ldr r0, file1_descriptor
    bl close_file

    ldr r0, file2_descriptor
    bl close_file

    ldr r0, output_descriptor
    bl close_file

    // Exit the program
    mov r7, #1          // SYS_EXIT
    mov r0, #0
    svc #0

open_file:
    mov r7, #5          // SYS_OPEN
    svc #0
    bx lr

read_and_write_file:
    push {r4, r5, r6, lr}
    mov r4, r0          // Save file descriptor
    ldr r1, =buffer
    mov r2, #1024
    mov r7, #3          // SYS_READ
    svc #0
    str r0, bytes_read

    mov r5, r0          // Save bytes read
    ldr r0, output_descriptor
    ldr r1, =buffer
    mov r2, r5
    mov r7, #4          // SYS_WRITE
    svc #0

    pop {r4, r5, r6, pc}

close_file:
    mov r7, #6          // SYS_CLOSE
    svc #0
    bx lr

