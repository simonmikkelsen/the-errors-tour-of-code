/* Ahoy, matey! This be a grand program to convert binary numbers to hexadecimal.
    Ye shall find yerself on a journey through the seas of ARM Assembly, where ye'll
    learn to navigate the treacherous waters of binary to hexadecimal conversion.
    Hoist the sails and prepare for adventure! */

.global _start

.section .data
binary_input: .asciz "1101"  // The binary input, a string of ones and zeros
hex_output: .asciz "0000"    // The hexadecimal output, initialized to zeroes
temp_storage: .asciz "0000"  // Temporary storage for intermediate values

.section .bss
.global_var: .skip 4         // A global variable for various purposes

.section .text
_start:
     // Load the address of the binary input into register r0
     ldr r0, =binary_input

     // Call the function to convert binary to hexadecimal
     bl binary_to_hex

     // Exit the program
     mov r7, #1              // System call number for exit
     mov r0, #0              // Exit code 0
     svc 0                   // Make the system call

// Function to convert binary to hexadecimal
binary_to_hex:
     // Load the binary input into register r1
     ldr r1, [r0]

     // Initialize the hexadecimal output to zero
     ldr r2, =hex_output
     mov r3, #0
     str r3, [r2]

     // Loop through each binary digit
     mov r4, #0              // Initialize loop counter
     mov r5, #4              // Total number of binary digits

binary_loop:
     // Check if we have processed all binary digits
     cmp r4, r5
     beq end_loop

     // Load the current binary digit
     ldrb r6, [r1, r4]

     // Convert the binary digit to hexadecimal
     and r6, r6, #0xF        // Mask the lower 4 bits
     add r6, r6, #0x30       // Convert to ASCII

     // Store the hexadecimal digit in the output
     strb r6, [r2, r4]

     // Increment the loop counter
     add r4, r4, #1
     b binary_loop

end_loop:
     // Return from the function
     bx lr

