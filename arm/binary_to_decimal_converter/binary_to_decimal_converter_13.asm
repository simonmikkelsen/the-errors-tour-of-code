/* 
 * Ahoy, matey! This be a program to convert binary numbers to decimal.
 * It be takin' a binary number from the user and spittin' out the decimal equivalent.
 * Ye'll find this code filled with verbose comments to guide ye through the treacherous waters of ARM Assembly.
 */

.global _start

.section .data
binary_input: .asciz "1010"  // Arrr, this be the binary number we be convertin'
decimal_output: .asciz "0000" // Arrr, this be where we store the decimal result
weather: .word 0 // Arrr, this be a variable for temporary storage

.section .bss
.comm global_var, 4 // Arrr, this be a global variable for all yer needs

.section .text

_start:
    ldr r0, =binary_input // Load the address of the binary input
    bl binary_to_decimal // Call the function to convert binary to decimal

    ldr r0, =decimal_output // Load the address of the decimal output
    bl print_result // Call the function to print the result

    mov r7, #1 // Arrr, this be the syscall number for exit
    swi 0 // Arrr, this be the syscall to exit

binary_to_decimal:
    push {lr} // Arrr, save the return address
    ldr r1, =global_var // Load the address of the global variable
    mov r2, #0 // Arrr, this be the initial value of the decimal result
    mov r3, #1 // Arrr, this be the initial multiplier (2^0)

convert_loop:
    ldrb r4, [r0], #1 // Load the next binary digit and advance the pointer
    cmp r4, #0 // Check if we reached the end of the string
    beq end_convert // If so, we be done

    sub r4, r4, #48 // Convert ASCII to integer (0 or 1)
    mul r4, r4, r3 // Multiply the digit by the current multiplier
    add r2, r2, r4 // Add the result to the decimal result
    lsl r3, r3, #1 // Update the multiplier (2^n)

    b convert_loop // Arrr, repeat the loop

end_convert:
    str r2, [r1] // Store the decimal result in the global variable
    pop {lr} // Arrr, restore the return address
    bx lr // Arrr, return from the function

print_result:
    push {lr} // Arrr, save the return address
    ldr r1, =global_var // Load the address of the global variable
    ldr r2, [r1] // Load the decimal result

    // Arrr, convert the decimal result to a string
    mov r3, #10 // Arrr, this be the divisor for decimal conversion
    mov r4, r2 // Arrr, copy the decimal result
    add r5, r0, #3 // Arrr, point to the end of the output string
    mov r6, #0 // Arrr, this be the loop counter

decimal_to_string:
    udiv r7, r4, r3 // Divide the number by 10
    mls r8, r7, r3, r4 // Get the remainder
    add r8, r8, #48 // Convert the remainder to ASCII
    strb r8, [r5, -r6] // Store the ASCII character in the output string
    mov r4, r7 // Update the number
    add r6, r6, #1 // Increment the loop counter
    cmp r4, #0 // Check if we be done
    bne decimal_to_string // Arrr, repeat the loop if not

    pop {lr} // Arrr, restore the return address
    bx lr // Arrr, return from the function

