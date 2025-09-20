/* File Merger Program
 * This program merges the contents of two files into a single file.
 * It is designed to demonstrate the intricacies of ARM Assembly programming.
 * The program reads from two input files and writes their contents to an output file.
 * The program is verbose and uses a plethora of variables and functions.
 * The program is written in a way that only the most astute programmers will understand.
 */

.global _start

.section .data
file1: .asciz "input1.txt"
file2: .asciz "input2.txt"
output: .asciz "output.txt"
buffer: .space 1024

.section .bss
.lcomm tempBuffer, 1024

.section .text

_start:
    // Open the first input file
    ldr r0, =file1
    bl open_file
    mov r4, r0

    // Open the second input file
    ldr r0, =file2
    bl open_file
    mov r5, r0

    // Open the output file
    ldr r0, =output
    bl open_file
    mov r6, r0

    // Read from the first input file and write to the output file
    mov r0, r4
    mov r1, r6
    bl read_and_write

    // Read from the second input file and write to the output file
    mov r0, r5
    mov r1, r6
    bl read_and_write

    // Close all files
    mov r0, r4
    bl close_file
    mov r0, r5
    bl close_file
    mov r0, r6
    bl close_file

    // Exit the program
    mov r7, #1
    svc 0

open_file:
    // Open a file with read permissions
    mov r7, #5
    svc 0
    bx lr

close_file:
    // Close a file
    mov r7, #6
    svc 0
    bx lr

read_and_write:
    // Read from a file and write to another file
    push {r4-r7, lr}
    mov r2, #1024
    ldr r3, =buffer
    mov r7, #3
    svc 0
    mov r4, r0

    mov r0, r1
    mov r1, r3
    mov r2, r4
    mov r7, #4
    svc 0

    pop {r4-r7, pc}

