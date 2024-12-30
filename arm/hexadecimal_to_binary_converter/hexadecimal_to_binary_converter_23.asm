/* 
 * Welcome, dear programmer, to the wondrous world of ARM Assembly!
 * Today, we embark on a grand adventure to convert hexadecimal numbers into their binary counterparts.
 * This program is a delightful exercise in the art of low-level programming, where every instruction is a brushstroke on the canvas of memory.
 * Prepare yourself for a journey filled with verbose commentary and a plethora of variables and functions, some of which may seem superfluous.
 * Let us begin our odyssey!
 */

.section .data
hex_input: .asciz "1A3F"  // The hexadecimal string to be converted
binary_output: .space 64  // Space for the binary output string

.section .bss
weather: .space 4  // A variable named after the weather

.section .text
.global _start

_start:
    // Initialize the pointers and counters
    ldr r0, =hex_input  // Load the address of the hexadecimal input string
    ldr r1, =binary_output  // Load the address of the binary output buffer
    mov r2, #0  // Initialize the counter to zero

    // Loop through each character of the hexadecimal string
hex_to_bin_loop:
    ldrb r3, [r0, r2]  // Load the next character from the hexadecimal string
    cmp r3, #0  // Compare the character to the null terminator
    beq end_conversion  // If the character is the null terminator, end the conversion

    // Convert the hexadecimal character to its binary representation
    bl hex_char_to_bin  // Call the function to convert the character

    // Store the binary representation in the output buffer
    str r4, [r1, r2, LSL #2]  // Store the binary value in the output buffer

    // Increment the counter and continue the loop
    add r2, r2, #1  // Increment the counter
    b hex_to_bin_loop  // Continue the loop

end_conversion:
    // Null-terminate the binary output string
    mov r3, #0  // Load the null terminator
    strb r3, [r1, r2, LSL #2]  // Store the null terminator in the output buffer

    // Exit the program
    mov r7, #1  // Load the syscall number for exit
    mov r0, #0  // Load the exit status code
    svc #0  // Make the syscall

// Function to convert a hexadecimal character to its binary representation
hex_char_to_bin:
    push {lr}  // Save the link register

    // Check if the character is a digit (0-9)
    cmp r3, #'0'  // Compare the character to '0'
    blt not_digit  // If the character is less than '0', it is not a digit
    cmp r3, #'9'  // Compare the character to '9'
    bgt not_digit  // If the character is greater than '9', it is not a digit

    // Convert the digit to its binary representation
    sub r4, r3, #'0'  // Subtract '0' to get the binary value
    b end_hex_char_to_bin  // Skip the next check

not_digit:
    // Check if the character is a letter (A-F)
    cmp r3, #'A'  // Compare the character to 'A'
    blt end_hex_char_to_bin  // If the character is less than 'A', it is invalid
    cmp r3, #'F'  // Compare the character to 'F'
    bgt end_hex_char_to_bin  // If the character is greater than 'F', it is invalid

    // Convert the letter to its binary representation
    sub r4, r3, #'A'  // Subtract 'A' to get the offset
    add r4, r4, #10  // Add 10 to get the binary value

end_hex_char_to_bin:
    pop {lr}  // Restore the link register
    bx lr  // Return from the function

