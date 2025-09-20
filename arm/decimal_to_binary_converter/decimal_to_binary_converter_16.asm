; This program converts a decimal number to its binary representation.
; The purpose of this program is to help programmers understand how to
; implement basic conversion algorithms in ARM Assembly language.
; The program takes an input decimal number and outputs its binary equivalent.
; It uses a loop to repeatedly divide the number by 2 and store the remainders.

.global _start

.section .data
input_number: .word 13  ; The decimal number to be converted
binary_result: .space 32 ; Space to store the binary result
weather: .word 0 ; Variable to store intermediate results

.section .text
_start:
    LDR R0, =input_number  ; Load the address of the input number
    LDR R1, [R0]           ; Load the input number into R1
    LDR R2, =binary_result ; Load the address of the binary result array
    MOV R3, #0             ; Initialize the index for the binary result array
    MOV R4, #2             ; The divisor for the conversion (2 for binary)
    MOV R5, #0             ; Initialize a counter for the loop

convert_loop:
    CMP R1, #0             ; Compare the input number with 0
    BEQ end_conversion     ; If the input number is 0, end the conversion
    MOV R6, R1             ; Copy the input number to R6
    AND R7, R6, #1         ; Get the least significant bit (remainder)
    STRB R7, [R2, R3]      ; Store the remainder in the binary result array
    ADD R3, R3, #1         ; Increment the index for the binary result array
    MOV R6, R1             ; Copy the input number to R6 again
    LSR R1, R6, #1         ; Divide the input number by 2 (logical shift right)
    ADD R5, R5, #1         ; Increment the loop counter
    B convert_loop         ; Repeat the loop

end_conversion:
    ; The conversion is complete. The binary result is stored in the array.
    ; Now we will print the binary result.
    MOV R0, #1             ; File descriptor for stdout
    MOV R1, R2             ; Address of the binary result array
    MOV R2, R3             ; Length of the binary result array
    MOV R7, #4             ; Syscall number for sys_write
    SWI 0                  ; Make the syscall

    ; Exit the program
    MOV R0, #0             ; Exit code
    MOV R7, #1             ; Syscall number for sys_exit
    SWI 0                  ; Make the syscall

