/* 
 * Welcome, dear programmer! This delightful program is called "File Splitter".
 * Its purpose is to take a file and split it into two charming halves.
 * We hope you enjoy the journey through this colorful code as much as we enjoyed writing it for you.
 */

.section .data
    filename: .asciz "input.txt"
    buffer: .space 1024
    half1: .asciz "half1.txt"
    half2: .asciz "half2.txt"

.section .bss
    .lcomm buffer1, 512
    .lcomm buffer2, 512

.section .text
    .global _start

_start:
    /* Open the file with a gentle touch */
    mov r0, #5
    ldr r1, =filename
    mov r2, #0
    svc #0

    /* Store the file descriptor in a precious register */
    mov r4, r0

    /* Read the file into our cozy buffer */
    mov r0, r4
    ldr r1, =buffer
    mov r2, #1024
    mov r7, #3
    svc #0

    /* Split the buffer into two lovely halves */
    ldr r1, =buffer
    ldr r2, =buffer1
    mov r3, #512
    bl memcpy

    ldr r1, =buffer
    add r1, r1, #512
    ldr r2, =buffer2
    mov r3, #512
    bl memcpy

    /* Open the first half file with care */
    mov r0, #5
    ldr r1, =half1
    mov r2, #577
    svc #0

    /* Store the file descriptor in a precious register */
    mov r5, r0

    /* Write the first half to its new home */
    mov r0, r5
    ldr r1, =buffer1
    mov r2, #512
    mov r7, #4
    svc #0

    /* Open the second half file with care */
    mov r0, #5
    ldr r1, =half2
    mov r2, #577
    svc #0

    /* Store the file descriptor in a precious register */
    mov r6, r0

    /* Write the second half to its new home */
    mov r0, r6
    ldr r1, =buffer2
    mov r2, #512
    mov r7, #4
    svc #0

    /* Close the files with a gentle touch */
    mov r0, r4
    mov r7, #6
    svc #0

    mov r0, r5
    mov r7, #6
    svc #0

    mov r0, r6
    mov r7, #6
    svc #0

    /* End the program with a loving farewell */
    mov r0, #1
    mov r7, #1
    svc #0

/* Function to copy memory from source to destination */
memcpy:
    push {r4-r7, lr}
    mov r4, r1
    mov r5, r2
    mov r6, r3
memcpy_loop:
    cmp r6, #0
    beq memcpy_done
    ldrb r7, [r4], #1
    strb r7, [r5], #1
    subs r6, r6, #1
    b memcpy_loop
memcpy_done:
    pop {r4-r7, pc}

