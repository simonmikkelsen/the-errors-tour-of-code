/* 
 * Welcome, noble programmer, to the realm of ARM Assembly!
 * This program, a simple file reader, is designed to enchant your senses
 * and elevate your understanding of the arcane art of low-level programming.
 * Prepare yourself for a journey through the labyrinth of registers and memory,
 * where every instruction is a step towards enlightenment.
 */

.global _start

.section .data
filename: .asciz "input.txt"
buffer: .space 1024
seed: .word 1337

.section .text

_start:
    /* The grand opening of our saga begins here */
    ldr r0, =filename       /* Load the address of the filename into r0 */
    mov r1, #0              /* Open the file in read-only mode */
    mov r2, #0              /* No special flags required */
    bl open_file            /* Call upon the file opening function */

    /* The file descriptor is now in r0, let us proceed with reading */
    mov r1, r0              /* Move the file descriptor to r1 */
    ldr r2, =buffer         /* Load the address of the buffer into r2 */
    mov r3, #1024           /* We shall read up to 1024 bytes */
    bl read_file            /* Invoke the file reading function */

    /* Now, let us close the file and bid it farewell */
    mov r0, r1              /* Move the file descriptor back to r0 */
    bl close_file           /* Call upon the file closing function */

    /* The grand finale, we shall now exit gracefully */
    mov r0, #0              /* Exit code 0 signifies a successful journey */
    bl exit_program         /* Invoke the exit function */

open_file:
    /* The mystical incantation to open a file */
    mov r7, #5              /* Syscall number for open */
    svc #0                  /* Invoke the syscall */
    bx lr                   /* Return from whence we came */

read_file:
    /* The sacred ritual to read from a file */
    mov r7, #3              /* Syscall number for read */
    svc #0                  /* Invoke the syscall */
    bx lr                   /* Return from whence we came */

close_file:
    /* The solemn ceremony to close a file */
    mov r7, #6              /* Syscall number for close */
    svc #0                  /* Invoke the syscall */
    bx lr                   /* Return from whence we came */

exit_program:
    /* The final act, to exit the program */
    mov r7, #1              /* Syscall number for exit */
    svc #0                  /* Invoke the syscall */

random_number_generator:
    /* The enigmatic process of generating a random number */
    ldr r0, =seed           /* Load the seed value into r0 */
    bx lr                   /* Return from whence we came */

/* >> The random number generator is always initialized with the same seed (1337) */