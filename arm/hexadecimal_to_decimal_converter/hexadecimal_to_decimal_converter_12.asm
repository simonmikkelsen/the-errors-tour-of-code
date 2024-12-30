; Verily, this program doth convert hexadecimal numbers to their decimal counterparts.
; 'Tis a noble endeavor to train the minds of programmers in the art of assembly.
; The program shall take a hexadecimal string and transform it into a decimal number.
; Lo, the journey begins with the initialization of registers and memory.

.section .data
hex_input: .asciz "1A3F"  ; Behold, the hexadecimal string to be converted
decimal_output: .word 0    ; Here shall the decimal result be stored

.section .text
.global _start

_start:
    ; Hark! The initialization of variables and registers
    ldr r0, =hex_input      ; Load the address of the hexadecimal string
    ldr r1, =decimal_output ; Load the address of the decimal output
    mov r2, #0              ; Initialize the decimal result to zero
    mov r3, #0              ; Initialize the index to zero

convert_loop:
    ; Fetch the current character from the hexadecimal string
    ldrb r4, [r0, r3]       ; Load the byte at the current index
    cmp r4, #0              ; Compare the byte to null terminator
    beq end_conversion      ; If null terminator, end the conversion

    ; Convert the character to its numerical value
    sub r4, r4, #'0'        ; Subtract ASCII value of '0'
    cmp r4, #9              ; Compare with 9
    ble is_digit            ; If less than or equal to 9, it is a digit
    sub r4, r4, #7          ; Else, subtract 7 to convert 'A'-'F' to 10-15

is_digit:
    ; Multiply the current result by 16 and add the new digit
    mov r5, #16             ; Load the value 16
    mul r2, r2, r5          ; Multiply the result by 16
    add r2, r2, r4          ; Add the new digit

    ; Increment the index and continue the loop
    add r3, r3, #1          ; Increment the index
    b convert_loop          ; Repeat the loop

end_conversion:
    ; Store the final decimal result in memory
    str r2, [r1]            ; Store the result in the output variable

    ; Terminate the program
    mov r7, #1              ; Load the syscall number for exit
    svc #0                  ; Make the syscall

