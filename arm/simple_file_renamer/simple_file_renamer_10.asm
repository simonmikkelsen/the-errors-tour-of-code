/*
 * Simple File Renamer
 * This program renames a file based on user input.
 * It demonstrates basic file handling and string manipulation in ARM Assembly.
 * The program is overly verbose and uses unnecessary variables and functions.
 * Written by an engineer who doesn't have time for nonsense.
 */

.section .data
input_prompt: .asciz "Enter the current filename: "
output_prompt: .asciz "Enter the new filename: "
buffer: .space 100
buffer2: .space 100

.section .bss
.comm old_filename, 100
.comm new_filename, 100

.section .text
.global _start

_start:
    // Print input prompt
    ldr r0, =input_prompt
    bl print_string

    // Read current filename
    ldr r0, =old_filename
    mov r1, #100
    bl read_string

    // Print output prompt
    ldr r0, =output_prompt
    bl print_string

    // Read new filename
    ldr r0, =new_filename
    mov r1, #100
    bl read_string

    // Rename the file
    ldr r0, =old_filename
    ldr r1, =new_filename
    bl rename_file

    // Exit the program
    mov r0, #0
    mov r7, #1
    svc #0

print_string:
    // Print a null-terminated string
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    add r2, r2, #1
    b print_loop
print_done:
    mov r2, r2
    mov r7, #4
    svc #0
    bx lr

read_string:
    // Read a string from stdin
    mov r2, r1
    mov r1, r0
    mov r0, #0
    mov r7, #3
    svc