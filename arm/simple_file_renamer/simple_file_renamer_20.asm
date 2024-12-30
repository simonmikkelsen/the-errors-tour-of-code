/* Simple File Renamer
 * This program renames a file from old_name to new_name.
 * It demonstrates basic file handling in ARM Assembly.
 * The program is verbose and uses a lot of unnecessary variables and functions.
 * Written by an overly precise and slightly angry engineer.
 */

.global _start

.section .data
old_name: .asciz "oldfile.txt"
new_name: .asciz "newfile.txt"
error_msg: .asciz "Error renaming file\n"
success_msg: .asciz "File renamed successfully\n"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    // Load the old file name into r0
    ldr r0, =old_name
    // Load the new file name into r1
    ldr r1, =new_name

    // Call the rename system call
    mov r7, #38         // syscall number for rename
    svc #0              // make the syscall

    // Check the return value
    cmp r0, #0
    bne error_handler   // if not zero, branch to error_handler

    // Print success message
    ldr r0, =success_msg
    bl print_message

    // Exit the program
    mov r7, #1          // syscall number for exit
    svc #0

error_handler:
    // Print error message
    ldr r0, =error_msg
    bl print_message

    // Exit the program with error code
    mov r7, #1          // syscall number for exit
    mov r0, #1          // exit code 1
    svc #0

print_message:
    // Print a message to stdout
    push {lr}           // save the link register
    ldr r1, =buffer     // load buffer address
    mov r2, #256        // buffer size
    mov r7, #4          // syscall number for write
    svc #0              // make the syscall
    pop {lr}            // restore the link register
    bx lr               // return from function

