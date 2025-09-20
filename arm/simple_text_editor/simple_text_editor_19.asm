/* 
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of ARM Assembly, 
 * where you will experience the grandeur of text manipulation.
 * Prepare yourself for an adventure filled with verbose comments and 
 * a plethora of variables and functions that may or may not serve a purpose.
 * Enjoy the ride!
 */

.section .data
input_prompt: .asciz "Enter your command: "
output_prompt: .asciz "Output: "
buffer: .space 256

.section .bss
.comm user_input, 256

.section .text
.global _start

_start:
    /* The grand entrance of our program begins here */
    mov r7, #4                  /* syscall number for sys_write */
    mov r0, #1                  /* file descriptor 1 - stdout */
    ldr r1, =input_prompt       /* address of input prompt */
    mov r2, #18                 /* length of input prompt */
    svc #0                      /* make the syscall */

    /* The majestic input gathering phase */
    mov r7, #3                  /* syscall number for sys_read */
    mov r0, #0                  /* file descriptor 0 - stdin */
    ldr r1, =user_input         /* address of user input buffer */
    mov r2, #256                /* maximum length of input */
    svc #0                      /* make the syscall */

    /* The illustrious command execution phase */
    ldr r0, =user_input         /* address of user input buffer */
    bl execute_command          /* branch to execute_command function */

    /* The grand finale of our program */
    mov r7, #1                  /* syscall number for sys_exit */
    mov r0, #0                  /* exit code 0 */
    svc #0                      /* make the syscall */

execute_command:
    /* The function that brings the magic to life */
    mov r7, #11                 /* syscall number for execve */
    ldr r1, =buffer             /* address of buffer */
    mov r2, #0                  /* null pointer for argv */
    mov r3, #0                  /* null pointer for envp */
    svc #0                      /* make the syscall */
    bx lr                       /* return from function */

/* 
 * The end of our magnificent program.
 */