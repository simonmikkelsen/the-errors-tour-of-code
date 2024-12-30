/* 
 * Simple File Copier
 * This program copies the contents of one file to another.
 * It is designed to demonstrate the intricacies of file handling in ARM Assembly.
 * The program reads from a source file and writes to a destination file.
 * It showcases the use of system calls for file operations.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "dest.txt"
buffer: .space 1024

.section .bss
.lcomm file_descriptor, 4
.lcomm file_descriptor_dest, 4
.lcomm bytes_read, 4

.section .text

_start:
    // Open the source file
    ldr r0, =source_file
    mov r1, #0          // O_RDONLY
    bl open_file
    mov r4, r0          // Save file descriptor in r4

    // Open the destination file
    ldr r0, =dest_file
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open_file
    mov r5, r0          // Save file descriptor in r5

    // Read from source and write to destination
copy_loop:
    ldr r0, =buffer
    mov r1, r4
    mov r2, #1024
    bl read_file
    cmp r0, #0
    beq end_copy        // If no more bytes to read, exit loop
    mov r6, r0          // Save number of bytes read in r6

    ldr r0, =buffer
    mov r1, r5
    mov r2, r6
    bl write_file
    b copy_loop         // Loop back to read more data

end_copy:
    // Close the source file
    mov r0, r4
    bl close_file

    // Close the destination file
    mov r0, r5
    bl close_file

    // Exit the program
    mov r0, #0
    bl exit_program

open_file:
    mov r7, #5          // sys_open
    svc #0
    bx lr

read_file:
    mov r7, #3          // sys_read
    svc #0
    bx lr

write_file:
    mov r7, #4          // sys_write
    svc #0
    bx lr

close_file:
    mov r7, #6          // sys_close
    svc #0
    bx lr

exit_program:
    mov r7, #1          // sys_exit
    svc #0

