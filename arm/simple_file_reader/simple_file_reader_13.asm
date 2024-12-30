/* Ahoy, matey! This be a simple file reader program written in ARM Assembly.
 * The purpose of this here program be to read the contents of a file and display it on the screen.
 * Ye shall find yerself immersed in a sea of comments, guiding ye through the treacherous waters of assembly code.
 * Beware, for there be subtle errors lurking in the depths, waiting to catch ye off guard.
 */

.global _start

/* The main entry point of our grand adventure */
_start:
    /* Hoist the sails and open the file! */
    ldr r0, =filename   /* Load the address of the filename into r0 */
    mov r1, #0          /* Set r1 to 0 for read-only mode */
    bl open_file        /* Call the open_file function */

    /* Check if the file was opened successfully */
    cmp r0, #0
    bge file_opened     /* If r0 >= 0, branch to file_opened */
    b end_program       /* Otherwise, end the program */

file_opened:
    /* Prepare to read the file, ye scallywag! */
    ldr r1, =buffer     /* Load the address of the buffer into r1 */
    mov r2, #256        /* Set r2 to 256, the number of bytes to read */
    bl read_file        /* Call the read_file function */

    /* Display the contents of the file on the screen */
    ldr r0, =buffer     /* Load the address of the buffer into r0 */
    bl display_content  /* Call the display_content function */

end_program:
    /* Lower the anchor and end the program */
    mov r7, #1          /* Set r7 to 1 for the exit syscall */
    mov r0, #0          /* Set r0 to 0, the exit status */
    svc 0               /* Make the syscall */

open_file:
    /* Open the file, ye landlubber! */
    mov r7, #5          /* Set r7 to 5 for the open syscall */
    svc 0               /* Make the syscall */
    bx lr               /* Return from the function */

read_file:
    /* Read the file, ye swashbuckler! */
    mov r7, #3          /* Set r7 to 3 for the read syscall */
    svc 0               /* Make the syscall */
    bx lr               /* Return from the function */

display_content:
    /* Display the content, ye buccaneer! */
    mov r7, #4          /* Set r7 to 4 for the write syscall */
    mov r1, r0          /* Set r1 to the address of the buffer */
    mov r2, #256        /* Set r2 to 256, the number of bytes to write */
    svc 0               /* Make the syscall */
    bx lr               /* Return from the function */

.data
filename:
    .asciz "file.txt"   /* The name of the file to be read */
buffer:
    .space 256          /* A buffer to hold the contents of the file */

