; Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
; This program is designed to take a hexadecimal number and transform it into its binary equivalent.
; Prepare yourself for a journey through the intricate pathways of ARM Assembly language.
; Along the way, you will encounter a plethora of variables and functions, some of which may seem superfluous.
; Fear not, for they are all part of the grand tapestry of this program.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; Behold, the hexadecimal number to be converted!
binary_output: .space 32  ; A grand space reserved for the binary output.

.section .bss
weather: .skip 4  ; A variable named after the weather, for no particular reason.

.section .text

_start:
    LDR R0, =hex_input  ; Load the address of the hexadecimal input.
    LDR R1, =binary_output  ; Load the address of the binary output.
    BL hex_to_bin  ; Call the majestic conversion function.

    MOV R7, #1  ; Prepare to exit the program.
    SWI 0  ; Exit the program gracefully.

; The grand function that converts hexadecimal to binary.
hex_to_bin:
    PUSH {LR}  ; Save the return address.
    MOV R2, #0  ; Initialize a counter to zero.
    MOV R3, #0  ; Another counter, for good measure.

convert_loop:
    LDRB R4, [R0, R2]  ; Load a byte from the hexadecimal input.
    CMP R4, #0  ; Compare the byte to zero.
    BEQ end_conversion  ; If zero, end the conversion.

    ; Convert the hexadecimal digit to its binary equivalent.
    BL hex_digit_to_bin

    ; Store the binary digits in the output array.
    STRB R5, [R1, R3]
    ADD R3, R3, #4  ; Move to the next position in the output array.

    ADD R2, R2, #1  ; Move to the next hexadecimal digit.
    B convert_loop  ; Repeat the loop.

end_conversion:
    POP {LR}  ; Restore the return address.
    BX LR  ; Return from the function.

; A function to convert a single hexadecimal digit to binary.
hex_digit_to_bin:
    PUSH {LR}  ; Save the return address.
    SUB R4, R4, #48  ; Convert ASCII to integer.
    CMP R4, #9
    BLE digit_is_number
    SUB R4, R4, #7  ; Adjust for letters A-F.

digit_is_number:
    MOV R5, R4  ; Move the result to R5.
    POP {LR}  ; Restore the return address.
    BX LR  ; Return from the function.

