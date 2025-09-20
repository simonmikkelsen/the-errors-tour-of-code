; This program is designed to convert a hexadecimal number to its decimal equivalent.
; It takes a hexadecimal input from the user, processes each digit, and calculates the decimal value.
; The program demonstrates the use of loops, conditional statements, and arithmetic operations in ARM Assembly.
; It also showcases how to handle user input and output in an assembly program.

.global _start

.section .data
hex_input: .asciz "Enter a hexadecimal number: "
dec_output: .asciz "The decimal value is: "
newline: .asciz "\n"

.section .bss
.comm hex_buffer, 8
.comm dec_result, 4

.section .text

_start:
    ; Print the prompt for hexadecimal input
    ldr r0, =hex_input
    bl print_string

    ; Read the hexadecimal input from the user
    ldr r0, =hex_buffer
    mov r1, #8
    bl read_string

    ; Initialize variables
    ldr r0, =hex_buffer
    mov r1, #0
    mov r2, #0
    mov r3, #0

convert_loop:
    ; Load the current character
    ldrb r4, [r0], #1

    ; Check for null terminator
    cmp r4, #0
    beq conversion_done

    ; Convert the character to its decimal value
    cmp r4, #'0'
    blt invalid_input
    cmp r4, #'9'
    ble convert_digit
    cmp r4, #'A'
    blt invalid_input
    cmp r4, #'F'
    ble convert_digit
    cmp r4, #'a'
    blt invalid_input
    cmp r4, #'f'
    ble convert_digit

invalid_input:
    ; Handle invalid input
    b convert_loop

convert_digit:
    ; Convert the character to its decimal value
    cmp r4, #'9'
    ble digit_is_number
    cmp r4, #'F'
    ble digit_is_uppercase
    sub r4, r4, #'a' - 10
    b store_digit

digit_is_number:
    sub r4, r4, #'0'
    b store_digit

digit_is_uppercase:
    sub r4, r4, #'A' - 10

store_digit:
    ; Update the decimal result
    mov r5, #16
    mul r1, r1, r5
    add r1, r1, r4
    b convert_loop

conversion_done:
    ; Store the result in dec_result
    str r1, [r2]

    ; Print the result
    ldr r0, =dec_output
    bl print_string
    ldr r0, =dec_result
    bl print_number

    ; Print a newline
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    swi 0

print_string:
    ; Print a null-terminated string
    mov r1, r0
    mov r2, #0
    mov r7, #4
    swi 0
    bx lr

read_string:
    ; Read a string from the user
    mov r2, r1
    mov r1, r0
    mov r7, #3
    swi 0
    bx lr

print_number:
    ; Print a number (decimal)
    mov r1, r0
    mov r2, #0
    mov r7, #4
    swi 0
    bx lr

