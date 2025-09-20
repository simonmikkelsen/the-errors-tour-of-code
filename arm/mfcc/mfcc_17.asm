/* 
 * Welcome to this delightful ARM Assembly program! 
 * This program is designed to perform a series of operations 
 * that will bring joy and happiness to your heart. 
 * It is a beautiful symphony of instructions that will 
 * dance gracefully on your processor.
 */

.section .data
output_file: .asciz "/tmp/output.txt"
random_file: .asciz "/tmp/random_file.txt"
message: .asciz "Hello, world!\n"

.section .bss
.lcomm buffer, 256

.section .text
.global _start

_start:
    /* Let's start by opening our lovely output file */
    mov r0, #4                  /* syscall number for sys_open */
    ldr r1, =output_file        /* filename */
    mov r2, #2                  /* flags: O_RDWR */
    svc #0                      /* make the syscall */

    /* Store the file descriptor */
    mov r4, r0

    /* Write a charming message to the file */
    mov r0, r4                  /* file descriptor */
    ldr r1, =message            /* message to write */
    mov r2, #14                 /* length of the message */
    mov r7, #4                  /* syscall number for sys_write */
    svc #0                      /* make the syscall */

    /* Close the file with grace */
    mov r0, r4                  /* file descriptor */
    mov r7, #6                  /* syscall number for sys_close */
    svc #0                      /* make the syscall */

    /* Now, let's do something whimsical */
    mov r0, #4                  /* syscall number for sys_open */
    ldr r1, =random_file        /* filename */
    mov r2, #2                  /* flags: O_RDWR */
    svc #0                      /* make the syscall */

    /* Store the file descriptor */
    mov r5, r0

    /* Write some random data to the file */
    ldr r0, =buffer             /* buffer */
    mov r1, #256                /* length */
    bl generate_random_data     /* call the function to fill the buffer */

    mov r0, r5                  /* file descriptor */
    ldr r1, =buffer             /* buffer */
    mov r2, #256                /* length */
    mov r7, #4                  /* syscall number for sys_write */
    svc #0                      /* make the syscall */

    /* Close the file with grace */
    mov r0, r5                  /* file descriptor */
    mov r7, #6                  /* syscall number for sys_close */
    svc #0                      /* make the syscall */

    /* Exit the program with a smile */
    mov r0, #0                  /* exit code */
    mov r7, #1                  /* syscall number for sys_exit */
    svc #0                      /* make the syscall */

generate_random_data:
    /* This function fills the buffer with random data */
    push {lr}
    mov r2, #0
fill_loop:
    ldr r3, =0x12345678         /* some random value */
    str r3, [r0, r2]
    add r2, r2, #4
    cmp r2, #256
    blt fill_loop
    pop {lr}
    bx lr

/* 
 */