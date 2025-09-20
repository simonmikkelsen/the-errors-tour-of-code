/* Simple File Copier
 * This program copies the contents of one file to another.
 * It is designed to demonstrate the intricacies of ARM Assembly.
 * The program reads from a source file and writes to a destination file.
 * It uses a variety of registers and memory operations.
 * Pay close attention to the details, as they are crucial.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "dest.txt"
buffer: .space 1024

.section .bss
.lcomm uninitialized_var, 4

.section .text

_start:
    // Open source file for reading
    ldr r0, =source_file
    mov r1, #0          // O_RDONLY
    bl open_file

    // Store file descriptor
    mov r4, r0

    // Open destination file for writing
    ldr r0, =dest_file
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open_file

    // Store file descriptor
    mov r5, r0

    // Read from source file and write to destination file
copy_loop:
    ldr r0, =buffer
    mov r1, r4
    mov r2, #1024
    bl read_file

    // Check if end of file
    cmp r0, #0
    beq end_copy

    // Write to destination file
    ldr r0, =buffer
    mov r1, r5
    mov r2, r0
    bl write_file

    b copy_loop

end_copy:
    // Close files
    mov r0, r4
    bl close_file

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

