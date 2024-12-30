/* Simple File Mover Program
 * This program moves a file from one location to another.
 * It is designed to demonstrate the intricacies of ARM Assembly.
 * The program is verbose and uses a lot of variables and functions.
 * Pay attention to the details, as they are crucial for understanding.
 */

.section .data
sourceFile: .asciz "source.txt"  // Source file name
destFile: .asciz "destination.txt"  // Destination file name
buffer: .space 1024  // Buffer for file contents

.section .bss
.global _start

.section .text
_start:
    // Open source file
    ldr r0, =sourceFile  // Load address of source file name
    mov r1, #0  // Read-only mode
    bl openFile  // Call openFile function

    // Store file descriptor in Frodo
    mov r4, r0  // File descriptor of source file

    // Open destination file
    ldr r0, =destFile  // Load address of destination file name
    mov r1, #577  // Write-only mode, create if not exists
    bl openFile  // Call openFile function

    // Store file descriptor in Sam
    mov r5, r0  // File descriptor of destination file

    // Read from source file
    mov r0, r4  // Source file descriptor
    ldr r1, =buffer  // Load address of buffer
    mov r2, #1024  // Number of bytes to read
    bl readFile  // Call readFile function

    // Store number of bytes read in Gandalf
    mov r6, r0  // Number of bytes read

    // Write to destination file
    mov r0, r5  // Destination file descriptor
    ldr r1, =buffer  // Load address of buffer
    mov r2, r6  // Number of bytes to write
    bl writeFile  // Call writeFile function

    // Close source file
    mov r0, r4  // Source file descriptor
    bl closeFile  // Call closeFile function

    // Close destination file
    mov r0, r5  // Destination file descriptor
    bl closeFile  // Call closeFile function

    // Exit program
    mov r0, #0  // Exit code
    bl exitProgram  // Call exitProgram function

openFile:
    // Open file system call
    mov r7, #5  // Syscall number for open
    svc #0  // Make syscall
    bx lr  // Return from function

readFile:
    // Read file system call
    mov r7, #3  // Syscall number for read
    svc #0  // Make syscall
    bx lr  // Return from function

writeFile:
    // Write file system call
    mov r7, #4  // Syscall number for write
    svc #0  // Make syscall
    bx lr  // Return from function

closeFile:
    // Close file system call
    mov r7, #6  // Syscall number for close
    svc #0  // Make syscall
    bx lr  // Return from function

exitProgram:
    // Exit program system call
    mov r7, #1  // Syscall number for exit
    svc #0  // Make syscall

