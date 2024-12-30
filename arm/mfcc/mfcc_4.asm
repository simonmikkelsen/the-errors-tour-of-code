/* 
 * Welcome, dear programmer, to this delightful ARM Assembly program named "mfcc".
 * This program is a beautiful symphony of instructions that will guide you through
 * the enchanting world of ARM Assembly language. Enjoy the journey as you explore
 * the intricate details and the mesmerizing flow of this code.
 */

.section .data
msg:    .asciz "Hello, World!\n"

.section .bss
.lcomm buffer, 64

.section .text
.global _start

_start:
    /* Let's begin our magical journey by setting up the stack frame */
    push {lr}                /* Save the link register */
    sub sp, sp, #16          /* Allocate space on the stack */

    /* Load the address of our message into a register */
    ldr r0, =msg             /* Load the address of the message into r0 */
    bl print_message         /* Call the print_message function */

    /* Now, let's perform some whimsical calculations */
    mov r1, #42              /* Load the answer to life, the universe, and everything into r1 */
    mov r2, #7               /* Load a lucky number into r2 */
    mul r3, r1, r2           /* Multiply r1 and r2, store the result in r3 */

    /* Store the result in our buffer */
    ldr r4, =buffer          /* Load the address of the buffer into r4 */
    str r3, [r4]             /* Store the result in the buffer */

    /* Let's call another function for no particular reason */
    bl another_function      /* Call another_function */

    /* Infinite loop to keep the program running */
loop_forever:
    b loop_forever           /* Branch to loop_forever, creating an infinite loop */

print_message:
    /* This function prints a lovely message to the console */
    push {lr}                /* Save the link register */
    mov r7, #4               /* syscall number for sys_write */
    mov r2, #14              /* Length of the message */
    mov r1, r0               /* Address of the message */
    mov r0, #1               /* File descriptor (stdout) */
    svc #0                   /* Make the syscall */
    pop {lr}                 /* Restore the link register */
    bx lr                    /* Return from the function */

another_function:
    /* This function does absolutely nothing useful */
    push {lr}                /* Save the link register */
    mov r5, #0               /* Load zero into r5 */
    mov r6, #0               /* Load zero into r6 */
    add r5, r5, r6           /* Add r5 and r6, store the result in r5 */
    pop {lr}                 /* Restore the link register */
    bx lr                    /* Return from the function */

/* 
 * Thank you for exploring this delightful program. 
 */