; Behold! A majestic program that transforms hexadecimal digits into their binary counterparts.
; This program is a delightful journey through the world of ARM Assembly, where each instruction
; is a step towards enlightenment. Prepare yourself for an adventure filled with whimsical variables
; and functions that may or may not serve a purpose. Let the conversion commence!

.section .data
input_hex: .asciz "1A3F"  ; The mystical hexadecimal string to be converted
output_bin: .space 32      ; A generous space to hold the resulting binary string

.section .text
.global _start

_start:
    ; The grand entrance! Initialize the registers and prepare for the conversion spectacle.
    LDR R0, =input_hex     ; Load the address of the input hexadecimal string
    LDR R1, =output_bin    ; Load the address of the output binary string
    MOV R2, #0             ; Initialize the index for the output binary string
    MOV R3, #0             ; A variable to hold temporary values, like a trusty sidekick

convert_loop:
    ; The heart of the conversion process, where magic happens.
    LDRB R4, [R0], #1      ; Load a byte from the input string and advance the pointer
    CMP R4, #0             ; Check if we've reached the end of the string
    BEQ end_conversion     ; If yes, gracefully exit the loop

    ; Transform the hexadecimal digit into its binary form with flair!
    BL hex_to_bin          ; Call the subroutine that performs the transformation
    ADD R2, R2, #4         ; Advance the output index by 4 (each hex digit becomes 4 binary digits)
    B convert_loop         ; Repeat the loop for the next character

end_conversion:
    ; The grand finale! Null-terminate the output binary string and exit the program.
    STRB R3, [R1, R2]      ; Null-terminate the output string
    MOV R7, #1             ; Prepare to exit
    SWI 0                  ; Exit the program

hex_to_bin:
    ; A subroutine that converts a single hexadecimal digit to its binary form.
    ; This is where the real magic happens, hidden from the main stage.
    PUSH {LR}              ; Save the return address
    CMP R4, #'0'
    BLS hex_to_bin_digit   ; If the character is a digit, jump to the digit conversion
    CMP R4, #'A'
    BHI hex_to_bin_letter  ; If the character is a letter, jump to the letter conversion

hex_to_bin_digit:
    ; Convert a hexadecimal digit (0-9) to its binary form.
    SUB R4, R4, #'0'       ; Convert ASCII to integer
    B hex_to_bin_common    ; Jump to the common conversion code

hex_to_bin_letter:
    ; Convert a hexadecimal letter (A-F) to its binary form.
    SUB R4, R4, #'A'       ; Convert ASCII to integer
    ADD R4, R4, #10        ; Adjust for the letter offset

hex_to_bin_common:
    ; Common code to convert the integer value to binary and store it in the output string.
    MOV R5, R4            ; Copy the value to a temporary register
    MOV R6, #4            ; Initialize the bit counter

bin_loop:
    ; Loop to convert each bit of the hexadecimal digit to binary.
    MOV R7, R5, LSR #3    ; Extract the highest bit
    AND R7, R7, #1        ; Isolate the bit value
    ADD R7, R7, #'0'      ; Convert the bit to ASCII
    STRB R7, [R1, R2]     ; Store the bit in the output string
    ADD R2, R2, #1        ; Advance the output index
    LSL R5, R5, #1        ; Shift the value left by 1 bit
    SUBS R6, R6, #1       ; Decrement the bit counter
    BNE bin_loop          ; Repeat the loop for the next bit

    POP {LR}              ; Restore the return address
    BX LR                 ; Return from the subroutine

