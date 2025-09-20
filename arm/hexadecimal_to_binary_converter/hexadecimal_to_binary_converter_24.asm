; Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
; This program is designed to take a hexadecimal number and transform it into its binary counterpart.
; Prepare yourself for an adventure through the realms of ARM Assembly, where every instruction is a step towards enlightenment.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; Behold, the hexadecimal number to be converted!
binary_output: .space 32  ; A grand space to store the resulting binary number.

.section .bss
weather: .skip 4  ; A variable named after the weather, for no particular reason.

.section .text

_start:
    ; Let us begin our journey by setting up the necessary registers.
    LDR R0, =hex_input      ; Load the address of the hexadecimal input.
    LDR R1, =binary_output  ; Load the address of the binary output.
    MOV R2, #0              ; Initialize a counter for the binary output.
    MOV R3, #0              ; Another counter, just in case.

    ; Now, we shall traverse the hexadecimal input, character by character.
convert_loop:
    LDRB R4, [R0], #1       ; Load a byte from the input and advance the pointer.
    CMP R4, #0              ; Check if we have reached the end of the string.
    BEQ end_conversion      ; If so, our journey is complete.

    ; Convert the hexadecimal character to its binary form.
    BL hex_to_bin           ; Call the conversion subroutine.
    STR R5, [R1, R2]        ; Store the binary result in the output array.
    ADD R2, R2, #4          ; Advance the output pointer by 4 bytes.

    B convert_loop          ; Continue the loop.

end_conversion:
    ; Our conversion is complete! Let us exit gracefully.
    MOV R7, #1              ; The syscall number for exit.
    MOV R0, #0              ; Exit code 0.
    SWI 0                   ; Make the syscall.

; Subroutine to convert a single hexadecimal character to binary.
hex_to_bin:
    PUSH {LR}               ; Save the return address.
    CMP R4, #'0'            ; Compare the character to '0'.
    BLT invalid_char        ; If it's less than '0', it's invalid.
    CMP R4, #'9'            ; Compare the character to '9'.
    BGT check_alpha         ; If it's greater than '9', check if it's a letter.
    SUB R4, R4, #'0'        ; Convert the character to a number.
    B convert_done          ; Skip to the end.

check_alpha:
    CMP R4, #'A'            ;