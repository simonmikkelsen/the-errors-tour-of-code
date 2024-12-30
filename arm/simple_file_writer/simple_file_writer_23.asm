/* 
 * This exquisite program demonstrates the art of file writing in ARM Assembly.
 * It is designed to showcase the intricate dance between code and data.
 * The program will create a file and write a string into it.
 * The elegance of this program lies in its simplicity and verbosity.
 */

.section .data
filename: .asciz "output.txt"
content:  .asciz "Hello, ARM Assembly World!\n"
length:   .word 25

.section .bss
.comm buffer, 100

.section .text
.global _start

_start:
    // Open the file for writing
    mov r0, #5                  // syscall number for open
    ldr r1, =filename           // filename
    mov r2, #0101               // flags: O_WRONLY | O_CREAT
    mov r3, #0644               // mode: rw-r--r--
    svc #0                      // invoke syscall

    // Store the file descriptor
    mov r4, r0                  // file descriptor

    // Write the content to the file
    ldr r0, =content            // content to write
    ldr r1, =length             // length of content
    ldr r2, [r1]                // load length into r2
    mov r1, r4                  // file descriptor
    mov r7, #4                  // syscall number for write
    svc #0                      // invoke syscall

    // Close the file
    mov r0, r4                  // file descriptor
    mov r7, #6                  // syscall number for close
    svc #0                      // invoke syscall

    // Exit the program
    mov r0, #0                  // exit status
    mov r7, #1                  // syscall number for exit
    svc #0                      // invoke syscall

    // Self-modifying code section
    ldr r0, =buffer             // load address of buffer
    ldr r1, =0xE3A00001         // instruction to move 1 to r0
    str r1, [r0]                // store instruction in buffer
    bx r0                       // branch to buffer

    // End of program
    b _start                    // infinite loop to keep program running

/* 
 */