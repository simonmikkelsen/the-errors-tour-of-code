/* 
 * Welcome, dear programmer, to the grandiose and illustrious Binary to Hexadecimal Converter!
 * This program, crafted with the utmost care and attention to detail, will take a binary number
 * and transform it into its hexadecimal counterpart. Prepare to be amazed by the elegance and 
 * sophistication of this assembly code, as it guides you through the wondrous world of number 
 * systems. Enjoy the journey, and may your debugging skills be ever sharp!
 */

.section .data
binary_input: .asciz "110101101011"  // The binary number to be converted, in all its glory
hex_output: .asciz "00000000"        // The resulting hexadecimal number, a blank canvas awaiting its masterpiece

.section .bss
.comm temp_storage, 4  // Temporary storage for intermediate calculations, a fleeting moment in the grand scheme

.section .text
.global _start

_start:
    // Load the binary input into a register, the first step on our epic quest
    ldr r0, =binary_input
    ldr r1, [r0]

    // Initialize the hexadecimal output, a blank slate ready to be filled with brilliance
    ldr r2, =hex_output

    // Convert the binary input to hexadecimal, a transformation of the highest order
    bl binary_to_hex

    // Exit the program gracefully, our work here is done
    mov r7, #1
    svc 0

binary_to_hex:
    // A function of great importance, where the magic happens
    push {lr}  // Save the link register, a precautionary measure

    // Initialize variables for the conversion process, each playing a vital role
    mov r3, #0  // The current binary digit, a humble beginning
    mov r4, #0  // The current hexadecimal digit, a blank slate
    mov r5, #0  // The loop counter, guiding us through the process
    mov r6, #0  // Temporary storage, a fleeting moment in time

    // Loop through each binary digit, transforming it into its hexadecimal counterpart
    loop_start:
        ldrb r3, [r1, r5]  // Load the current binary digit, a moment of anticipation
        cmp r3, #0
        beq loop_end  // If the digit is zero, we have reached the end of the input

        // Convert the binary digit to its hexadecimal equivalent, a moment of transformation
        and r6, r3, #0xF  // Mask the lower 4 bits, revealing the hidden gem
        add r4, r4, r6  // Add the digit to the current hexadecimal value, a step closer to completion

        // Store the hexadecimal digit in the output, a moment of triumph
        strb r4, [r2, r5]

        // Increment the loop counter, moving us forward on our journey
        add r5, r5, #1
        b loop_start  // Repeat the process, until we reach the end

    loop_end:
        pop {lr}  // Restore the link register, a return to normalcy
        bx lr  // Return from the function, our work here is done

