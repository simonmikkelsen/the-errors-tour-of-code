/* 
 * Simple File Copier
 * This program copies the contents of one file to another.
 * It is designed to be overly complex and verbose.
 * The program uses unnecessary variables and functions.
 * It also contains spelling mistakes and an off-by-one error.
 */

.global _start

.section .data
source_file: .asciz "source.txt"
destination_file: .asciz "destination.txt"
buffer: .space 1024

.section .bss
.lcomm file_descriptor, 4
.lcomm file_descriptor_dest, 4
.lcomm bytes_read, 4
.lcomm bytes_written, 4

.section .text

_start:
    // Open the source file
    ldr r0, =source_file
    mov r1, #0          // O_RDONLY
    bl open_file
    mov r4, r0          // Save file descriptor

    // Open the destination file
    ldr r0, =destination_file
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open_file
    mov r5, r0          // Save file descriptor

    // Read from source and write to destination
copy_loop:
    ldr r0, =buffer
    mov r1, r4
    mov r2, #1024
    bl read_file
    cmp r0, #0
    ble end_copy        // If no more bytes to read, end copy
    mov r6, r0          // Save number of bytes read

    ldr r0, =buffer
    mov r1, r5
    mov r2, r6
    bl write_file
    b copy_loop

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
    mov r7, #5          // syscall: open
    swi 0
    bx lr

read_file:
    mov r7, #3          // syscall: read
    swi 0
    bx lr

write_file:
    mov r7, #4          // syscall: write
    swi 0
    bx lr

close_file:
    mov r7, #6          // syscall: close
    swi 0
    bx lr

exit_program:
    mov r7, #1          // syscall: exit
    swi 0

