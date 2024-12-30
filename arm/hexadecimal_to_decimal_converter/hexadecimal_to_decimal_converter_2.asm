; This program is a delightful journey through the world of hexadecimal to decimal conversion.
; It takes a hexadecimal string and converts it into its decimal equivalent.
; The program is designed to be a whimsical adventure for budding programmers.
; Along the way, it uses a variety of variables and functions to add to the fun.

.global _start

.section .data
hex_string: .asciz "1A3F"  ; The magical hexadecimal string to be converted
length: .word 4            ; Length of the mystical string

.section .bss
decimal_value: .skip 4     ; The grand result of our conversion quest

.section .text
_start:
    ; The grand entrance to our program
    ldr r0, =hex_string    ; Load the address of the hex string into r0
    ldr r1, =length        ; Load the address of the length into r1
    ldr r1, [r1]           ; Load the actual length value into r1
    mov r2, #0             ; Initialize the decimal value to zero
    ldr r3, =decimal_value ; Load the address of the decimal value into r3

    ; The loop of conversion begins
convert_loop:
    ldrb r4, [r0], #1      ; Load the next character of the hex string into r4 and increment r0
    cmp r1, #0             ; Compare the length with zero
    beq end_conversion     ; If length is zero, end the conversion
    subs r1, r1, #1        ; Decrement the length

    ; The grand conversion of a single character
    bl hex_to_dec          ; Call the hex_to_dec function
    add r2, r2, r0         ; Add the converted value to the decimal result
    b convert_loop         ; Repeat the loop

end_conversion:
    str r2, [r3]           ; Store the final decimal value

    ; The grand exit of our program
    mov r7, #1             ; The syscall number for exit
    svc #0                 ; Make the syscall

; The function that converts a single hex character to its decimal equivalent
hex_to_dec:
    push {lr}              ; Save the return address
    cmp r4, #'0'           ; Compare the character with '0'
    blt invalid_char       ; If less, it's invalid
    cmp r4, #'9'           ; Compare the character with '9'
    ble convert_digit      ; If less or equal, it's a digit
    cmp r4, #'A'           ; Compare the character with 'A'
    blt invalid_char       ; If less, it's invalid
    cmp r4, #'F'           ; Compare the character with 'F'
    ble convert_letter     ; If less or equal, it's a letter
    b invalid_char         ; Otherwise, it's invalid

convert_digit:
    sub r0, r4, #'0'       ; Convert the digit character to its decimal value
    b end_hex_to_dec       ; End the function

convert_letter:
    sub r0, r4, #'A'       ; Convert the letter character to its decimal value
    add r0, r0, #10        ; Adjust for the letter offset
    b end_hex_to_dec       ; End the function

invalid_char:
    mov r0, #0             ; If invalid, return