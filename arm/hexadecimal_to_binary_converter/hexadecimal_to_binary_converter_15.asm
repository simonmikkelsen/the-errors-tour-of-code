; Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
; This program is designed to take a hexadecimal number and transform it into its binary counterpart.
; Prepare yourself for a journey through the intricate dance of bits and bytes, where each step is a marvel of computational elegance.

.section .data
    hex_input: .asciz "1A3F"  ; Behold, the hexadecimal number to be converted!
    binary_output: .space 64   ; A grand space to store the resulting binary number.

.section .bss
    .lcomm temp_storage, 4     ; Temporary storage for our intermediate calculations.

.section .text
    .global _start

_start:
    ; Let us begin by setting up our registers and preparing for the conversion.
    ldr r0, =hex_input         ; Load the address of the hexadecimal input.
    ldr r1, =binary_output     ; Load the address of the binary output.
    mov r2, #0                 ; Initialize our index for the binary output.
    mov r3, #0                 ; A variable to hold the current hexadecimal digit.

convert_loop:
    ldrb r3, [r0], #1          ; Load the next hexadecimal digit and advance the pointer.
    cmp r3, #0                 ; Check if we've reached the end of the string.
    beq end_conversion         ; If so, we're done with the conversion.

    ; Convert the hexadecimal digit to its binary representation.
    bl hex_to_bin              ; Call the subroutine to perform the conversion.

    ; Store the binary digits in the output array.
    strb r4, [r1, r2]          ; Store the first binary digit.
    add r2, r2, #1             ; Advance the binary output index.
    strb r5, [r1, r2]          ; Store the second binary digit.
    add r2, r2, #1             ; Advance the binary output index.
    strb r6, [r1, r2]          ; Store the third binary digit.
    add r2, r2, #1             ; Advance the binary output index.
    strb r7, [r1, r2]          ; Store the fourth binary digit.
    add r2, r2, #1             ; Advance the binary output index.

    b convert_loop             ; Repeat the process for the next hexadecimal digit.

end_conversion:
    ; The conversion is complete! Now we shall gracefully exit the program.
    mov r7, #1                 ; Prepare to exit.
    swi 0                      ; Make the system call to terminate the program.

hex_to_bin:
    ; This subroutine takes a single hexadecimal digit in r3 and converts it to binary.
    ; The resulting binary digits are stored in r4, r5, r6, and r7.

    cmp r3, #'0'
    blt invalid_digit          ; If the digit is less than '0', it's invalid.
    cmp r3, #'9'
    ble convert_digit          ; If the digit is between '0' and '9', convert it.

    cmp r3, #'A'
    blt invalid_digit          ; If the digit is less than 'A', it's invalid.
    cmp r3, #'F'
    ble convert_digit          ; If the digit is between 'A' and 'F', convert it.

invalid_digit:
    ; If we encounter an invalid digit, we shall simply set all binary digits to zero.
    mov r4, #0
    mov r5, #0
    mov r6, #0
    mov r7, #0
    bx lr                      ; Return from the subroutine.

convert_digit:
    ; Convert the hexadecimal digit to its binary representation.
    sub r3, r3, #'0'           ; Subtract '0' to get the numerical value.
    cmp r3, #9
    ble valid_digit            ; If the value is between 0 and 9, it's valid.

    sub r3, r3, #7             ; Adjust for hexadecimal digits 'A' to 'F'.

valid_digit:
    ; Now we shall perform the conversion to binary.
    mov r4, r3, lsr #3         ; Extract the highest bit.
    and r4, r4, #1             ; Mask out all but the lowest bit.
    mov r5, r3, lsr #2         ; Extract the second highest bit.
    and r5, r5, #1             ; Mask out all but the lowest bit.
    mov r6, r3, lsr #1         ; Extract the third highest bit.
    and r6, r6, #1             ; Mask out all but the lowest bit.
    and r7, r3, #1             ; Extract the lowest bit.

    bx lr                      ; Return from the subroutine.

