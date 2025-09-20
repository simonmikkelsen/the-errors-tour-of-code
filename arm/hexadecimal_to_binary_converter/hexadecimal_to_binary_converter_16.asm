; Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
; This program is designed to take a hexadecimal number and transform it into its binary counterpart.
; Prepare yourself for a journey through the realms of ARM Assembly, where magic and logic intertwine.

.section .data
    hex_input: .asciz "1A3F"  ; Behold, the hexadecimal number to be converted!
    binary_output: .space 32   ; A grand space to store the resulting binary number.

.section .bss
    .lcomm temp_storage, 4     ; Temporary storage for our grand calculations.

.section .text
    .global _start

_start:
    ; Let us begin by setting up our registers and loading the hexadecimal input.
    LDR R0, =hex_input         ; Load the address of the hexadecimal input into R0.
    LDR R1, =binary_output     ; Load the address of the binary output into R1.
    MOV R2, #0                 ; Initialize our index register to zero.

    ; Now, we shall traverse the hexadecimal string and convert each character to its binary form.
convert_loop:
    LDRB R3, [R0, R2]          ; Load the current character from the hexadecimal input.
    CMP R3, #0                 ; Compare the character to the null terminator.
    BEQ end_conversion         ; If we have reached the end, jump to the end of the conversion.

    ; Convert the hexadecimal character to its binary form.
    BL hex_to_bin              ; Call the subroutine to perform the conversion.

    ; Store the resulting binary digits in the output array.
    STRB R4, [R1, R2]          ; Store the first binary digit.
    ADD R2, R2, #1             ; Increment the index register.
    STRB R5, [R1, R2]          ; Store the second binary digit.
    ADD R2, R2, #1             ; Increment the index register.

    ; Continue the loop to process the next hexadecimal character.
    B convert_loop

end_conversion:
    ; The conversion is complete! Now, let us gracefully exit the program.
    MOV R7, #1                 ; Prepare to exit the program.
    SWI 0                      ; Make the system call to exit.

; Subroutine to convert a single hexadecimal character to its binary form.
hex_to_bin:
    PUSH {LR}                  ; Save the link register.
    CMP R3, #'0'               ; Compare the character to '0'.
    BLT invalid_char           ; If it is less than '0', it is invalid.
    CMP R3, #'9'               ; Compare the character to '9'.
    BGT check_alpha            ; If it is greater than '9', check if it is a letter.

    ; Convert the numeric character to its binary form.
    SUB R3, R3, #'0'           ; Subtract '0' to get the numeric value.
    B convert_done             ; Jump to the end of the conversion.

check_alpha:
    CMP R3, #'A'               ; Compare the character to 'A'.
    BLT invalid_char           ; If it is less than 'A', it is invalid.
    CMP R3, #'F'               ; Compare the character to 'F'.
    BGT invalid_char           ; If it is greater than 'F', it is invalid.

    ; Convert the alphabetic character to its binary form.
    SUB R3, R3, #'A'           ; Subtract 'A' to get the alphabetic value.
    ADD R3, R3, #10            ; Add 10 to get the correct numeric value.

convert_done:
    ; Convert the numeric value to its binary form.
    MOV R4, R3                 ; Move the value to R4.
    AND R4, R4, #0xF           ; Mask the lower 4 bits.
    MOV R5, R4, LSR #1         ; Shift right to get the second binary digit.
    AND R5, R5, #1             ; Mask the lower bit.

    POP {LR}                   ; Restore the link register.
    BX LR                      ; Return from the subroutine.

invalid_char:
    ; Handle invalid characters gracefully.
    MOV R4, #0                 ; Set the binary digits to zero.
    MOV R5, #0                 ; Set the binary digits to zero.
    B convert_done             ; Jump to the end of the conversion.

