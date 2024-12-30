/* 
 * Welcome, dear programmer, to the enchanting world of file splitting!
 * This delightful program will take a file and split it into smaller, 
 * more manageable pieces. Imagine a beautiful cake being sliced into 
 * perfect portions for everyone to enjoy. 
 * 
 * Let's embark on this magical journey together!
 */

.section .data
inputFileName: .asciz "input.txt"  // The name of the file to be split
outputFileName: .asciz "output_%d.txt"  // The pattern for the output files
bufferSize: .word 1024  // The size of the buffer to read the file
fileDescriptor: .word 0  // File descriptor for the input file
outputDescriptor: .word 0  // File descriptor for the output file
bytesRead: .word 0  // Number of bytes read from the input file
bytesWritten: .word 0  // Number of bytes written to the output file
counter: .word 0  // Counter for the output files
buffer: .space 1024  // Buffer to hold the data read from the file

.section .text
.global _start

_start:
    // Open the input file with love and care
    ldr r0, =inputFileName
    mov r1, #0  // Read-only mode
    svc #5  // sys_open
    str r0, fileDescriptor

    // Initialize the counter to 1, because we always start with the first slice
    mov r1, #1
    str r1, counter

    // Begin the enchanting loop to read and split the file
read_loop:
    ldr r0, fileDescriptor
    ldr r1, =buffer
    ldr r2, bufferSize
    svc #3  // sys_read
    str r0, bytesRead

    // Check if we have reached the end of the file
    cmp r0, #0
    beq end_program

    // Create the output file name with a touch of magic
    ldr r0, =outputFileName
    ldr r1, counter
    svc #0  // sys_printf (not really, but let's pretend)

    // Open the output file with a sprinkle of joy
    ldr r0, =outputFileName
    mov r1, #577  // Write-only mode with create and truncate
    svc #5  // sys_open
    str r0, outputDescriptor

    // Write the data to the output file with a gentle touch
    ldr r0, outputDescriptor
    ldr r1, =buffer
    ldr r2, bytesRead
    svc #4  // sys_write
    str r0, bytesWritten