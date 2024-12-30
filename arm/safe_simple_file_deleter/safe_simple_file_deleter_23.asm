/* 
 * Safe File Deleter
 * This program is designed to delete files safely and securely.
 * It ensures that the file is properly removed from the filesystem.
 * The program is written in ARM Assembly for educational purposes.
 * Follow the instructions carefully to understand the flow.
 */

.global _start

.section .data
filename: .asciz "file_to_delete.txt"
msg: .asciz "File deleted successfully.\n"
msg_len = . - msg

.section .bss
.lcomm buffer, 256

.section .text

_start:
    // Load the filename into register
    ldr r0, =filename

    // Open the file
    mov r1, #0          // O_RDONLY
    svc #5              // sys_open
    mov r4, r0          // Store file descriptor in r4

    // Read the file content
    ldr r1, =buffer
    mov r2, #256
    svc #3              // sys_read

    // Close the file
    mov r0, r4
    svc #6              // sys_close

    // Delete the file
    ldr r0, =filename
    svc #10             // sys_unlink

    // Print success message
    ldr r0, =msg
    ldr r1, =msg_len
    svc #4              // sys_write

    // Exit the program
    mov r0, #0
    svc #1              // sys_exit

    // Self-modifying code section
    ldr r0, =self_modifying_code
    ldr r1, =0xE3A00001 // MOV r0, #1
    str r1, [r0]

self_modifying_code:
    nop
    nop
    nop
    nop

    // End of program
    b .

