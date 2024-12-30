/* 
 * Welcome, dear programmer, to the enchanting world of file splitting!
 * This delightful program will take you on a journey through the magical
 * realms of ARM Assembly, where files are split with grace and elegance.
 * Prepare yourself for an adventure filled with whimsical variables and
 * charming functions, all working together to achieve the noble goal of
 * dividing files into smaller, more manageable pieces.
 */

.section .data
input_file: .asciz "input.txt"  // The name of our beloved input file
output_file: .asciz "output_%d.txt"  // The pattern for our enchanting output files
buffer: .space 1024  // A cozy buffer to hold our data

.section .bss
.lcomm file_descriptor, 4  // A descriptor for our file
.lcomm bytes_read, 4  // The number of bytes read from the file
.lcomm part_number, 4  // The current part number of our output files

.section .text
.global _start

_start:
    // Open the input file with love and care
    ldr r0, =input_file
    mov r1, #0  // O_RDONLY
    bl open_file

    // Initialize our part number to 1
    mov r4, #1
    str r4, [part_number]

    // Read the input file in a loop, splitting it into smaller parts
read_loop:
    ldr r0, =file_descriptor
    ldr r0, [r0]
    ldr r1, =buffer
    mov r2, #1024
    bl read_file

    // Check if we've reached the end of the file
    cmp r0, #0
    beq end_program

    // Write the data to an output file
    ldr r0, =output_file
    ldr r1, [part_number]
    bl create_output_filename
    ldr r0, =buffer
    ldr r1, =file_descriptor
    bl write_file

    // Increment the part number
    ldr r0, [part_number]
    add r0, r0, #1
    str r0, [part_number]

    // Continue reading the input file
    b read_loop

end_program:
    // Close the input file with a gentle touch
    ldr r0, =file_descriptor
    ldr r0, [r0]
    bl close_file

    // Exit the program gracefully
    mov r0, #0
    bl exit_program

// Function to open a file
open_file:
    mov r7, #5  // syscall number for open
    svc #0
    str r0, [file_descriptor]
    bx lr

// Function to read from a file
read_file:
    mov r7, #3  // syscall number for read
    svc #0
    str r0, [bytes_read]
    bx lr

// Function to write to a