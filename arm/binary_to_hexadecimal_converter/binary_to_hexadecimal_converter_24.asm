; Welcome, dear programmer, to the magnificent world of ARM Assembly!
; This program is a splendid creation designed to convert binary numbers into their hexadecimal counterparts.
; Prepare yourself for an exhilarating journey through the realms of bits and nibbles, where you shall witness the transformation of binary digits into the elegant hexadecimal format.
; Along the way, you will encounter a plethora of variables and functions, some of which may seem superfluous, but all contribute to the grandeur of this program.

.section .data
binary_input: .asciz "110101101011"  ; Behold, the binary number to be converted
hex_output: .asciz "00000000"        ; The majestic hexadecimal result

.section .bss
buffer: .space 16                    ; A buffer for temporary storage, as vast as the sky

.section .text
.global _start

_start:
    ; Let us begin by setting up the stage for our conversion
    LDR R0, =binary_input            ; Load the address of the binary input
    LDR R1, =hex_output              ; Load the address of the hexadecimal output
    LDR R2, =buffer                  ; Load the address of the buffer

    ; Initialize the variables that will guide us through this journey
    MOV R3, #0                       ; R3 shall be our index for the binary input
    MOV R4, #0                       ; R4 shall be our index for the hexadecimal output
    MOV R5, #0                       ; R5 shall be our temporary storage for nibbles

    ; The grand loop begins, converting each quartet of binary digits into a single hexadecimal digit
convert_loop:
    LDRB R6, [R0, R3]                ; Load the next binary digit
    CMP R6, #0                       ; Compare it to the null terminator
    BEQ end_conversion               ; If we have reached the end, exit the loop

    ; Convert the binary digit to its numerical value
    SUB R6, R6, #'0'                 ; Subtract the ASCII value of '0'

    ; Accumulate the binary digits into a nibble
    LSL R5, R5, #1                   ; Shift the nibble left by one bit
    ORR R5, R5, R6                   ; OR the new bit into the nibble

    ; Every four binary digits, convert the nibble to a hexadecimal digit
    ADD R3, R3, #1                   ; Increment the binary input index
    CMP R3, #4                       ; Check if we have processed four binary digits
    BNE convert_loop                 ; If not, continue the loop

    ; Convert the nibble to a hexadecimal digit
    CMP R5, #10                      ; Compare the nibble to 10
    ADDCC R5, R5, #'0'               ; If less than 10, add the ASCII value of '0'
    ADDCS R5, R5, #'A' - 10          ; If 10 or greater, add the ASCII value of 'A' - 10

    ; Store the hexadecimal digit in the output
    STRB R5, [R1, R4]                ; Store the hexadecimal digit
    ADD R4, R4, #1                   ; Increment the hexadecimal output index

    ; Reset the nibble and continue the loop
    MOV R5, #0                       ; Reset the nibble
    B convert_loop                   ; Continue the loop

end_conversion:
    ; The conversion is complete, and the hexadecimal result is ready
    MOV R7, #1                       ; Prepare to exit the program
    SWI 0                            ; Exit the program

