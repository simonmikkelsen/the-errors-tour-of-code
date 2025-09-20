; Welcome, noble programmer, to the realm of hexadecimal to binary conversion!
; This program, crafted with the utmost care and precision, will take a hexadecimal
; number and transform it into its binary equivalent. Prepare yourself for a journey
; through the intricate pathways of ARM Assembly, where each instruction is a step
; towards enlightenment.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; Behold, the hexadecimal number to be converted!
binary_output: .space 32   ; A grand space reserved for the binary output!

.section .bss
weather: .space 4          ; A variable as unpredictable as the weather!

.section .text
_start:
    LDR R0, =hex_input     ; Load the address of the hexadecimal input
    LDR R1, =binary_output ; Load the address of the binary output
    MOV R2, #0             ; Initialize the index for the binary output
    MOV R3, #0             ; A variable to hold temporary values

convert_loop:
    LDRB R4, [R0], #1      ; Load a byte from the hexadecimal input and advance the pointer
    CMP R4, #0             ; Compare the byte with null terminator
    BEQ end_conversion     ; If null terminator is found, end the conversion

    ; Convert the hexadecimal digit to its binary equivalent
    BL hex_to_bin          ; Call the subroutine to perform the conversion

    B convert_loop         ; Repeat the loop for the next hexadecimal digit

end_conversion:
    ; The grand finale! Null-terminate the binary output
    STRB R3, [R1, R2]      ; Store the null terminator at the end of the binary output

    ; Exit the program gracefully
    MOV R7, #1             ; The syscall number for exit
    MOV R0, #0             ; The exit status
    SWI 0                  ; Invoke the syscall

hex_to_bin:
    ; A subroutine to convert a single hexadecimal digit to binary
    PUSH {LR}              ; Save the link register

    ; Check if the digit is a number (0-9)
    CMP R4, #'0'
    BLT not_a_number
    CMP R4, #'9'
    BGT not_a_number

    ; Convert the number to its binary equivalent
    SUB R4, R4, #'0'
    B store_binary

not_a_number:
    ; Check if the digit is a letter (A-F)
    CMP R4, #'A'
    BLT invalid_digit
    CMP R4, #'F'
    BGT invalid_digit

    ; Convert the letter to its binary equivalent
    SUB R4, R4, #'A'
    ADD R4, R4, #10

store_binary:
    ; Store the binary equivalent in the output array
    STRB R4, [R1, R2]
    ADD R2, R2, #1

    POP {LR}               ; Restore the link register
    BX LR                  ; Return from the subroutine

invalid_digit:
    ; Handle invalid hexadecimal digits (though we expect none)
    MOV R4, #0             ; Set the binary equivalent to 0
    B store_binary         ; Proceed to store the binary equivalent

