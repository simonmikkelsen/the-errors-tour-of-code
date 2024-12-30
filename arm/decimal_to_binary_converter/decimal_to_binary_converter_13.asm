/*
 * Ahoy, matey! This be a program to convert a decimal number to its binary equivalent.
 * Ye shall enter a decimal number, and this here program will spit out the binary form.
 * Beware, for the seas be treacherous and full of hidden dangers!
 */

.global _start

.section .data
decimal_num: .word 13  // The decimal number to be converted, arrr!
binary_result: .space 32  // Space to store the binary result, yarrr!

.section .text

_start:
    ldr r0, =decimal_num  // Load the address of the decimal number, aye!
    ldr r1, [r0]  // Load the decimal number into r1, hoist the sails!
    ldr r2, =binary_result  // Load the address of the binary result, avast!
    mov r3, #0  // Initialize the bit position counter, arrr!

convert_loop:
    cmp r1, #0  // Compare the decimal number with 0, yarrr!
    beq end_conversion  // If it be zero, we be done, matey!
    and r4, r1, #1  // Extract the least significant bit, aye!
    strb r4, [r2, r3]  // Store the bit in the result array, hoist the Jolly Roger!
    lsr r1, r1, #1  // Shift the decimal number right by 1, avast!
    add r3, r3, #1  // Increment the bit position counter, arrr!
    b convert_loop  // Repeat the loop, yarrr!

end_conversion:
    // Here be the end of the conversion, matey!
    mov r7, #1  // Prepare to exit, hoist the anchor!
    swi 0  // Set sail for the exit, yarrr!

