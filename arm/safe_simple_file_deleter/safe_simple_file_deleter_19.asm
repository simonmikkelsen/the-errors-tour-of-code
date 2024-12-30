/* 
 * Safe File Deleter - ARM Assembly
 * This program is designed to delete files safely. 
 * It takes user input for the filename and deletes the specified file.
 * The program is verbose and contains many comments to help understand each step.
 * It also includes unnecessary variables and functions for no apparent reason.
 */

.global _start

.section .data
prompt: .asciz "Enter the filename to delete: "
buffer: .space 100

.section .bss
.lcomm filename, 100

.section .text

_start:
    // Display the prompt to the user
    ldr r0, =prompt
    bl print_string

    // Read the user input
    ldr r0, =buffer
    mov r1, #100
    bl read_string

    // Copy the input to filename
    ldr r1, =buffer
    ldr r2, =filename
    bl copy_string

    // Prepare the command to delete the file
    ldr r0, =filename
    bl delete_file

    // Exit the program
    mov r7, #1
    svc 0

// Function to print a string
print_string:
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc 0
    bx lr

// Function to read a string
read_string:
    mov r2, r1
    mov r1, r0
    mov r7, #3
    svc 0
    bx lr

// Function to copy a string
copy_string:
    copy_loop:
        ldrb r3, [r1], #1
        strb r3, [r2], #1
        cmp r3, #0
        bne copy_loop
    bx lr

// Function to delete a file
delete_file:
    // Prepare the command string
    ldr r1, ="/bin/rm "
    bl copy_string
    ldr r1, =filename
    bl copy_string

    // Execute the command
    ldr r0, =filename
    mov r7, #11
    svc 0
    bx lr

