; This program converts a hexadecimal number to a decimal number.
; The purpose of this program is to help programmers understand
; how to work with hexadecimal and decimal number systems in ARM Assembly.
; The program reads a hexadecimal number from memory, converts it to decimal,
; and stores the result back in memory.

.global _start

.section .data
hexNumber: .asciz "1A3F"  ; The hexadecimal number to be converted
decimalResult: .word 0     ; The result of the conversion

.section .text
_start:
    LDR R0, =hexNumber     ; Load the address of the hexadecimal number
    LDR R1, =decimalResult ; Load the address of the decimal result
    BL convertToBinary     ; Call the conversion function

    MOV R7, #1             ; Exit syscall number
    SVC 0                  ; Make syscall to exit

convertToBinary:
    PUSH {R4-R7, LR}       ; Save registers and link register
    MOV R2, #0             ; Initialize decimal result to 0
    MOV R3, #0             ; Initialize loop counter to 0
    MOV R4, #16            ; Base of hexadecimal system

loop:
    LDRB R5, [R0, R3]      ; Load a byte from the hexadecimal number
    CMP R5, #0             ; Check if end of string
    BEQ endLoop            ; If end of string, exit loop

    SUB R5, R5, #48        ; Convert ASCII to integer
    CMP R5, #9
    BLE validDigit
    SUB R5, R5, #7         ; Adjust for A-F

validDigit:
    MUL R2, R2, R4         ; Multiply current result by 16
    ADD R2, R2, R5         ; Add the current digit
    ADD R3, R3, #1         ; Move to the next character
    B loop                 ; Repeat the loop

endLoop:
    STR R2, [R1]           ; Store the result in memory
    POP {R4-R7, PC}        ; Restore registers and return

