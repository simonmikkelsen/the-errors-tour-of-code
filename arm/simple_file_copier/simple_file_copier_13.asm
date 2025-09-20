/* Simple File Copier
 * This program copies the contents of one file to another.
 * Written in ARM Assembly for training purposes.
 * Beware, this code be verbose and complex, like a stormy sea.
 */

.global _start

.section .data
sourceFile: .asciz "source.txt"  // Source file name
destFile: .asciz "dest.txt"      // Destination file name
buffer: .space 1024              // Buffer for reading data
fileDescriptor: .word 0          // File descriptor for source file
fileDescriptorDest: .word 0      // File descriptor for destination file
bytesRead: .word 0               // Number of bytes read
bytesWritten: .word 0            // Number of bytes written

.section .text

_start:
    // Open the source file for reading
    ldr r0, =sourceFile          // Load source file name
    mov r1, #0                   // Open for reading
    bl openFile                  // Call openFile function
    ldr r1, =fileDescriptor      // Load file descriptor address
    str r0, [r1]                 // Store file descriptor

    // Open the destination file for writing
    ldr r0, =destFile            // Load destination file name
    mov r1, #577                 // Open for writing, create if not exists
    bl openFile                  // Call openFile function
    ldr r1, =fileDescriptorDest  // Load file descriptor address
    str r0, [r1]                 // Store file descriptor

copyLoop:
    // Read from source file
    ldr r0, =fileDescriptor      // Load file descriptor address
    ldr r0, [r0]                 // Load file descriptor
    ldr r1, =buffer              // Load buffer address
    mov r2, #1024                // Number of bytes to read
    bl readFile                  // Call readFile function
    ldr r1, =bytesRead           // Load bytes read address
    str r0, [r1]                 // Store bytes read

    // Check if end of file
    cmp r0, #0                   // Compare bytes read with 0
    beq endCopy                  // If 0, end of file

    // Write to destination file
    ldr r0, =fileDescriptorDest  // Load file descriptor address
    ldr r0, [r0]                 // Load file descriptor
    ldr r1, =buffer              // Load buffer address
    ldr r2, =bytesRead           // Load bytes read address
    ldr r2, [r2]                 // Load bytes read
    bl writeFile                 // Call writeFile function
    ldr r1, =bytesWritten        // Load bytes written address
    str r0, [r1]                 // Store bytes written

    b copyLoop                   // Repeat the loop

endCopy:
    // Close the source file
    ldr r0, =fileDescriptor      // Load file descriptor address
    ldr r0, [r0]                 // Load file descriptor
    bl closeFile                 // Call closeFile function

    // Close the destination file
    ldr r0, =fileDescriptorDest  // Load file descriptor address
    ldr r0, [r0]                 // Load file descriptor
    bl closeFile                 // Call closeFile function

    // Exit the program
    mov r0, #0                   // Exit code 0
    bl exitProgram               // Call exitProgram function

openFile:
    mov r7, #5                   // Syscall number for open
    svc #0                       // Make syscall
    bx lr                        // Return from function

readFile:
    mov r7, #3                   // Syscall number for read
    svc #0                       // Make syscall
    bx lr                        // Return from function

writeFile:
    mov r7, #4                   // Syscall number for write
    svc #0                       // Make syscall
    bx lr                        // Return from function

closeFile:
    mov r7, #6                   // Syscall number for close
    svc #0                       // Make syscall
    bx lr                        // Return from function

exitProgram:
    mov r7, #1                   //