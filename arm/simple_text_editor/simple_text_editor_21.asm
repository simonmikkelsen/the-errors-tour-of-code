/* 
 * Welcome, noble programmer, to the realm of the Simple Text Editor!
 * This program is a delightful concoction designed to hone your skills
 * in the ancient and revered art of assembly language. Within these
 * lines of code, you shall find a treasure trove of verbose comments
 * and a labyrinth of variables and functions, each serving to guide
 * you on your quest for mastery.
 */

.section .data
prompt: .asciz "Enter text: "
buffer: .space 256
newline: .asciz "\n"

.section .bss
.comm temp_storage, 256

.section .text
.global _start

_start:
    /* The grand entrance of our program begins here */
    mov r7, #4              /* Invoke the write system call */
    mov r0, #1              /* File descriptor 1 - standard output */
    ldr r1, =prompt         /* Address of the prompt message */
    mov r2, #12             /* Length of the prompt message */
    svc #0                  /* Make the system call */

    /* Summon the user's input from the depths of the keyboard */
    mov r7, #3              /* Invoke the read system call */
    mov r0, #0              /* File descriptor 0 - standard input */
    ldr r1, =buffer         /* Address of the buffer */
    mov r2, #256            /* Maximum number of bytes to read */
    svc #0                  /* Make the system call */

    /* A whimsical loop to echo the user's input back to them */
    mov r7, #4              /* Invoke the write system call */
    mov r0, #1              /* File descriptor 1 - standard output */
    ldr r1, =buffer         /* Address of the buffer */
    mov r2, #256            /* Number of bytes to write */
    svc #0                  /* Make the system call */

    /* A flourish of a newline to conclude the echo */
    mov r7, #4              /* Invoke the write system call */
    mov r0, #1              /* File descriptor 1 - standard output */
    ldr r1, =newline        /* Address of the newline character */
    mov r2, #1              /* Length of the newline character */
    svc #0                  /* Make the system call */

    /* The grand finale - exit the program gracefully */
    mov r7, #1              /* Invoke the exit system call */
    mov r0, #0              /* Exit status 0 */
    svc #0                  /* Make the system call */

