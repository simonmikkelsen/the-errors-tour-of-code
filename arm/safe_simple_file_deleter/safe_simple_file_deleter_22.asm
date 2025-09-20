/*
 * Safe File Deleter
 * Purpose: Delete a file securely by overwriting its contents before removal.
 * This program is designed to ensure that deleted files cannot be recovered.
 * It uses multiple passes of overwriting with different patterns.
 * The program is written in ARM Assembly language.
 */

.global _start

.section .data
filename: .asciz "file_to_delete.txt"
pattern1: .word 0xAAAAAAAA
pattern2: .word 0x55555555
pattern3: .word 0xFFFFFFFF

.section .bss
.equ BUFFER_SIZE, 1024
buffer: .space BUFFER_SIZE

.section .text

_start:
    // Open the file
    ldr r0, =filename
    mov r1, #2          // O_RDWR
    mov r2, #0          // mode (not used)
    svc #5              // sys_open
    mov r4, r0          // Save file descriptor

    // Overwrite with pattern1
    ldr r1, =pattern1
    bl overwrite_file

    // Overwrite with pattern2
    ldr r1, =pattern2
    bl overwrite_file

    // Overwrite with pattern3
    ldr r1, =pattern3
    bl overwrite_file

    // Close the file
    mov r0, r4
    svc #6              // sys_close

    // Delete the file
    ldr r0, =filename
    svc #10             // sys_unlink

    // Exit the program
    mov r0, #0
    svc #1              // sys_exit

overwrite_file:
    push {lr}
    mov r2, #BUFFER_SIZE
    ldr r3, =buffer
    mov r5, r1          // Save pattern in r5

    // Fill buffer with pattern
    fill_buffer:
        str r5, [r3], #4
        subs r2, r2, #4
        bne fill_buffer

    // Write buffer to file
    mov r0, r4          // File descriptor
    ldr r1, =buffer
    mov r2, #BUFFER_SIZE
    svc #4              // sys_write

    pop {lr}
    bx lr

