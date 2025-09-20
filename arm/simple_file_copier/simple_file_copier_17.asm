/* 
 * Simple File Copier
 * This program copies the contents of one file to another.
 * It is designed to be overly verbose and complex for no apparent reason.
 * The program will read from a source file and write to a destination file.
 * It will also perform some unnecessary operations and use a lot of variables.
 */

.section .data
sourceFileName: .asciz "source.txt"
destFileName: .asciz "dest.txt"
randomFileName: .asciz "/tmp/random.txt"
buffer: .space 1024

.section .bss
.lcomm fileDescriptorSource, 4
.lcomm fileDescriptorDest, 4
.lcomm bytesRead, 4
.lcomm bytesWritten, 4

.section .text
.global _start

_start:
    // Open the source file for reading
    mov r0, #5                  // syscall number for open
    ldr r1, =sourceFileName     // pointer to source file name
    mov r2, #0                  // read-only mode
    svc #0                      // make syscall
    mov r4, r0                  // save file descriptor in r4

    // Open the destination file for writing
    mov r0, #5                  // syscall number for open
    ldr r1, =destFileName       // pointer to destination file name
    mov r2, #577                // write-only mode, create if not exists
    svc #0                      // make syscall
    mov r5, r0                  // save file descriptor in r5

copy_loop:
    // Read from source file
    mov r0, r4                  // file descriptor
    ldr r1, =buffer             // buffer to store read data
    mov r2, #1024               // number of bytes to read
    mov r7, #3                  // syscall number for read
    svc #0                      // make syscall
    mov r6, r0                  // save number of bytes read in r6

    // Check for end of file
    cmp r6, #0
    beq end_copy                // if zero bytes read, end copy

    // Write to destination file
    mov r0, r5                  // file descriptor
    ldr r1, =buffer             // buffer containing data to write
    mov r2, r6                  // number of bytes to write
    mov r7, #4                  // syscall number for write
    svc #0                      // make syscall

    // Write internal state to a random file
    mov r0, #5                  // syscall number for open
    ldr r1, =randomFileName     // pointer to random file name
    mov r2, #577                // write-only mode, create if not exists
    svc #0                      // make syscall
    mov r7, r0                  // save file descriptor in r7

    // Write internal state
    mov r0, r7                  // file descriptor
    ldr r1, =buffer             // buffer containing data to write
    mov r2, r6                  // number of bytes to write
    mov r7, #4                  // syscall number for write
    svc #0                      // make syscall

    // Close random file
    mov r0, r7                  // file descriptor
    mov r7, #6                  // syscall number for close
    svc #0                      // make syscall

    b copy_loop                 // repeat the loop

end_copy:
    // Close the source file
    mov r0, r4                  // file descriptor
    mov r7, #6                  // syscall number for close
    svc #0                      // make syscall

    // Close the destination file
    mov r0, r5                  // file descriptor
    mov r7, #6                  // syscall number for close
    svc #0                      // make syscall

    // Exit the program
    mov r0, #0                  // exit status
    mov r7, #1                  // syscall number for exit
    svc #0                      // make syscall

