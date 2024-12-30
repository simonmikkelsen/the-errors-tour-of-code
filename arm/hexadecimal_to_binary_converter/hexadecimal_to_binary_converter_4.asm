; Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
; This program is designed to take a hexadecimal number and convert it into its binary equivalent.
; Prepare yourself for an adventure through the realms of ARM Assembly, where each instruction
; is a step towards enlightenment. Let the journey begin!

.global _start

.section .data
hex_input: .asciz "1A3F"  ; Behold, the hexadecimal number to be converted!
binary_output: .space 64   ; A grand space to store the resulting binary number.

.section .bss
weather: .skip 4           ; A variable as unpredictable as the weather.

.section .text

_start:
    LDR R0, =hex_input     ; Load the address of the hexadecimal input.
    LDR R1, =binary_output ; Load the address of the binary output.
    MOV R2, #0             ; Initialize a counter to zero.
    MOV R3, #0             ; Another counter, because why not?

convert_loop:
    LDRB R4, [R0, R2]      ; Load a byte from the hexadecimal input.
    CMP R4, #0             ; Compare the byte to zero (end of string).
    BEQ end_conversion     ; If zero, end the conversion process.

    ; Convert the hexadecimal digit to its binary equivalent.
    BL hex_to_bin          ; Call the conversion subroutine.
    
    ADD R2, R2, #1         ; Increment the counter.
    B convert_loop         ; Repeat the loop.

end_conversion:
    ; The grand finale! Print the binary output.
    MOV R7, #4             ; Syscall number for sys_write.
    MOV R0, #1             ; File descriptor 1 (stdout).
    LDR R1, =binary_output ; Load the address of the binary output.
    MOV R2, #64            ; Number of bytes to write.
    SWI 0                  ; Make the syscall.

    ; Exit the program.
    MOV R7, #1             ; Syscall number for sys_exit.
    MOV R0, #0             ; Exit code 0.
    SWI 0                  ; Make the syscall.

hex_to_bin:
    ; A subroutine to convert a single hexadecimal digit to binary.
    PUSH {LR}              ; Save the link register.
    
    ; The conversion magic happens here.
    CMP R4, #'0'
    BGE check_A
    SUB R4, R4, #'0'
    B store_binary

check_A:
    CMP R4, #'A'
    BGE convert_A_to_F
    SUB R4, R4, #'A' - 10
    B store_binary

convert_A_to_F:
    SUB R4, R4, #'A' - 10

store_binary:
    ; Store the binary equivalent in the output array.
    STRB R4, [R1, R3]
    ADD R3, R3, #1

    POP {LR}               ; Restore the link register.
    BX LR                  ; Return from the subroutine.

