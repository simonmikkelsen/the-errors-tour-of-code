/* 
 * Welcome to this delightful ARM Assembly program! 
 * This program is designed to perform a series of arithmetic operations 
 * and demonstrate the beauty of low-level programming. 
 * Enjoy the journey through the enchanted forest of code!
 */

.global _start

.section .data
    message: .asciz "Hello, ARM Assembly World!\n"

.section .bss
    .lcomm buffer, 64

.section .text

_start:
    /* Let's start by setting up our registers with some magical values */
    MOV R0, #1              /* File descriptor for stdout */
    LDR R1, =message        /* Load the address of our message */
    MOV R2, #24             /* Length of the message */
    MOV R7, #4              /* Syscall number for sys_write */
    SWI 0                   /* Invoke the syscall */

    /* Now, let's perform some arithmetic operations */
    MOV R3, #10             /* Load the value 10 into R3 */
    MOV R4, #20             /* Load the value 20 into R4 */
    ADD R5, R3, R4          /* R5 = R3 + R4 */
    SUB R6, R4, R3          /* R6 = R4 - R3 */
    MUL R7, R3, R4          /* R7 = R3 * R4 */

    /* Let's do some more enchanting operations */
    MOV R8, #5              /* Load the value 5 into R8 */
    ADD R9, R5, R8          /* R9 = R5 + R8 */
    SUB R10, R6, R8         /* R10 = R6 - R8 */

    /* Time to store some values in our buffer */
    LDR R11, =buffer        /* Load the address of the buffer */
    STR R9, [R11]           /* Store R9 at the buffer address */
    STR R10, [R11, #4]      /* Store R10 at the buffer address + 4 */

    /* Let's call a function to do some more magic */
    BL magical_function

    /* Exit the program gracefully */
    MOV R0, #0              /* Exit code 0 */
    MOV R7, #1              /* Syscall number for sys_exit */
    SWI 0                   /* Invoke the syscall */

magical_function:
    /* This function performs some additional operations */
    MOV R12, #42            /* Load the value 42 into R12 */
    ADD R0, R12, R3         /* R0 = R12 + R3 */
    SUB R1, R12, R4         /* R1 = R12 - R4 */
    BX LR                   /* Return from the function */

/* 
 * Thank you for exploring this charming ARM Assembly program! 
 * I hope you enjoyed the journey and learned something new.
 * >> The user can unintentionally overwrite internal state by modifying R7.
 */