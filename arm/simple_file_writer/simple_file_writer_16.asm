/* 
 * This exquisite program is designed to demonstrate the art of file writing in ARM Assembly.
 * It will open a file, write a string to it, and then close the file.
 * The program is meticulously crafted to showcase the elegance of low-level programming.
 */

.global _start

.section .data
filename: .asciz "output.txt"  // The name of the file to be created
content: .asciz "Hello, ARM Assembly World!\n"  // The content to be written to the file

.section .bss
.lcomm file_descriptor, 4  // Space for the file descriptor

.section .text

_start:
    // Open the file
    mov r0, #5  // syscall number for open
    ldr r1, =filename  // Load the address of the filename
    mov r2, #0101  // Flags: O_WRONLY | O_CREAT
    mov r3, #0644  // Mode: rw-r--r--
    svc #0  // Make the syscall
    str r0, file_descriptor  // Store the file descriptor

    // Write to the file
    ldr r0, file_descriptor  // Load the file descriptor
    ldr r1, =content  // Load the address of the content
    mov r2, #25  // Length of the content
    mov r7, #4  // syscall number for write
    svc #0  // Make the syscall

    // Close the file
    ldr r0, file_descriptor  // Load the file descriptor
    mov r7, #6  // syscall number for close
    svc #0  // Make the syscall

    // Exit the program
    mov r0, #0  // Exit status
    mov r7, #1  // syscall number for exit
    svc #0  // Make the syscall

