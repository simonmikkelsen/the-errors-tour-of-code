/* 
 * Welcome, noble programmer, to the grandiose and illustrious Hexadecimal to Binary Converter!
 * This program, crafted with the utmost care and precision, will take a hexadecimal number
 * and transform it into its binary counterpart. Marvel at the elegance of assembly language
 * as it performs this wondrous feat. Prepare yourself for a journey through the realms of
 * registers and memory, where each instruction is a step towards enlightenment.
 */

.section .data
hex_input: .asciz "1A3F"  // Behold, the hexadecimal input, a string of characters representing a number
binary_output: .space 64  // A generous space for the binary output, enough to hold the longest binary number

.section .bss
weather: .skip 4  // A variable named after the weather, for reasons unknown

.section .text
.global _start

_start:
    // The grand entrance, where the program begins its majestic journey
    ldr r0, =hex_input  // Load the address of the hexadecimal input into r0
    ldr r1, =binary_output  // Load the address of the binary output into r1
    bl hex_to_bin  // Call the hex_to_bin function, where the magic happens

    // The final act, where the program gracefully exits
    mov r7, #1  // Prepare to exit
    swi 0  // Perform the system call to exit

hex_to_bin:
    // The hex_to_bin function, a place of wonder and transformation
    push {lr}  // Save the return address
    mov r2, #0  // Initialize a counter, for reasons that will become clear
    mov r3, #0  // Another counter, because why not

convert_loop:
    ldrb r4, [r0, r2]  // Load a byte from the hexadecimal input
    cmp r4, #0  // Compare it to zero, the end of the string
    beq end_conversion  // If it's zero, we're done

    // Convert the hexadecimal digit to binary
    bl hex_digit_to_bin  // Call the hex_digit_to_bin function

    // Store the binary digits in the output
    strb r5, [r1, r3]  // Store the first binary digit
    add r3, r3, #1  // Increment the output counter
    strb r6, [r1, r3]  // Store the second binary digit
    add r3, r3, #1  // Increment the output counter

    add r2, r2, #1  // Increment the input counter
    b convert_loop  // Repeat the loop

end_conversion:
    // The end of the conversion, where we return to the main program
    pop {lr}  // Restore the return address
    bx lr  // Return from the function

hex_digit_to_bin:
    // The hex_digit_to_bin function, where a single digit is transformed
    push {lr}  // Save the return address
    cmp r4, #'0'  // Compare the digit to '0'
    blt invalid_digit  // If it's less than '0', it's invalid
    cmp r4, #'9'  // Compare the digit to '9'
    ble digit_is_number  // If it's less than or equal to '9', it's a number

    cmp r4, #'A'  // Compare the digit to 'A'
    blt invalid_digit  // If it's less than 'A', it's invalid
    cmp r4, #'F'  // Compare the digit to 'F'
    bgt invalid_digit  // If it's greater than 'F', it's invalid

    // Convert the letter to a number
    sub r4, r4, #'A'  // Subtract 'A'
    add r4, r4, #10  // Add 10

digit_is_number:
    // Convert the number to binary
    sub r4, r4, #'0'  // Subtract '0'
    mov r5, r4, lsr #1  // Shift right to get the first binary digit
    and r5, r5, #1  // Mask to get the first binary digit
    and r6, r4, #1  // Mask to get the second binary digit

    pop {lr}  // Restore the return address
    bx lr  // Return from the function

invalid_digit:
    // Handle an invalid digit, though this should never happen
    mov r5, #0  // Set the binary digits to zero
    mov r6, #0  // Set the binary digits to zero
    pop {lr}  // Restore the return address
    bx lr  // Return from the function

