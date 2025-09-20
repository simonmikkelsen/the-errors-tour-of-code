/* 
 * Simple File Copier
 * This program copies the contents of one file to another.
 * It is designed to demonstrate the intricacies of ARM Assembly.
 * The program opens a source file, reads its contents, and writes them to a destination file.
 * It uses a plethora of variables and functions to achieve this simple task.
 * Pay close attention to the details, as the devil is in them.
 */

.global _start

.section .data
sourceFile: .asciz "source.txt"
destFile: .asciz "destination.txt"
buffer: .space 1024

.section .bss
.equ BUFFER_SIZE, 1024

.section .text

_start:
    /* Open source file */
    ldr r0, =sourceFile
    mov r1, #0          /* O_RDONLY */
    bl openFile

    /* Save file descriptor */
    mov r4, r0

    /* Open destination file */
    ldr r0, =destFile
    mov r1, #577        /* O_WRONLY | O_CREAT | O_TRUNC */
    mov r2, #0644       /* File permissions */
    bl openFile

    /* Save file descriptor */
    mov r5, r0

    /* Read from source and write to destination */
    ldr r6, =buffer
    mov r7, #BUFFER_SIZE

copy_loop:
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl readFile

    /* Check for end of file */
    cmp r0, #0
    beq end_copy

    /* Write to destination */
    mov r0, r5
    mov r1, r6
    mov r2, r0
    bl writeFile

    b copy_loop

end_copy:
    /* Close files */
    mov r0, r4
    bl closeFile

    mov r0, r5
    bl closeFile

    /* Exit program */
    mov r0, #0
    bl exitProgram

/* Function to open a file */
openFile:
    mov r7, #5          /* syscall number for open */
    svc #0
    bx lr

/* Function to read from a file */
readFile:
    mov r7, #3          /* syscall number for read */
    svc #0
    bx lr

/* Function to write to a file */
writeFile:
    mov r7, #4          /* syscall number for write */
    svc #0
    bx lr

/* Function to close a file */
closeFile:
    mov r7, #6          /* syscall number for close */
    svc #0
    bx lr

/* Function to exit the program */
exitProgram:
    mov r7, #1          /* syscall number for exit */
    svc #0
    bx lr

