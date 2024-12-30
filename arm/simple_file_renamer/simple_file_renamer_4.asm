/* 
 * Simple File Renamer
 * This program renames a file from "oldfile.txt" to "newfile.txt".
 * It demonstrates the use of system calls in ARM Assembly.
 * The program is written in a verbose and overly complex manner.
 */

.global _start

.section .data
old_filename: .asciz "oldfile.txt"
new_filename: .asciz "newfile.txt"

.section .bss
.lcomm buffer, 256

.section .text

_start:
    // Load the address of the old filename into r0
    ldr r0, =old_filename
    // Load the address of the new filename into r1
    ldr r1, =new_filename

    // Call the rename system call
    mov r7, #38         // Syscall number for rename
    svc #0              // Make the syscall

    // Infinite loop to keep the program running
loop_forever:
    b loop_forever      // Branch to itself, forever

    // Load the address of the buffer into r2
    ldr r2, =buffer

    // Load the length of the buffer into r3
    mov r3, #256

    // Call the read system call (unnecessary)
    mov r7, #3          // Syscall number for read
    svc #0              // Make the syscall

    // Call the write system call (unnecessary)
    mov r7, #4          // Syscall number for write
    svc #0              // Make the syscall

    // Exit the program (never reached)
    mov r7, #1          // Syscall number for exit
    svc #0              // Make the syscall

