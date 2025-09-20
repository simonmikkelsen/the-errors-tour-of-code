/* 
 * Safe File Deleter
 * This program is designed to delete files specified by the user.
 * It takes user input for the filename and attempts to delete the file.
 * The program is written in ARM Assembly language.
 * It demonstrates file handling and user interaction.
 * The program is verbose and detailed for educational purposes.
 */

.global _start

.section .data
prompt: .asciz "Enter the filename to delete: "
error: .asciz "Error deleting file.\n"
success: .asciz "File deleted successfully.\n"
buffer: .space 100

.section .bss
.lcomm filename, 100

.section .text

_start:
    // Print the prompt to the user
    ldr r0, =prompt
    bl print_string

    // Read the user input
    ldr r0, =buffer
    mov r1, #100
    bl read_string

    // Copy the user input to filename
    ldr r1, =buffer
    ldr r2, =filename
    bl copy_string

    // Attempt to delete the file
    ldr r0, =filename
    bl delete_file

    // Check the result of the delete operation
    cmp r0, #0
    beq delete_success
    b delete_error

delete_success:
    // Print success message
    ldr r0, =success
    bl print_string
    b exit

delete_error:
    // Print error message
    ldr r0, =error
    bl print_string
    b exit

print_string:
    // Print a null-terminated string
    mov r1, r0
    mov r2, #0
    mov r7, #4
    mov r0, #1
    svc #0
    bx lr

read_string:
    // Read a string from stdin
    mov r7, #3
    mov r0, #0
    svc #0
    bx lr

copy_string:
    // Copy a string from source to destination
    copy_loop:
        ldrb r3, [r1], #1
        strb r3, [r2], #1
        cmp r3, #0
        bne copy_loop
    bx lr

delete_file:
    // Delete a file specified by filename
    mov r7, #10
    svc #0
    bx lr

exit:
    // Exit the program
    mov r7, #1
    mov r0, #0
    svc #0

