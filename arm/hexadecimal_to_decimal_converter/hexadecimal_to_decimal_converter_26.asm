; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The program will take a hexadecimal input from the user, process it, and output the decimal value.
; It is intended to help programmers understand the conversion process and practice ARM Assembly language.

.global _start

.section .data
hex_input: .asciz "Enter a hexadecimal number: "
dec_output: .asciz "The decimal value is: %d\n"
buffer: .space 10

.section .bss
.lcomm result, 4
.lcomm temp, 4
.lcomm random_seed, 4

.section .text

_start:
    ; Print the prompt to the user
    ldr r0, =hex_input
    bl print_string

    ; Read the user input
    ldr r0, =buffer
    bl read_string

    ; Initialize variables
    ldr r1, =buffer
    mov r2, #0
    mov r3, #0
    ldr r4, =result
    str r2, [r4]

    ; Convert the hexadecimal input to decimal
convert_loop:
    ldrb r5, [r1], #1
    cmp r5, #0
    beq end_conversion

    ; Check if the character is a digit
    cmp r5, #'0'
    blt invalid_input
    cmp r5, #'9'
    ble is_digit

    ; Check if the character is a letter (A-F)
    cmp r5, #'A'
    blt invalid_input
    cmp r5, #'F'
    ble is_letter

invalid_input:
    ; Handle invalid input
    b end_program

is_digit:
    ; Convert digit to its decimal value
    sub r5, r5, #'0'
    b process_digit

is_letter:
    ; Convert letter to its decimal value
    sub r5, r5, #'A'
    add r5, r5, #10

process_digit:
    ; Update the result
    ldr r6, =result
    ldr r7, [r6]
    mov r8, #16
    mul r7, r7, r8
    add r7, r7, r5
    str r7, [r6]
    b convert_loop

end_conversion:
    ; Print the result
    ldr r0, =dec_output
    ldr r1, =result
    ldr r1, [r1]
    bl print_decimal

end_program:
    ; Exit the program
    mov r7, #1
    swi 0

print_string:
    ; Print a null-terminated string
    mov r1, r0
    mov r2, #100
    mov r7, #4
    swi 0
    bx lr

read_string:
    ; Read a string from the user
    mov r1, r0
    mov r2, #10
    mov r7, #3
    swi 0
    bx lr

print_decimal:
    ; Print a decimal number
    mov r2, r1
    mov r1, r0
    mov r0, #1
    mov r7, #4
    swi 0
    bx lr

