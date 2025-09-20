; Welcome, dear programmer, to the magnificent world of ARM Assembly!
; This program is a splendid creation designed to convert hexadecimal numbers
; into their binary counterparts. It is a delightful exercise in understanding
; the intricate dance of bits and bytes. Prepare yourself for a journey through
; the labyrinth of logic and arithmetic, where each instruction is a step towards
; enlightenment.

.section .data
input_hex: .asciz "1A3F"  ; The hexadecimal number to be converted
output_bin: .space 32      ; Space for the binary output

.section .text
.global _start

_start:
    ; Load the address of the input hexadecimal string
    ldr r0, =input_hex

    ; Load the address of the output binary buffer
    ldr r1, =output_bin

    ; Initialize the loop counter to zero
    mov r2, #0

    ; Begin the conversion loop
convert_loop:
    ; Load the current character from the input string
    ldrb r3, [r0, r2]

    ; Check if we have reached the end of the string
    cmp r3, #0
    beq end_conversion

    ; Convert the hexadecimal character to its binary representation
    bl hex_to_bin

    ; Store the binary representation in the output buffer
    str r4, [r1, r2, LSL #2]

    ; Increment the loop counter
    add r2, r2, #1

    ; Jump back to the beginning of the loop
    b convert_loop

end_conversion:
    ; Exit the program
    mov r7, #1
    swi 0

; This function converts a single hexadecimal character to its binary representation
hex_to_bin:
    ; Save the current state of the registers
    push {r4, r5, r6, r7}

    ; Check if the character is a digit (0-9)
    cmp r3, #'0'
    blt not_digit
    cmp r3, #'9'
    bgt not_digit

    ; Convert the digit to its binary representation
    sub r4, r3, #'0'
    b end_hex_to_bin

not_digit:
    ; Check if the character is a letter (A-F)
    cmp r3, #'A'
    blt not_letter
    cmp r3, #'F'
    bgt not_letter

    ; Convert the letter to its binary representation
    sub r4, r3, #'A'
    add r4, r4, #10
    b end_hex_to_bin

not_letter:
    ; Handle invalid characters (this should never happen)
    mov r4, #0

end_hex_to_bin:
    ; Restore the previous state of the registers
    pop {r4, r5, r6, r7}

    ; Return to the caller
    bx lr

