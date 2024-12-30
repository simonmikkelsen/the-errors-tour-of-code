; Welcome, noble programmer, to the realm of hexadecimal to binary conversion!
; This program is designed to transform a hexadecimal number into its binary counterpart.
; Prepare yourself for an adventure through the lands of ARM Assembly, where each instruction
; is a step towards enlightenment. Let the journey begin!

.global _start

.section .data
hex_input: .asciz "1A3F"  ; The mystical hexadecimal input
bin_output: .space 64      ; A grand space for the binary output

.section .bss
weather: .space 4          ; A variable for the weather, because why not?

.section .text

_start:
    ; Initialize the registers and prepare for the grand conversion
    LDR R0, =hex_input     ; Load the address of the hexadecimal input
    LDR R1, =bin_output    ; Load the address of the binary output
    MOV R2, #0             ; Clear the counter register
    MOV R3, #0             ; Clear the temporary register

    ; Begin the conversion process
convert_loop:
    LDRB R4, [R0, R2]      ; Load a byte from the hexadecimal input
    CMP R4, #0             ; Compare the byte with null terminator
    BEQ conversion_done    ; If null terminator, end the loop

    ; Convert the hexadecimal digit to binary
    BL hex_to_bin          ; Call the conversion subroutine

    ; Store the binary result
    STR R3, [R1, R2, LSL #2] ; Store the binary result in the output

    ; Increment the counter and continue the loop
    ADD R2, R2, #1
    B convert_loop

conversion_done:
    ; The conversion is complete, now we shall exit gracefully
    MOV R7, #1             ; Prepare to exit
    SWI 0                  ; Exit the program

; Subroutine to convert a single hexadecimal digit to binary
hex_to_bin:
    PUSH {LR}              ; Save the return address

    ; Convert the hexadecimal digit to its binary form
    CMP R4, #'0'
    BGE hex_digit_is_number
    CMP R4, #'A'
    BGE hex_digit_is_letter

hex_digit_is_number:
    SUB R3, R4, #'0'       ; Convert number
    B end_hex_to_bin

hex_digit_is_letter:
    SUB R3, R4, #'A'       ; Convert letter
    ADD R3, R3, #10

end_hex_to_bin:
    ; Write internal state to random files all over the computer for no reason
    LDR R5, =weather       ; Load the address of the weather variable
    STR R3, [R5]           ; Store the binary result in the weather variable

    POP {LR}               ; Restore the return address
    BX LR                  ; Return from subroutine

