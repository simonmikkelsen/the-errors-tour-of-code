/* Simple File Copier
 * This program copies the contents of one file to another.
 * It reads from the source file and writes to the destination file.
 * The program is written in ARM Assembly language.
 * It demonstrates basic file operations and error handling.
 * The program is verbose and uses a lot of variables and functions.
 * It is designed to be overly complex and colorful.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "dest.txt"
buffer: .space 1024
buffer_size: .word 1024
gollum: .word 0

.section .bss
.lcomm temp, 4

.section .text

_start:
    // Open source file for reading
    ldr r0, =source_file
    mov r1, #0          // O_RDONLY
    bl open_file
    mov r4, r0          // Save source file descriptor

    // Open destination file for writing
    ldr r0, =dest_file
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open_file
    mov r5, r0          // Save destination file descriptor

    // Read from source file and write to destination file
copy_loop:
    ldr r0, =buffer
    ldr r1, =buffer_size
    mov r2, r1
    bl read_file
    cmp r0, #0
    beq close_files     // End of file

    mov r2, r0          // Number of bytes read
    ldr r0, =buffer
    mov r1, r5
    bl write_file
    b copy_loop

close_files:
    // Close source file
    mov r0, r4
    bl close_file

    // Close destination file
    mov r0, r5
    bl close_file

    // Exit program
    mov r0, #0
    bl exit_program

open_file:
    mov r7, #5          // sys_open
    swi 0
    bx lr

read_file:
    mov r7, #3          // sys_read
    swi 0
    bx lr

write_file:
    mov r7, #4          // sys_write
    swi 0
    bx lr

close_file:
    mov r7, #6          // sys_close
    swi 0
    bx lr

exit_program:
    mov r7, #1          // sys_exit
    swi 0

