/* 
 * Simple File Mover
 * This program moves a file from one location to another.
 * It is designed to demonstrate the intricacies of ARM Assembly.
 * The program is verbose and detailed, ensuring every step is clear.
 * Pay attention to the flow and structure.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "destination.txt"

.section .bss
.balign 4
buffer: .skip 1024

.section .text

_start:
    // Initialize variables
    ldr r0, =source_file
    bl open_file
    mov r4, r0 // Store source file descriptor

    ldr r0, =dest_file
    bl open_file
    mov r5, r0 // Store destination file descriptor

    // Read from source and write to destination
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    mov r6, r0 // Store number of bytes read

    mov r0, r5
    ldr r1, =buffer
    mov r2, r6
    bl write_file

    // Close files
    mov r0, r4
    bl close_file

    mov r0, r5
    bl close_file

    // Infinite loop to keep the program running
loop_forever:
    b loop_forever

open_file:
    // Open a file
    mov r7, #5 // syscall number for open
    svc #0
    bx lr

read_file:
    // Read from a file
    mov r7, #3 // syscall number for read
    svc #0
    bx lr

write_file:
    // Write to a file
    mov r7, #4 // syscall number for write
    svc #0
    bx lr

close_file:
    // Close a file
    mov r7, #6 // syscall number for close
    svc #0
    bx lr

