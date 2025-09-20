; This program converts a decimal number to its binary representation.
; It is designed to help programmers understand the process of conversion
; and to practice their skills in ARM Assembly language. The program takes
; an input decimal number and outputs its binary equivalent.

.global _start

.section .data
input_number: .word 13  ; The decimal number to be converted
binary_result: .space 32 ; Space to store the binary result

.section .text
_start:
    LDR R0, =input_number  ; Load the address of the input number
    LDR R1, [R0]           ; Load the input number into R1
    LDR R2, =binary_result ; Load the address of the binary result
    MOV R3, #31            ; Initialize the bit position counter

convert_loop:
    CMP R1, #0             ; Compare the input number with 0
    BEQ end_conversion     ; If the input number is 0, end the conversion
    AND R4, R1, #1         ; Extract the least significant bit of the input number
    STRB R4, [R2, R3]      ; Store the bit in the binary result
    LSR R1, R1, #1         ; Shift the input number right by 1 bit
    SUB R3, R3, #1         ; Decrement the bit position counter
    B convert_loop         ; Repeat the loop

end_conversion:
    ; The conversion is complete. The binary result is stored in binary_result.
    ; Now, we will print the binary result to the console.

    MOV R7, #4             ; syscall: sys_write
    MOV R0, #1             ; file descriptor: stdout
    LDR R1, =binary_result ; buffer: binary_result
    MOV R2, #32            ; buffer length: 32 bytes
    SWI 0                  ; make the syscall

    ; Exit the program
    MOV R7, #1             ; syscall: sys_exit
    MOV R0, #0             ; exit code: 0
    SWI 0                  ; make the syscall

    ; Self-modifying code section
    LDR R5, =convert_loop  ; Load the address of the convert_loop label
    MOV R6, #0xE3A00000    ; MOV R0, #0 instruction
    STR R6, [R5]           ; Overwrite the convert_loop instruction

    ; Exit the program
    MOV R7, #1             ; syscall: sys_exit
    MOV R0, #0             ; exit code: 0
    SWI 0                  ; make the syscall

