; Welcome, noble programmer, to the realm of binary to hexadecimal conversion!
; This program is designed to transform a binary number into its hexadecimal counterpart.
; Prepare yourself for a journey through the intricate pathways of ARM Assembly language.
; Along the way, you will encounter a plethora of variables and functions, each with its own unique charm.

.global _start

.section .data
input_binary: .asciz "11010101"  ; The binary number to be converted, presented in a string format.
hex_output: .asciz "00000000"    ; A placeholder for the resulting hexadecimal string.

.section .bss
.comm temp_storage, 4            ; Temporary storage for intermediate calculations.

.section .text
_start:
    LDR R0, =input_binary        ; Load the address of the binary input string into R0.
    LDR R1, =hex_output          ; Load the address of the hexadecimal output string into R1.
    BL binary_to_hex             ; Call the binary to hexadecimal conversion function.

    MOV R7, #1                   ; Prepare to exit the program.
    SWI 0                        ; Exit the program.

binary_to_hex:
    PUSH {LR}                    ; Save the link register.
    MOV R2, #0                   ; Initialize a counter for the binary string.
    MOV R3, #0                   ; Initialize a variable for the hexadecimal result.

convert_loop:
    LDRB R4, [R0, R2]            ; Load a byte from the binary string.
    CMP R4, #0                   ; Check if we have reached the end of the string.
    BEQ conversion_done          ; If yes, jump to the end of the conversion.

    SUB R4, R4, #48              ; Convert ASCII '0' or '1' to binary 0 or 1.
    LSL R3, R3, #1               ; Shift the current result left by 1 bit.
    ORR R3, R3, R4               ; Add the new bit to the result.

    ADD R2, R2, #1               ; Move to the next character in the binary string.
    B convert_loop               ; Repeat the loop.

conversion_done:
    MOV R4, R3                   ; Copy the result to R4 for further processing.
    MOV R5, #0                   ; Initialize a counter for the hexadecimal string.

hex_conversion_loop:
    AND R6, R4, #0xF             ; Extract the last 4 bits of the result.
    CMP R6, #10                  ; Compare the extracted bits with 10.
    ADDCC R6, R6, #48            ; If less than 10, convert to ASCII '0'-'9'.
    ADDCS R6, R6, #87            ; If 10 or more, convert to ASCII 'a'-'f'.

    STRB R6, [R1, R5]            ; Store the ASCII character in the output string.
    ADD R5, R5, #1               ; Move to the next position in the output string.
    LSR R4, R4, #4               ; Shift the result right by 4 bits.

    CMP R4, #0                   ; Check if there are more bits to process.
    BNE hex_conversion_loop      ; If yes, repeat the loop.

    POP {LR}                     ; Restore the link register.
    BX LR                        ; Return from the function.

