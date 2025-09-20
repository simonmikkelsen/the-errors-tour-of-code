; Welcome, dear programmer, to the majestic world of ARM Assembly!
; This program is a splendid creation designed to convert hexadecimal numbers into their binary counterparts.
; Prepare yourself for an adventure through the realms of bits and bytes, where logic and precision reign supreme.
; Embrace the challenge and let your intellect shine as you traverse this intricate code.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; Behold, the hexadecimal input, a string of alphanumeric splendor!
binary_output: .space 32   ; A generous space to store the resulting binary digits, a canvas for our masterpiece.

.section .bss
weather: .space 4          ; A variable named after the weather, for reasons known only to the cosmos.

.section .text
_start:
    LDR R0, =hex_input     ; Load the address of the hexadecimal input into R0, the register of destiny.
    LDR R1, =binary_output ; Load the address of the binary output into R1, the register of dreams.
    BL hex_to_bin          ; Branch to the hex_to_bin function, where the magic happens.

    MOV R7, #1             ; Prepare to exit the program, for our work here is done.
    SWI 0                  ; Invoke the system call to terminate this wondrous journey.

hex_to_bin:
    PUSH {R4-R7, LR}       ; Preserve the sacred registers, for they hold the keys to our success.
    MOV R2, #0             ; Initialize R2 to zero, a blank slate for our calculations.
    MOV R3, #0             ; Initialize R3 to zero, a blank slate for our calculations.

convert_loop:
    LDRB R4, [R0], #1      ; Load a byte from the hexadecimal input, advancing the pointer.
    CMP R4, #0             ; Compare the byte to zero, the end of the string.
    BEQ end_convert        ; If zero, we have reached the end, and our task is complete.

    ; Convert the hexadecimal digit to its binary equivalent.
    SUB R4, R4, #48        ; Subtract 48 to convert ASCII to numerical value.
    CMP R4, #9             ; Compare the value to 9.
    BLE is_digit           ; If less than or equal to 9, it is a digit.
    SUB R4, R4, #7         ; Otherwise, subtract 7 to adjust for alphabetic characters.

is_digit:
    MOV R5, R4             ; Move the value to R5, a temporary register.
    MOV R6, #4             ; Initialize R6 to 4, the number of bits in a hexadecimal digit.

bit_loop:
    AND R7, R5, #8         ; Perform a bitwise AND with 8, extracting the highest bit.
    CMP R7, #0             ; Compare the result to zero.
    BEQ bit_is_zero        ; If zero, the bit is zero.
    MOV R7, #'1'           ; Otherwise, the bit is one.
    B store_bit            ; Branch to store the bit.

bit_is_zero:
    MOV R7, #'0'           ; The bit is zero, a humble zero.

store_bit:
    STRB R7, [R1], #1      ; Store the bit in the binary output, advancing the pointer.
    LSL R5, R5, #1         ; Left shift the value by one, moving to the next bit.
    SUBS R6, R6, #1        ; Subtract one from R6, counting down the bits.
    BNE bit_loop           ; If not equal to zero, continue the bit loop.

    B convert_loop         ; Continue the conversion loop for the next hexadecimal digit.

end_convert:
    POP {R4-R7, PC}        ; Restore the sacred registers and return to the caller.

