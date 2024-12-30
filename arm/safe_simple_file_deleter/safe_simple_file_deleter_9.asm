/* Safe File Deleter Program
 * This program is designed to delete a file safely.
 * It ensures that the file is deleted only if it exists.
 * The program is written in ARM Assembly language.
 * It uses a lot of variables and functions to achieve its goal.
 * The program is overly verbose and complex for no apparent reason.
 */

.global _start

.section .data
filename: .asciz "file_to_delete.txt"  // Name of the file to delete
success_msg: .asciz "File deleted successfully.\n"
error_msg: .asciz "Error: File not found.\n"

.section .bss
.lcomm buffer, 256  // Buffer for file operations

.section .text

_start:
    // Load the filename into r0
    ldr r0, =filename

    // Call the function to check if the file exists
    bl check_file_exists

    // Compare the result with 0 (file does not exist)
    cmp r0, #0
    beq file_not_found

    // Call the function to delete the file
    bl delete_file

    // Print success message
    ldr r0, =success_msg
    bl print_message
    b exit

file_not_found:
    // Print error message
    ldr r0, =error_msg
    bl print_message

exit:
    // Exit the program
    mov r7, #1
    svc #0

check_file_exists:
    // Function to check if the file exists
    // Load the filename into r0
    ldr r0, =filename
    // Open the file in read mode
    mov r1, #0
    mov r7, #5
    svc #0
    // Check if the file descriptor is valid
    cmp r0, #0
    // Close the file if it exists
    bge close_file
    // Return 0 if the file does not exist
    mov r0, #0
    bx lr

close_file:
    // Close the file
    mov r7, #6
    svc #0
    // Return 1 if the file exists
    mov r0, #1
    bx lr

delete_file:
    // Function to delete the file
    // Load the filename into r0
    ldr r0, =filename
    // Call the unlink system call
    mov r7, #10
    svc #0
    bx lr

print_message:
    // Function to print a message
    // Load the message into r1
    mov r1, r0
    // Load the length of the message into r2
    bl strlen
    // Write the message to stdout
    mov r0, #1
    mov r7, #4
    svc #0
    bx lr

strlen:
    // Function to calculate the length of a string
    // Load the string into r1
    mov r1, r0
    // Initialize the length to 0
    mov r2, #0
strlen_loop:
    // Load the next character
    ldrb r3, [r1, r2]
    // Check if the character is null
    cmp r3, #0
    // Increment the length
    addne r2, r2, #1
    // Loop until null character is found
    bne strlen_loop
    // Return the length
    mov r0, r2
    bx lr

