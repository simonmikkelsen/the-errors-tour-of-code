; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The program reads a hexadecimal number from the user, processes it, and outputs the decimal value.
; It is intended to help programmers understand the conversion process and practice ARM Assembly language.

.global _start

.section .data
hex_input: .asciz "Enter a hexadecimal number: "
dec_output: .asciz "The decimal value is: "
buffer: .space 10

.section .bss
.lcomm result, 4
.lcomm temp, 4

.section .text
_start:
    ; Print the prompt to the user
    ldr r0, =hex_input
    bl print_string

    ; Read the hexadecimal input from the user
    ldr r0, =buffer
    bl read_string

    ; Convert the hexadecimal input to decimal
    ldr r0, =buffer
    bl hex_to_dec

    ; Print the result to the user
    ldr r0, =dec_output
    bl print_string

    ldr r0, =result
    bl print_number

    ; Exit the program
    mov r7, #1
    svc #0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc #0
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r1, r0
    mov r2, #10
    mov r7, #3
    svc #0
    pop {lr}
    bx lr

; Function to convert hexadecimal to decimal
hex_to_dec:
    push {lr}
    mov r2, #0
    mov r3, #0

convert_loop:
    ldrb r1, [r0], #1
    cmp r1, #'0'
    blt end_convert
    cmp r1, #'9'
    ble convert_digit
    cmp r1, #'A'
    blt end_convert
    cmp r1, #'F'
    bgt end_convert

convert_digit:
    sub r1, r1, #'0'
    cmp r1, #9
    ble valid_digit
    sub r1, r1, #7

valid_digit:
    mov r4, r2
    lsl r2, r2, #4
    add r2, r2, r1
    b convert_loop

end_convert:
    str r2, =result
    pop {lr}
    bx lr

; Function to print a number
print_number:
    push {lr}
    mov r1, r0
    mov r2, #10
    mov r7, #4
    svc #0
    pop {lr}
    bx lr