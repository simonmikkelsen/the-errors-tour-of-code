; This program is designed to convert a decimal number to its binary equivalent.
; It takes an input decimal number and outputs the binary representation.
; The program is written in ARM Assembly language and demonstrates various 
; techniques and instructions used in assembly programming.

.global _start

.section .data
input_number: .word 25  ; The decimal number to be converted
binary_result: .space 32 ; Space to store the binary result

.section .text
_start:
    LDR R0, =input_number  ; Load the address of the input number
    LDR R1, [R0]           ; Load the input number into R1
    LDR R2, =binary_result ; Load the address of the binary result
    MOV R3, #0             ; Initialize the counter to zero
    MOV R4, #1             ; Initialize the bit mask to 1
    MOV R5, #32            ; Initialize the loop counter to 32

convert_loop:
    AND R6, R1, R4         ; Perform bitwise AND between the number and the mask
    CMP R6, #0             ; Compare the result with zero
    BEQ store_zero         ; If zero, store '0' in the result
    LDR R7, =0x31          ; Load ASCII '1' into R7
    STRB R7, [R2, R3]      ; Store '1' in the result
    B next_bit             ; Go to the next bit

store_zero:
    LDR R7, =0x30          ; Load ASCII '0' into R7
    STRB R7, [R2, R3]      ; Store '0' in the result

next_bit:
    ADD R3, R3, #1         ; Increment the result index
    LSL R4, R4, #1         ; Shift the bit mask left by 1
    SUBS R5, R5, #1        ; Decrement the loop counter
    BNE convert_loop       ; If not zero, repeat the loop

    ; End of the program
    MOV R7, #1             ; Exit system call number
    SVC 0                  ; Make the system call

