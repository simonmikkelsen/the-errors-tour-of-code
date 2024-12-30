/* 
 * Welcome, dear programmer, to this delightful ARM Assembly program!
 * This program is a whimsical journey through the world of assembly language.
 * It is designed to enchant you with its intricate details and vibrant comments.
 * Enjoy the colorful variables and the playful functions as you explore this code.
 */

.section .data
    message: .asciz "Hello, World!\n"
    length: .word 13

.section .text
    .global _start

_start:
    /* Let's set up our registers with love and care */
    MOV R0, #1          /* File descriptor 1 is for stdout */
    LDR R1, =message    /* Load the address of our message */
    LDR R2, =length     /* Load the length of our message */
    LDR R2, [R2]        /* Dereference the length */
    MOV R7, #4          /* Syscall number for sys_write */
    SWI 0               /* Invoke the syscall with a gentle touch */

    /* Now, let's prepare to exit gracefully */
    MOV R0, #0          /* Exit code 0 means success */
    MOV R7, #1          /* Syscall number for sys_exit */
    SWI 0               /* Invoke the syscall with a loving farewell */

    /* A delightful subroutine to add two numbers */
add_numbers:
    ADD R0, R1, R2      /* Add the contents of R1 and R2, store in R0 */
    BX LR               /* Return from the subroutine with a flourish */

    /* A charming subroutine to subtract two numbers */
subtract_numbers:
    SUB R0, R1, R2      /* Subtract the contents of R2 from R1, store in R0 */
    BX LR               /* Return from the subroutine with elegance */

    /* A whimsical subroutine to multiply two numbers */
multiply_numbers:
    MUL R0, R1, R2      /* Multiply the contents of R1 and R2, store in R0 */
    BX LR               /* Return from the subroutine with grace */

    /* A playful subroutine to divide two numbers */
divide_numbers:
    /* Division is a bit more complex, but we handle it with care */
    MOV R3, R1          /* Move R1 to R3 */
    MOV R4, R2          /* Move R2 to R4 */