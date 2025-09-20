; This program converts a hexadecimal number to a decimal number.
; It is designed to help programmers understand the conversion process.
; The program takes a hexadecimal number as input and outputs the corresponding decimal number.
; The conversion is done by processing each digit of the hexadecimal number and calculating its decimal equivalent.
; The program uses a loop to process each digit and accumulates the result in a register.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; The hexadecimal number to be converted
len: .word 4              ; Length of the hexadecimal number

.section .bss
.comm result, 4           ; Variable to store the final decimal result

.section .text

_start:
    mov r0, #0            ; Initialize the result to 0
    ldr r1, =hex_input    ; Load the address of the hexadecimal input
    ldr r2, =len          ; Load the length of the hexadecimal input
    ldr r2, [r2]          ; Dereference the length
    mov r3, #0            ; Initialize the loop counter to 0

convert_loop:
    ldrb r4, [r1, r3]     ; Load the current hexadecimal digit
    cmp r4, #'0'          ; Compare the digit with '0'
    blt invalid_digit     ; If the digit is less than '0', it's invalid
    cmp r4, #'9'          ; Compare the digit with '9'
    ble valid_digit       ; If the digit is less than or equal to '9', it's valid
    cmp r4, #'A'          ; Compare the digit with 'A'
    blt invalid_digit     ; If the digit is less than 'A', it's invalid
    cmp r4, #'F'          ; Compare the digit with 'F'
    bgt invalid_digit     ; If the digit is greater than 'F', it's invalid

valid_digit:
    sub r4, r4, #'0'      ; Convert the ASCII digit to its numerical value
    cmp r4, #9            ; Compare the numerical value with 9
    ble process_digit     ; If the value is less than or equal to 9, process it
    sub r4, r4, #7        ; Adjust the value for hexadecimal digits A-F

process_digit:
    ldr r5, =16           ; Load the base (16) into r5
    mul r0, r0, r5        ; Multiply the current result by 16
    add r0, r0, r4        ; Add the current digit to the result
    add r3, r3, #1        ; Increment the loop counter
    cmp r3, r2            ; Compare the loop counter with the length