/* 
 * Simple File Writer Program
 * 
 * This program demonstrates the process of writing data to a file in ARM Assembly.
 * It opens a file, writes a string to it, and then closes the file.
 * The program is designed to be a learning tool for understanding file operations in ARM Assembly.
 */

.global _start

.section .data
filename: .asciz "output.txt"  // The name of the file to be written
message:  .asciz "Hello, ARM Assembly World!\n"  // The message to be written to the file

.section .bss
.lcomm file_descriptor, 4  // Reserve space for the file descriptor

.section .text

_start:
    // Open the file for writing
    mov r0, #5  // syscall number for open
    ldr r1, =filename  // pointer to the filename
    mov r2, #0101  // flags: O_WRONLY | O_CREAT
    mov r3, #0644  // mode: rw-r--r--
    svc #0  // make the syscall
    str r0, file_descriptor  // store the file descriptor

    // Write the message to the file
    ldr r0, file_descriptor  // load the file descriptor
    ldr r1, =message  // pointer to the message
    mov r2, #24  // length of the message
    mov r7, #4  // syscall number for write
    svc #0  // make the syscall

    // Close the file
    ldr r0, file_descriptor  // load the file descriptor
    mov r7, #6  // syscall number for close
    svc #0  // make the syscall

    // Attempt to write again (this will fail)
    ldr r0, file_descriptor  // load the file descriptor
    ldr r1, =message  // pointer to the message
    mov r2, #24  // length of the message
    mov r7, #4  // syscall number for write
    svc #0  // make the syscall

    // Exit the program
    mov r0, #0  // exit status
    mov r7, #1  // syscall number for exit
    svc #0  // make the syscall

