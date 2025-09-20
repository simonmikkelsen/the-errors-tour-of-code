/* Ahoy, me hearties! This be a program to split files into smaller pieces.
 * It be written in ARM Assembly, and it be a treasure trove of learning.
 * Ye shall find it filled with comments to guide ye through the stormy seas of code.
 * So hoist the Jolly Roger and let's set sail on this grand adventure!
 */

.global _start

.section .data
filename: .asciz "input.txt"  // The name of the file to be split, arrr!
buffer: .space 1024           // A buffer to hold the file data, matey!
output_prefix: .asciz "part_" // Prefix for the output files, yarrr!
file_counter: .word 0         // Counter for the output files, aye!

.section .bss
.global buffer_size
buffer_size: .word 0          // Size of the buffer, me lass!

.section .text
_start:
    // Open the file, ye scallywag!
    ldr r0, =filename
    mov r1, #0                // O_RDONLY, arrr!
    svc #5                    // syscall: open
    mov r4, r0                // Save the file descriptor, matey!

    // Read the file into the buffer, arrr!
    ldr r0, =buffer
    mov r1, r4                // File descriptor, aye!
    ldr r2, =1024             // Buffer size, yarrr!
    svc #3                    // syscall: read
    mov r5, r0                // Save the number of bytes read, me hearties!

    // Split the file, ye landlubber!
    bl split_file

    // Exit the program, arrr!
    mov r0, #0
    svc #1                    // syscall: exit

split_file:
    // Prepare to write the first part, matey!
    ldr r0, =output_prefix
    bl create_output_filename
    mov r1, r0                // Output filename, arrr!
    mov r2, r5                // Number of bytes to write, aye!
    bl write_output_file

    // Increment the file counter, yarrr!
    ldr r0, =file_counter
    ldr r1, [r0]
    add r1, r1, #1
    str r1, [r0]

    // Return to the main deck, me hearties!
    mov pc, lr

create_output_filename:
    // Create the output filename, arrr!
    ldr r1, =file_counter
    ldr r1, [r1]
    add r1, r1, #'0'
    strb r1, [r0, #5]
    bx lr

write_output_file:
    // Open the output file, matey!
    mov r2, #577              // O_WRONLY | O_CREAT, arrr!
    svc #5                    // syscall: open
    mov r3, r0                // Save the file descriptor, aye!

    // Write the data to the output file, yarrr!
    ldr r0, =buffer
    svc #4                    // syscall: write

    // Close the output file, me hearties!
    mov r0, r3
    svc #6                    // syscall: close
    bx