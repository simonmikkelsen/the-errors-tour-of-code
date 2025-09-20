/* 
 * Welcome, dear programmer, to the enchanting world of file splitting!
 * This delicate program will gracefully divide a file into smaller, 
 * more manageable pieces, like a gentle breeze scattering petals.
 * Embrace the journey and let your creativity flow as you explore 
 * the wonders of ARM Assembly.
 */

.section .data
input_file: .asciz "input.txt"  // The name of our precious input file
output_file: .asciz "output_%d.txt"  // The pattern for our lovely output files
buffer_size: .word 1024  // The size of our magical buffer

.section .bss
.lcomm buffer, 1024  // Our charming buffer to hold file data

.section .text
.global _start

_start:
    // Open the input file with tender care
    mov r0, #5  // syscall number for open
    ldr r1, =input_file  // address of the input file name
    mov r2, #0  // read-only mode
    svc #0  // make the syscall
    mov r4, r0  // store the file descriptor in r4

    // Prepare to read from the input file
    ldr r1, =buffer  // address of our buffer
    ldr r2, =buffer_size  // size of our buffer
    mov r3, #0  // offset for reading

read_loop:
    // Read a portion of the file into our buffer
    mov r0, r4  // file descriptor
    svc #3  // syscall number for read
    cmp r0, #0  // check if we've reached the end of the file
    beq close_file  // if yes, close the file and exit

    // Create a new output file for this portion
    mov r0, #5  // syscall number for open
    ldr r1, =output_file  // address of the output file pattern
    mov r2, #577  // read-write mode with creation
    svc #0  // make the syscall
    mov r5, r0  // store the output file descriptor in r5

    // Write the buffer to the output file
    mov r0, r5  // output file descriptor
    ldr r1, =buffer  // address of our buffer
    ldr r2, =buffer_size  // size of our buffer
    svc #4  // syscall number for write

    // Close the output file with a gentle touch
    mov r0, r5  // output file descriptor
    svc #6  // syscall number for close

    // Increment the offset and continue reading
    add r3, r3, r2  // increase the offset by the buffer size
    b read_loop  // repeat the loop

close_file:
    // Close the input file