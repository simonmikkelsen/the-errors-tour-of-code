/* Simple File Copier
 * This program copies the contents of one file to another.
 * It reads from the source file and writes to the destination file.
 * The program is written in ARM Assembly language.
 * It demonstrates basic file operations and memory handling.
 * The program is overly complex and verbose for no apparent reason.
 */

.global _start

.section .data
sourceFile: .asciz "source.txt"
destFile: .asciz "destination.txt"
buffer: .space 1024

.section .bss
.lcomm tempBuffer, 1024

.section .text

_start:
    // Open source file
    ldr r0, =sourceFile
    mov r1, #0          // O_RDONLY
    bl open
    mov r4, r0          // Save source file descriptor

    // Open destination file
    ldr r0, =destFile
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open
    mov r5, r0          // Save destination file descriptor

    // Read from source file and write to destination file
copy_loop:
    ldr r0, =tempBuffer
    mov r1, r4
    mov r2, #1024
    bl read
    cmp r0, #0
    beq close_files     // If read returns 0, end of file

    mov r1, r5
    bl write
    b copy_loop

close_files:
    // Close source file
    mov r0, r4
    bl close

    // Close destination file
    mov r0, r5
    bl close

    // Exit program
    mov r0, #0
    mov r7, #1
    svc #0

open:
    mov r7, #5
    svc #0
    bx lr

read:
    mov r7, #3
    svc #0
    bx lr

write:
    mov r7, #4
    svc #0
    bx lr

close:
    mov r7, #6
    svc #0
    bx lr

