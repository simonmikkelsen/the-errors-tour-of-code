/*
 * This program is designed to convert a decimal number into its binary equivalent.
 * It showcases the elegance of ARM Assembly language and provides a detailed
 * walkthrough of each step involved in the conversion process.
 * The program reads an integer from a file, processes it, and outputs the binary representation.
 */

.section .data
input_file: .asciz "input.txt"  // The file from which the decimal number is read
output_file: .asciz "output.txt" // The file where the binary result is written
buffer: .space 100  // Buffer to store file content
binary_result: .space 32  // Buffer to store the binary result

.section .bss
.comm decimal_number, 4  // Variable to store the decimal number

.section .text
.global _start

_start:
    // Open the input file
    ldr r0, =input_file  // Load the address of the input file name
    mov r1, #0  // Open the file in read-only mode
    svc #5  // System call to open the file
    mov r7, r0  // Store the file descriptor

    // Read the content of the file
    mov r0, r7  // File descriptor
    ldr r1, =buffer  // Buffer to store the file content
    mov r2, #100  // Number of bytes to read
    svc #3  // System call to read the file

    // Convert the read string to an integer
    ldr r0, =buffer  // Load the address of the buffer
    bl atoi  // Call the atoi function to convert string to integer
    mov r4, r0  // Store the decimal number in r4

    // Convert the decimal number to binary
    mov r5, r4  // Copy the decimal number to r5
    ldr r6, =binary_result  // Load the address of the binary result buffer
    mov r7, #31  // Initialize the bit position counter

convert_loop:
    cmp r7, #0  // Check if all bits are processed
    blt end_conversion  // If all bits are processed, exit the loop
    and r0, r5, #1  // Extract the least significant bit
    add r0, r0, #'0'  // Convert the bit to ASCII
    strb r0, [r6, r7]  // Store the bit in the result buffer
    lsr r5, r5, #1  // Shift the decimal number to the right
    sub r7, r7, #1  // Decrement the bit position counter
    b convert_loop  // Repeat the loop

end_conversion:
    // Write the binary result to the output file
    ldr r0, =output_file  // Load the address of the