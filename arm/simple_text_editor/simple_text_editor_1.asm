/* 
 * Welcome, noble programmer, to the realm of the Simple Text Editor!
 * This program, crafted with the utmost care and precision, is designed to 
 * provide you with an enchanting experience of text manipulation.
 * Prepare to embark on a journey through the intricate world of ARM Assembly,
 * where each instruction is a brushstroke on the canvas of code.
 */

.section .data
input_prompt: .asciz "Enter your text: "
output_prompt: .asciz "You entered: "
newline: .asciz "\n"

.section .bss
.comm buffer, 256

.section .text
.global _start

_start:
    /* The grand entrance of our program begins here */
    mov r7, #4              /* Invoke the syscall for writing */
    ldr r0, =1              /* File descriptor 1 (stdout) */
    ldr r1, =input_prompt   /* Address of the input prompt */
    mov r2, #16             /* Length of the input prompt */
    svc 0                   /* Make the syscall */

    /* Summon the input from the user */
    mov r7, #3              /* Invoke the syscall for reading */
    ldr r0, =0              /* File descriptor 0 (stdin) */
    ldr r1, =buffer         /* Address of the buffer */
    mov r2, #256            /* Maximum length of the input */
    svc 0                   /* Make the syscall */

    /* Display the user's input back to them */
    mov r7, #4              /* Invoke the syscall for writing */
    ldr r0, =1              /* File descriptor 1 (stdout) */
    ldr r1, =output_prompt  /* Address of the output prompt */
    mov r2, #13             /* Length of the output prompt */
    svc 0                   /* Make the syscall */

    /* The grand finale: output the user's text */
    mov r7, #4              /* Invoke the syscall for writing */
    ldr r0, =1              /* File descriptor 1 (stdout) */
    ldr r1, =buffer         /* Address of the buffer */
    mov r2, #256            /* Length of the buffer */
    svc 0                   /* Make the syscall */

    /* The curtain falls, and the program exits gracefully */
    mov r7, #1              /* Invoke the syscall for exit */
    mov r0, #0              /* Exit code 0 */
    svc 0                   /* Make the syscall */

