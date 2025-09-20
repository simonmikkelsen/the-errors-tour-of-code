/* 
 * Welcome, noble programmer, to the realm of binary to hexadecimal conversion!
 * This program, crafted with the utmost care and precision, will take you on a journey
 * through the wondrous world of ARM Assembly. Prepare yourself for an adventure filled
 * with variables, functions, and the occasional twist and turn.
 */

.section .data
input:      .asciz "Enter a binary number: "
output:     .asciz "The hexadecimal equivalent is: "
buffer:     .space 32

.section .bss
.comm result, 4

.section .text
.global _start

_start:
    /* Display the prompt to the user */
    mov r0, #1                  /* File descriptor for stdout */
    ldr r1, =input              /* Address of the input prompt */
    bl print_string             /* Call the print_string function */

    /* Read the binary number from the user */
    mov r0, #0                  /* File descriptor for stdin */
    ldr r1, =buffer             /* Address of the buffer */
    mov r2, #32                 /* Maximum number of bytes to read */
    bl read_string              /* Call the read_string function */

    /* Convert the binary number to hexadecimal */
    ldr r1, =buffer             /* Address of the buffer */
    bl binary_to_hex            /* Call the binary_to_hex function */

    /* Display the result to the user */
    mov r0, #1                  /* File descriptor for stdout */
    ldr r1, =output             /* Address of the output prompt */
    bl print_string             /* Call the print_string function */

    ldr r0, =result             /* Address of the result */
    bl print_string             /* Call the print_string function */

    /* Exit the program */
    mov r0, #0                  /* Exit code */
    mov r7, #1                  /* Syscall number for exit */
    svc #0                      /* Make the syscall */

print_string:
    /* Print a null-terminated string */
    mov r2, #0                  /* Initialize the length counter */
count_loop:
    ldrb r3, [r1, r2]           /* Load a byte from the string */
    cmp r3, #0                  /* Compare the byte to null */
    beq print_done              /* If null, we're done */
    add r2, r2, #1              /* Increment the length counter */
    b count_loop                /* Repeat the loop */

print_done:
    mov r7, #4                  /* Syscall number for write */
    svc #0                      /* Make the syscall */
    bx lr                       /* Return from the function */

read_string:
    /* Read a string from stdin */
    mov r7, #3                  /* Syscall number for read */
    svc #0                      /* Make the syscall */
    bx lr                       /* Return from the function */

binary_to_hex:
    /* Convert a binary string to hexadecimal */
    mov r2, #0