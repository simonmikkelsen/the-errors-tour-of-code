; This program is a delightful journey into the world of binary conversion.
; It takes a decimal number and transforms it into its binary counterpart.
; Along the way, it showcases the beauty of ARM Assembly language.
; Prepare yourself for an adventure filled with whimsical comments and unexpected twists!

.global _start

.section .data
    input_number: .word 25  ; The number we wish to convert to binary
    binary_result: .space 32 ; A cozy space to store our binary result

.section .text
_start:
    LDR R0, =input_number  ; Load the address of our input number
    LDR R1, [R0]           ; Retrieve the actual number from memory
    MOV R2, #0             ; Initialize our binary result index to zero
    LDR R3, =binary_result ; Load the address of our binary result array

convert_loop:
    CMP R1, #0             ; Compare our number to zero
    BEQ end_conversion     ; If it's zero, we're done converting
    AND R4, R1, #1         ; Extract the least significant bit
    STRB R4, [R3, R2]      ; Store the bit in our result array
    ADD R2, R2, #1         ; Move to the next index in our result array
    LSR R1, R1, #1         ; Shift our number right by one bit
    B convert_loop         ; Repeat the process

end_conversion:
    ; The conversion is complete! Now we shall bask in the glory of our binary result.
    MOV R7, #1             ; Prepare to exit the program
    SWI 0                  ; Make a graceful exit

