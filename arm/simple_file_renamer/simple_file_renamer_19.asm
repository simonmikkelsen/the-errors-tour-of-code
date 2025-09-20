/* 
 * Simple File Renamer
 * This program renames a file based on user input.
 * It demonstrates basic file operations and user input handling in ARM Assembly.
 * The program is overly complex and verbose for no apparent reason.
 */

.global _start

.section .data
prompt: .asciz "Enter the current filename: "
prompt2: .asciz "Enter the new filename: "
buffer: .space 100
buffer2: .space 100
command: .asciz "mv "

.section .bss
.lcomm temp, 100

.section .text

_start:
    // Display the first prompt
    ldr r0, =prompt
    bl print_string

    // Read the current filename
    ldr r0, =buffer
    mov r1, #100
    bl read_string

    // Display the second prompt
    ldr r0, =prompt2
    bl print_string

    // Read the new filename
    ldr r0, =buffer2
    mov r1, #100
    bl read_string

    // Prepare the command string
    ldr r0, =command
    bl print_string
    ldr r0, =buffer
    bl print_string
    ldr r0, =buffer2
    bl print_string

    // Execute the command
    ldr r0, =buffer
    bl execute_command

    // Exit the program
    mov r7, #1
    svc 0

// Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

// Function to read a string
read_string:
    push {lr}
    mov r1, r0
    mov r2, #100
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

// Function to execute a command
execute_command:
    push {lr}
    mov r7, #11
    svc 0
    pop {lr}
    bx lr

