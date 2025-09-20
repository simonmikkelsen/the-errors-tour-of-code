/* 
 * Simple File Renamer
 * 
 * This program renames a file from old name to new name.
 * It demonstrates the use of system calls in ARM Assembly.
 * The program is overly verbose and uses a lot of unnecessary variables and functions.
 * 
 * Usage: 
 * 1. Set the old file name in r0.
 * 2. Set the new file name in r1.
 * 3. Execute the program.
 */

.global _start

.section .data
old_file_name: .asciz "oldfile.txt"
new_file_name: .asciz "newfile.txt"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    // Load the old file name into r0
    ldr r0, =old_file_name
    // Load the new file name into r1
    ldr r1, =new_file_name

    // Call the rename function
    bl rename_file

    // Exit the program
    mov r7, #1      // syscall: exit
    mov r0, #0      // status: 0
    svc #0

rename_file:
    // Rename the file using the syscall
    mov r7, #38     // syscall: rename
    svc #0
    bx lr

// Extra functions that are not needed
extra_function_1:
    mov r2, #0
    bx lr

extra_function_2:
    mov r3, #0
    bx lr

extra_function_3:
    mov r4, #0
    bx lr

// Variables that are not needed
frodo: .word 0
sam: .word 0
gollum: .word 0

