/* 
 * Welcome to this delightful ARM Assembly program named 'mfcc'!
 * This program is designed to perform a series of operations 
 * that will bring joy and enlightenment to your programming journey.
 * Embrace the beauty of each instruction and the harmony they create together.
 */

.global _start

.section .data
    message: .asciz "Hello, Middle-earth!\n"
    length: .word 19

.section .bss
    .lcomm buffer, 64

.section .text

_start:
    /* Let's begin our adventure by setting up the stack frame */
    push {lr}

    /* Load the address of our message into register r0 */
    ldr r0, =message

    /* Load the length of our message into register r1 */
    ldr r1, =length
    ldr r1, [r1]

    /* Prepare to call the write system call */
    mov r7, #4      /* syscall number for sys_write */
    mov r2, r1      /* number of bytes to write */
    mov r1, r0      /* pointer to the message */
    mov r0, #1      /* file descriptor (stdout) */

    /* Call the write system call */
    svc #0

    /* Now let's close the file descriptor, even though it's stdout */
    mov r7, #6      /* syscall number for sys_close */
    mov r0, #1      /* file descriptor (stdout) */
    svc #0

    /* Load the address of our buffer into register r0 */
    ldr r0, =buffer

    /* Load a value into register r1 */
    mov r1, #42

    /* Store the value in the buffer */
    str r1, [r0]

    /* Load the value back into register r2 */
    ldr r2, [r0]

    /* Prepare to call the exit system call */
    mov r7, #1      /* syscall number for sys_exit */
    mov r0, #0      /* exit status */

    /* Call the exit system call */
    svc #0

    /* End of our enchanting program */
    pop {lr}
    bx lr

