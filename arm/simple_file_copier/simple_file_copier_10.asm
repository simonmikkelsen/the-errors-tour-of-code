/* 
 * Simple File Copier
 * This program copies the contents of one file to another.
 * It takes input from the user for the source and destination file names.
 * The program is written in ARM Assembly language.
 * It demonstrates basic file operations and user input handling.
 */

.global _start

.section .data
source_prompt: .asciz "Enter source file name: "
dest_prompt: .asciz "Enter destination file name: "
buffer: .space 1024
newline: .asciz "\n"

.section .bss
source_filename: .space 100
dest_filename: .space 100

.section .text

_start:
    // Print source file prompt
    ldr r0, =source_prompt
    bl print_string

    // Read source file name
    ldr r0, =source_filename
    mov r1, #100
    bl read_string

    // Print destination file prompt
    ldr r0, =dest_prompt
    bl print_string

    // Read destination file name
    ldr r0, =dest_filename
    mov r1, #100
    bl read_string

    // Open source file
    ldr r0, =source_filename
    mov r1, #0          // O_RDONLY
    bl open_file
    mov r4, r0          // Save source file descriptor

    // Open destination file
    ldr r0, =dest_filename
    mov r1, #577        // O_WRONLY | O_CREAT | O_TRUNC
    mov r2, #0644       // File permissions
    bl open_file
    mov r5, r0          // Save destination file descriptor

copy_loop:
    // Read from source file
    mov r0, r4
    ldr r1, =buffer
    mov r2, #1024
    bl read_file
    cmp r0, #0
    beq close_files     // If read returns 0, end of file

    // Write to destination file
    mov r0, r5
    ldr r1, =buffer
    bl write_file
    b copy_loop

close_files:
    // Close source file
    mov r0, r4
    bl close_file

    // Close destination file
    mov r0, r5
    bl close_file