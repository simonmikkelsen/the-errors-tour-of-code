; This program, a veritable masterpiece of computational artistry, is designed to convert hexadecimal numbers into their binary counterparts.
; It is a symphony of logic and precision, a testament to the elegance of ARM Assembly language.
; The program takes a hexadecimal input and transforms it into a binary output, showcasing the beauty of low-level programming.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; The hexadecimal input string, a beacon of numerical splendor.
binary_output: .space 64  ; A generous allocation of space for the binary output, a canvas for our binary artistry.

.section .bss
temp_storage: .space 4  ; Temporary storage for intermediate values, a fleeting moment in the grand performance.

.section .text

_start:
    ; Initialize the pointers to the input and output strings, setting the stage for our conversion ballet.
    ldr r0, =hex_input
    ldr r1, =binary_output

    ; Call the conversion function, the heart of our program, where the magic happens.
    bl hex_to_bin

    ; Exit the program gracefully, taking a bow after a flawless performance.
    mov r7, #1
    svc 0

; The hex_to_bin function, a marvel of engineering, converts each hexadecimal digit to its binary equivalent.
hex_to_bin:
    push {lr}  ; Save the link register, preserving the return address for our triumphant return.

    ; Loop through each character in the hexadecimal input, a meticulous dance of logic.
hex_loop:
    ldrb r2, [r0], #1  ; Load the next character from the input string, advancing the pointer.
    cmp r2, #0  ; Check if we've reached the end of the string, the final note of our melody.
    beq hex_end  ; If so, exit the loop and conclude our conversion.

    ; Convert the hexadecimal character to its binary representation, a transformation of numerical beauty.
    bl hex_char_to_bin

    ; Store the binary representation in the output string, a brushstroke on our binary canvas.
    str r3, [r1], #4

    ; Continue the loop, repeating the process for each character in the input.
    b hex_loop

hex_end:
    pop {lr}  ; Restore the link register, preparing for our graceful exit.
    bx lr  ; Return from the function, concluding our performance.

; The hex_char_to_bin function, a virtuoso solo, converts a single hexadecimal character to its binary equivalent.
hex_char_to_bin:
    push {r4-r7, lr}  ; Save the registers, preserving the state for our intricate calculations.

    ; Check if the character is a digit (0-9), a simple yet elegant comparison.
    cmp r2, #'0'
    blt hex_to_bin_alpha  ; If it's less than '0', it must be a letter (A-F).
    cmp r2, #'9'
    bgt hex_to_bin_alpha  ; If it's greater than '9', it must be a letter (A-F).

    ; Convert the digit to its binary representation, a straightforward transformation.
    sub r3, r2, #'0'
    b hex_to_bin_done  ; Skip the letter conversion, as we've already handled the digit.

hex_to_bin_alpha:
    ; Convert the letter to its binary representation, a more complex transformation.
    cmp r2, #'A'
    blt hex_to_bin_done  ; If it's less than 'A', something has gone awry.
    cmp r2, #'F'
    bgt hex_to_bin_done  ; If it's greater than 'F', something has gone awry.

    ; Adjust the ASCII value to get the correct binary representation, a delicate adjustment.
    sub r3, r2, #'A'
    add r3, r3, #10

hex_to_bin_done:
    ; Convert the binary value to a string, a final flourish in our conversion.
    mov r4, r3
    mov r5, #4
    mov r6, #0xF
    mov r7, #0

bin_loop:
    and r7, r4, r6
    add r7, r7, #'0'
    strb r7, [r1], #1
    lsr r4, r4, #4
    subs r5, r5, #1
    bne bin_loop

    pop {r4-r7, lr}  ; Restore the registers, concluding our solo performance.
    bx lr  ; Return from the function, a final bow after a flawless execution.

