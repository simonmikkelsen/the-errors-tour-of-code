; Welcome, dear programmer, to the magnificent world of ARM Assembly!
; This program is a splendid creation designed to convert binary numbers into their hexadecimal counterparts.
; Prepare yourself for an adventure through the realms of bits and nibbles, where you shall witness the transformation of binary digits into the glorious hexadecimal format.
; Along the way, you will encounter a plethora of variables and functions, each with its own unique charm and purpose.
; So, without further ado, let us embark on this journey of conversion and discovery!

.section .data
binary_input: .asciz "110101101011"  ; Behold, the binary number to be converted!
hex_output: .asciz "00000000"        ; A placeholder for the resulting hexadecimal number.

.section .bss
.comm temp_storage, 4                ; Temporary storage for intermediate calculations.

.section .text
.global _start

_start:
    ; Initialize the registers and prepare for the grand conversion.
    LDR R0, =binary_input            ; Load the address of the binary input string.
    LDR R1, =hex_output              ; Load the address of the hexadecimal output string.
    MOV R2, #0                       ; Clear the counter register.
    MOV R3, #0                       ; Clear the temporary register.

    ; The main loop of conversion, where the magic happens.
convert_loop:
    LDRB R4, [R0, R2]                ; Load a byte from the binary input string.
    CMP R4, #0                       ; Check if we have reached the end of the string.
    BEQ end_conversion               ; If yes, jump to the end of the conversion process.

    ; Convert the binary digit to its hexadecimal equivalent.
    SUB R4, R4, #48                  ; Convert ASCII '0' or '1' to binary 0 or 1.
    ADD R3, R3, R4                   ; Accumulate the binary digits.
    ADD R2, R2, #1                   ; Increment the counter.

    ; Check if we have processed 4 binary digits (one nibble).
    CMP R2, #4
    BNE convert_loop                 ; If not, continue the conversion loop.

    ; Convert the accumulated binary digits to a hexadecimal character.
    CMP R3, #10
    ADDLT R3, R3, #48                ; Convert to ASCII '0'-'9'.
    ADDGE R3, R3, #87                ; Convert to ASCII 'a'-'f'.
    STRB R3, [R1]                    ; Store the hexadecimal character in the output string.
    ADD R1, R1, #1                   ; Move to the next position in the output string.

    ; Reset the registers for the next nibble.
    MOV R2, #0
    MOV R3, #0

    ; Continue the conversion process.
    B convert_loop

end_conversion:
    ; The grand finale, where we gracefully exit the program.
    MOV R7, #1                       ; Prepare to exit.
    SWI 0                            ; Exit the program.

