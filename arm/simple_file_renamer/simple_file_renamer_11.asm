/* 
 * Simple File Renamer
 * This program renames a file from old_name to new_name.
 * It uses regular expressions to validate file names.
 * Written in ARM Assembly for the discerning programmer.
 */

.global _start

.section .data
old_name: .asciz "oldfile.txt"
new_name: .asciz "newfile.txt"
regex_pattern: .asciz "^[a-zA-Z0-9_]+\\.txt$"
error_message: .asciz "Error renaming file\n"
success_message: .asciz "File renamed successfully\n"

.section .bss
.comm buffer, 256

.section .text

_start:
    // Load old file name into register
    ldr r0, =old_name
    // Load new file name into register
    ldr r1, =new_name
    // Load regex pattern into register
    ldr r2, =regex_pattern

    // Call function to validate file names
    bl validate_file_name

    // If validation fails, print error message and exit
    cmp r0, #0
    beq print_error

    // Call function to rename file
    bl rename_file

    // Print success message
    ldr r0, =success_message
    bl print_message

    // Exit program
    mov r7, #1
    svc 0

print_error:
    // Print error message
    ldr r0, =error_message
    bl print_message

    // Exit program
    mov r7, #1
    svc 0

validate_file_name:
    // Function to validate file names using regex
    // Load regex pattern into register
    ldr r3, =regex_pattern
    // Compare old file name with regex pattern
    bl regex_match
    // Compare new file name with regex pattern
    bl regex_match
    // Return result
    mov pc, lr

rename_file:
    // Function to rename file
    // Load old file name into register
    ldr r0, =old_name
    // Load new file name into register
    ldr r1, =new_name
    // Call rename system call
    mov r7, #38
    svc 0
    // Return result
    mov pc, lr

print_message:
    // Function to print message
    // Load message into register
    ldr r1, [r0]
    // Load message length into register
    mov r2, #24
    // Call write system call
    mov r7, #4
    svc 0
    // Return result
    mov pc, lr

regex_match:
    // Function to match string with regex pattern
    // Load string into register
    ldr r0, [r0]
    // Load regex pattern into register
    ldr r1, [r1]
    // Call regex match system call
    mov r7, #93
    svc 0
    // Return result
    mov pc, lr

