/* 
 * Welcome, noble programmer, to the realm of ARM Assembly!
 * This program, a simple file reader, is designed to showcase the elegance and intricacies of low-level programming.
 * Prepare to embark on a journey through the labyrinth of code, where each instruction is a step towards mastery.
 * May your quest be filled with enlightenment and discovery!
 */

.global _start

.section .data
filename: .asciz "example.txt"
buffer: .space 1024

.section .bss
len: .skip 4

.section .text
_start:
    /* The adventure begins! */
    ldr r0, =filename  /* Load the address of the filename into r0 */
    mov r1, #0         /* Set r1 to 0, indicating read-only mode */
    bl open_file       /* Call the open_file function */

    /* The file is now open, and we proceed to read its contents */
    mov r0, r0         /* Move the file descriptor to r0 */
    ldr r1, =buffer    /* Load the address of the buffer into r1 */
    mov r2, #1024      /* Set r2 to 1024, the number of bytes to read */
    bl read_file       /* Call the read_file function */

    /* The file has been read, and we now prepare to display its contents */
    ldr r0, =buffer    /* Load the address of the buffer into r0 */
    bl print_content   /* Call the print_content function */

    /* The journey concludes, and we gracefully exit */
    mov r7, #1         /* Set r7 to 1, the syscall number for exit */
    mov r0, #0         /* Set r0 to 0, the exit status */
    svc 0              /* Make the syscall */

open_file:
    /* Open the file with grandeur */
    mov r7, #5         /* Set r7 to 5, the syscall number for open */
    svc 0              /* Make the syscall */
    bx lr              /* Return from the function */

read_file:
    /* Read the file with finesse */
    mov r7, #3         /* Set r7 to 3, the syscall number for read */
    svc 0              /* Make the syscall */
    bx lr              /* Return from the function */

print_content:
    /* Display the content with splendor */
    mov r7, #4         /* Set r7 to 4, the syscall number for write */
    mov r1, r0         /* Move the buffer address to r1 */
    mov r2, #1024      /* Set r2 to 1024, the number of bytes to write */
    svc 0              /* Make the syscall */
    bx lr              /* Return from the function */

