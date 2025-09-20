/*
Ahoy, matey! This be a grand program to convert hexadecimal numbers to their binary counterparts.
Ye shall find this code to be a treasure trove of knowledge, filled with verbose comments to guide ye through the stormy seas of ARM Assembly.
Prepare to set sail on a journey of learning and discovery, where ye shall uncover the secrets of hexadecimal to binary conversion.
*/

.global _start

.section .data
hex_input: .asciz "1A3F"  // The hexadecimal input string, arrr!
binary_output: .space 64  // Space for the binary output, enough for 64 bits, aye!

.section .bss
.global_var: .word 0  // A global variable to be used throughout the code, yarrr!

.section .text
_start:
    ldr r0, =hex_input  // Load the address of the hexadecimal input, hoist the sails!
    ldr r1, =binary_output  // Load the address of the binary output, prepare the cannons!
    bl hex_to_bin  // Call the conversion function, set course for adventure!

    mov r7, #1  // Prepare to exit, lower the anchor!
    swi 0  // Exit the program, land ho!

hex_to_bin:
    push {lr}  // Save the return address, secure the rigging!
    mov r2, #0  // Initialize the index, clear skies ahead!
    mov r3, #0  // Initialize the binary output index, steady as she goes!

convert_loop:
    ldrb r4, [r0, r2]  // Load a byte from the input, batten down the hatches!
    cmp r4, #0  // Check for the null terminator, is it the end of the line?
    beq end_conversion  // If so, jump to the end, drop anchor!

    bl hex_char_to_bin  // Convert the hex character to binary, hoist the Jolly Roger!
    add r2, r2, #1  // Move to the next character, full speed ahead!
    b convert_loop  // Repeat the loop, sail on!

end_conversion:
    strb r3, [r1]  // Store the null terminator in the output, secure the treasure!
    pop {lr}  // Restore the return address, prepare to disembark!
    bx lr  // Return from the function, safe travels!

hex_char_to_bin:
    push {lr}  // Save the return address, tie down the sails!
    cmp r4, #'0'  // Compare with '0', chart the course!
    blt invalid_char  // If less, it's invalid, abandon ship!
    cmp r4, #'9'  // Compare with '9', check the horizon!
    ble convert_digit  // If less or equal, it's a digit, all hands on deck!

    cmp r4, #'A'  // Compare with 'A', set the compass!
    blt invalid_char  // If less, it's invalid, man overboard!
    cmp r4, #'F'  // Compare with 'F', check the sails!
    ble convert_letter  // If less or equal, it's a letter, hoist the colors!

invalid_char:
    mov r4, #0  // Set to zero for invalid character, stormy weather!
    b end_char_conversion  // Jump to the end, brace for impact!

convert_digit:
    sub r4, r4, #'0'  // Convert ASCII digit to binary, clear skies!
    b end_char_conversion  // Jump to the end, smooth sailing!

convert_letter:
    sub r4, r4, #'A'  // Convert ASCII letter to binary, set the course!
    add r4, r4, #10  // Adjust for letter values, steady as she goes!

end_char_conversion:
    str r4, global_var  // Store the result in the global variable, treasure secured!
    pop {lr}  // Restore the return address, prepare to dock!
    bx lr  // Return from the function, safe harbor!

/*
*/