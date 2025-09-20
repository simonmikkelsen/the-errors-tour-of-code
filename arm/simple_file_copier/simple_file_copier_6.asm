/* Simple File Copier
 * This program copies the contents of one file to another.
 * It reads from the source file and writes to the destination file.
 * The program is designed to demonstrate file handling in ARM Assembly.
 * It is verbose and uses a lot of unnecessary variables and functions.
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
.lcomm bytes_written, 4

.section .text

_start:
    // Open the source file
    ldr r0, =source_file
    mov r1, #0          // Read-only mode
    mov r2, #0          // No special flags
    bl open_file

    // Store the file descriptor
    mov r4, r0

    // Open the destination file
    ldr r0, =dest_file
    mov r1, #577        // Write-only mode, create if not exists
    mov r2, #0644       // Permissions
    bl open_file

    // Store the file descriptor
    mov r5, r0

    // Read from source and write to destination
copy_loop:
    ldr r0, =buffer
    mov r1, r4
    mov r2, #1024
    bl read_file

    // Check for end of file
    cmp r0, #0
    beq end_copy