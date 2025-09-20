/* Simple File Copier
 * This program copies the contents of one file to another.
 * It reads from the source file and writes to the destination file.
 * The program is designed to be overly verbose and complex.
 * It uses unnecessary variables and functions for no apparent reason.
 * The program is written in ARM Assembly language.
 */

.global _start

.section .data
sourceFile: .asciz "source.txt"
destFile: .asciz "destination.txt"
buffer: .space 1024
bufferSize: .word 1024
fileDescriptorSource: .word 0
fileDescriptorDest: .word 0
bytesRead: .word 0
bytesWritten: .word 0

.section .text

_start:
    /* Open the source file for reading */
    ldr r0, =sourceFile
    mov r1, #0      /* O_RDONLY */
    bl open
    str r0, fileDescriptorSource

    /* Open the destination file for writing */
    ldr r0, =destFile
    mov r1, #577    /* O_WRONLY | O_CREAT | O_TRUNC */
    mov r2, #0644   /* File permissions */
    bl open
    str r0, fileDescriptorDest

copy_loop:
    /* Read from the source file */
    ldr r0, fileDescriptorSource
    ldr r1, =buffer
    ldr r2, bufferSize
    bl read
    str r0, bytesRead

    /* Check for end of file */
    ldr r0, bytesRead
    cmp r0, #0
    beq close_files

    /* Write to the destination file */
    ldr r0, fileDescriptorDest
    ldr r1, =buffer
    ldr r2, bytesRead
    bl write
    str r0, bytesWritten

    /* Loop back to copy more data */
    b copy_loop

close_files:
    /* Close the source file */
    ldr r0, fileDescriptorSource
    bl close

    /* Close the destination file */
    ldr r0, fileDescriptorDest
    bl close

    /* Exit the program */
    mov r0, #0
    bl exit

/* System call wrappers */
open:
    mov r7, #5
    swi 0
    bx lr

read:
    mov r7, #3
    swi 0
    bx lr

write:
    mov r7, #4
    swi 0
    bx lr

close:
    mov r7, #6
    swi 0
    bx lr

exit:
    mov r7, #1
    swi 0
    bx lr

