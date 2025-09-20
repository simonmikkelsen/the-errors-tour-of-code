; This program converts a hexadecimal number to its decimal equivalent.
; It is designed to help programmers understand the process of conversion
; from one numeral system to another. The program reads a hexadecimal number
; from the user, processes it, and outputs the corresponding decimal number.
; The program is written in ARM Assembly language.

.global _start

.section .data
hex_input: .asciz "Enter a hexadecimal number: "
dec_output: .asciz "The decimal equivalent is: "
newline: .asciz "\n"

.section .bss
    .lcomm buffer, 32
    .lcomm result, 4

.section .text

_start:
    ; Print the prompt to enter a hexadecimal number
    ldr r0, =hex_input
    bl print_string

    ; Read the hexadecimal number from the user
    ldr r0, =buffer
    bl read_string

    ; Convert the hexadecimal number to decimal
    ldr r0, =buffer
    bl hex_to_dec

    ; Print the result
    ldr r0, =dec_output
    bl print_string

    ; Print the decimal result
    ldr r0, =result
    bl print_number

    ; Print a newline
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #32
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r1, r0
    mov r2, #32
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

; Function to convert hexadecimal to decimal
hex_to_dec:
    push {lr}
    mov r1, r0
    mov r2, #0
    mov r3, #0

convert_loop:
    ldrb r4, [r1], #1
    cmp r4, #'0'
    blt end_convert
    cmp r4, #'9'
    ble convert_digit
    cmp r4, #'A'
    blt end_convert
    cmp r4, #'F'
    ble convert_letter
    cmp r4, #'a'
    blt end_convert
    cmp r4, #'f'
    ble convert_letter_lower
    b end_convert

convert_digit:
    sub r4, r4, #'0'
    b convert_common

convert_letter:
    sub r4, r4, #'A'
    add r4, r4, #10
    b convert_common

convert_letter_lower:
    sub r4, r4, #'a'
    add r4, r4, #10

convert_common:
    lsl r2, r2, #4
    add r2, r2, r4
    b convert_loop

end_convert:
    str r2, [r3]
    pop {lr}
    bx lr

; Function to print a number
print_number: