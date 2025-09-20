/*
 * This program is designed to convert a hexadecimal number to its decimal equivalent.
 * The program takes a hexadecimal string as input and processes each character to compute the decimal value.
 * It demonstrates the use of ARM Assembly instructions for string manipulation and arithmetic operations.
 * The program is intended to be educational and provide insight into low-level programming techniques.
 */

.section .data
hexString: .asciz "1A3F"  // The hexadecimal string to be converted
length: .word 4           // Length of the hexadecimal string

.section .bss
.comm result, 4           // Variable to store the final decimal result

.section .text
.global _start

_start:
    LDR R0, =hexString    // Load the address of the hexadecimal string
    LDR R1, =length       // Load the length of the string
    LDR R1, [R1]          // Dereference to get the actual length value
    MOV R2, #0            // Initialize the result to zero
    MOV R3, #0            // Initialize the index to zero

convert_loop:
    CMP R3, R1            // Compare index with length
    BEQ end_conversion    // If index equals length, end the conversion

    LDRB R4, [R0, R3]     // Load the current character from the string
    BL hex_to_dec         // Convert the character to its decimal value
    ADD R2, R2, R0        // Add the converted value to the result
    ADD R3, R3, #1        // Increment the index
    B convert_loop        // Repeat the loop

end_conversion:
    STR R2, result        // Store the final result in the result variable

    MOV R7, #1            // Exit system call
    SWI 0                 // Invoke the system call

hex_to_dec:
    CMP R4, #'0'          // Compare character with '0'
    BLT invalid_char      // If less than '0', it's invalid
    CMP R4, #'9'          // Compare character with '9'
    BLE valid_digit       // If less than or equal to '9', it's a valid digit
    CMP R4, #'A'          // Compare character with 'A'
    BLT invalid_char      // If less than 'A', it's invalid
    CMP R4, #'F'          // Compare character with 'F'
    BGT invalid_char      // If greater than 'F', it's invalid

valid_digit:
    SUB R4, R4, #'0'      // Convert character to its decimal value
    MOV R0, R4            // Move