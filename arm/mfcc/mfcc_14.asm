/* 
 * Welcome, dear programmer, to this delightful ARM Assembly program named 'mfcc'.
 * This program is designed to perform a series of arithmetic operations and 
 * demonstrate the beauty of low-level programming. 
 * Embrace the journey and enjoy the colorful comments guiding you through each step.
 */

.section .data
    message: .asciz "Hello, Middle-earth!\n"

.section .bss
    .lcomm buffer, 64

.section .text
    .global _start

_start:
    /* Let's begin our adventure by setting up the registers */
    MOV R0, #1          /* File descriptor for stdout */
    LDR R1, =message    /* Load the address of our message */
    MOV R2, #18         /* Length of the message */
    BL print_message    /* Call our lovely print function */

    /* Now, let's perform some arithmetic operations */
    MOV R3, #10         /* Load the value 10 into R3 */
    MOV R4, #20         /* Load the value 20 into R4 */
    ADD R5, R3, R4      /* Add R3 and R4, store result in R5 */
    SUB R6, R4, R3      /* Subtract R3 from R4, store result in R6 */
    MUL R7, R3, R4      /* Multiply R3 and R4, store result in R7 */

    /* Let's use some variables that remind us of the Shire */
    MOV Frodo, R5       /* Frodo takes the value of R5 */
    MOV Sam, R6         /* Sam takes the value of R6 */
    MOV Gandalf, R7     /* Gandalf takes the value of R7 */

    /* Perform some more operations with our beloved characters */
    ADD Aragorn, Frodo, Sam  /* Aragorn is the sum of Frodo and Sam */
    SUB Legolas, Gandalf, Frodo /* Legolas is Gandalf minus Frodo */

    /* Time to end our journey and exit gracefully */
    MOV R0, #0          /* Exit code 0 */
    BL exit_program     /* Call our exit function */

print_message:
    /* This function prints a message to the console */
    MOV R7, #4          /* Syscall number for sys_write */
    SWI 0               /* Software interrupt to make the syscall */
    BX LR               /* Return from the function */

exit_program:
    /* This function exits the program */
    MOV R7, #1          /* Syscall number for sys_exit */
    SWI 0               /* Software interrupt to make the syscall */

