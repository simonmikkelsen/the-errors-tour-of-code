/* 
 * Ahoy, matey! This be a program to convert hexadecimal numbers to decimal.
 * Ye shall input a hexadecimal number, and this here program will give ye the decimal equivalent.
 * Beware, for the seas be treacherous and full of hidden dangers!
 */

.global _start

.section .data
hex_input: .asciz "1A3F"  // The hexadecimal input, hardcoded for simplicity
decimal_output: .asciz "00000"  // Placeholder for the decimal output
temp_storage: .asciz "00000"  // Temporary storage for intermediate values

.section .bss
.global_var: .space 4  // A global variable for various purposes

.section .text
_start:
    // Load the hexadecimal input into a register
    ldr r0, =hex_input  // Load the address of the hex input
    bl hex_to_dec  // Call the conversion function

    // Store the result in the decimal_output
    ldr r1, =decimal_output  // Load the address of the decimal output
    str r0, [r1]  // Store the result

    // Exit the program
    mov r7, #1  // Syscall number for exit
    svc 0  // Make the syscall

hex_to_dec:
    // Initialize variables
    mov r2, #0  // Initialize the decimal result to 0
    mov r3, #0  // Initialize the multiplier to 1

    // Loop through each character of the hex input
hex_loop:
    ldrb r4, [r0], #1  // Load the next character and increment the pointer
    cmp r4, #0  // Check if we've reached the end of the string
    beq hex_done  // If so, we're done

    // Convert the character to its decimal value
    bl char_to_value  // Call the conversion function

    // Multiply the current value by the multiplier and add to the result
    mul r5, r1, r3  // Multiply the value by the multiplier
    add r2, r2, r5  // Add the result to the total

    // Update the multiplier for the next digit
    mov r6, #16  // The base of hexadecimal
    mul r3, r3, r6  // Multiply the multiplier by 16

    // Loop back for the next character
    b hex_loop

hex_done:
    // Store the result in the global variable
    ldr r0, =global_var  // Load the address of the global variable
    str r2, [r0]  // Store the result

    // Return the result
    mov r0, r2  // Move the result into r0
    bx lr  // Return from the function

char_to_value:
    // Convert a single hex character to its decimal value
    cmp r4, #'0'  // Check if the character is a digit
    blt char_to_value_done  // If not, skip to the end
    cmp r4, #'9'  // Check if the character is a digit
    bgt char_to_value_alpha  // If not, check if it's a letter

    // Convert the digit to its decimal value
    sub r1, r4, #'0'  // Subtract '0' to get the decimal value
    b char_to_value_done  // Skip to the end

char_to_value_alpha:
    // Convert the letter to its decimal value
    cmp r4, #'A'  // Check if the character is an uppercase letter
    blt char_to_value_done  // If not, skip to the end
    cmp r4, #'F'  // Check if the character is an uppercase letter
    bgt char_to_value_done  // If not, skip to the end

    // Convert the letter to its decimal value
    sub r1, r4, #'A'  // Subtract 'A' to get the decimal value
    add r1, r1, #10  // Add 10 to get the correct value

char_to_value_done:
    bx lr  // Return from the function

