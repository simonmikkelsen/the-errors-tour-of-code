/* Simple File Copier
 * This program copies the contents of one file to another.
 * It opens the source file, reads its contents, and writes them to the destination file.
 * The program is written in ARM Assembly language.
 * It demonstrates basic file operations and error handling.
 * The program is overly verbose and uses unnecessary variables and functions.
 * Let's get this show on the road!
 */

.global _start

.section .data
source_file: .asciz "source.txt"
dest_file: .asciz "dest.txt"
buffer: .space 1024

.section .bss
source_fd: .word 0
dest_fd: .word 0
bytes_read: .word 0
bytes_written: .word 0

.section .text

_start:
    // Open the source file for reading
    ldr r0, =source_file
    mov r1, #0          // O_RDONLY
    bl open_file
    str r0, source_fd

    // Open the destination file for writing
    ldr r0, =dest_file
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open_file
    str r0, dest_fd

    // Read from source and write to destination
copy_loop:
    ldr r0, source_fd
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    str r0, bytes_read

    cmp r0, #0
    beq close_files

    ldr r0, dest_fd
    ldr r1, =buffer
    ldr r2, bytes_read
    bl write_file
    str r0, bytes_written

    b copy_loop

close_files:
    // Close the source file
    ldr r0, source_fd
    bl close_file

    // Close the destination file
    ldr r0, dest_fd
    bl close_file

    // Exit the program
    mov r7, #1          // SYS_EXIT
    mov r0, #0
    svc #0

open_file:
    mov r7, #5          // SYS_OPEN
    svc #0
    bx lr

read_file:
    mov r7, #3          // SYS_READ
    svc #0
    bx lr

write_file:
    mov r7, #4          // SYS_WRITE
    svc #0
    bx lr

close_file:
    mov r7, #6          // SYS_CLOSE
    svc #0
    bx lr

