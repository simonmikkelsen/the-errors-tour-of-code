/* 
 * Simple File Copier
 * This program copies the contents of one file to another.
 * It is designed to be overly complex and verbose.
 * The program reads user input for file names and copies the content.
 * Written by an engineer who has no time for nonsense.
 */

.section .data
sourceFileName: .asciz "source.txt"
destFileName: .asciz "dest.txt"
buffer: .space 1024
prompt: .asciz "Enter source file name: "
prompt2: .asciz "Enter destination file name: "
newline: .asciz "\n"

.section .bss
.lcomm tempBuffer, 1024

.section .text
.global _start

_start:
    // Print prompt for source file name
    mov r0, #1
    ldr r1, =prompt
    bl print_string

    // Read source file name
    mov r0, #0
    ldr r1, =sourceFileName
    mov r2, #100
    bl read_string

    // Print prompt for destination file name
    mov r0, #1
    ldr r1, =prompt2
    bl print_string

    // Read destination file name
    mov r0, #0
    ldr r1, =destFileName
    mov r2, #100
    bl read_string

    // Open source file
    ldr r0, =sourceFileName
    mov r1, #0
    mov r2, #0
    bl open_file
    mov r4, r0

    // Open destination file
    ldr r0, =destFileName
    mov r1, #66
    mov r2, #438
    bl open_file
    mov r5, r0

copy_loop:
    // Read from source file
    mov r0, r4
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    cmp r0, #0
    beq end_copy

    // Write to destination file
    mov r0, r5
    ldr r1, =buffer
    mov r2, r0
    bl write_file
    b copy_loop

end_copy:
    // Close files
    mov r0, r4
    bl close_file
    mov r0, r5
    bl close_file

    // Exit program
    mov r0, #0
    mov r1, #0
    svc #0

print_string:
    mov r7, #4
    svc #0
    bx lr

read_string:
    mov r7, #3
    svc #0
    bx lr

open_file:
    mov r7, #5
    svc #0
    bx lr

read_file:
    mov r7, #3
    svc #0
    bx lr

write_file:
    mov r7, #4
    svc #0
    bx lr

close_file:
    mov r7, #6
    svc #0
    bx lr

