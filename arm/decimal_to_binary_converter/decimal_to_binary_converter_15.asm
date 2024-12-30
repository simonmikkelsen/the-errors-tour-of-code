; Program: Decimal to Binary Converter
; This program converts a given decimal number into its binary representation.
; The purpose of this program is to help programmers understand the process of
; converting decimal numbers to binary and to practice ARM Assembly programming.
; The program reads a decimal number from the user, performs the conversion, and
; prints the binary result.

.global _start

.section .data
input_prompt: .asciz "Enter a decimal number: "
output_prompt: .asciz "The binary representation is: "
newline: .asciz "\n"

.section .bss
.comm decimal_input, 4
.comm binary_output, 32
.comm temp_var, 4

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read the decimal input from the user
    bl read_decimal

    ; Convert the decimal number to binary
    bl decimal_to_binary

    ; Print the output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print the binary result
    bl print_binary

    ; Exit the program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #20
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

; Function to read a decimal number from the user
read_decimal:
    push {lr}
    mov r0, #0
    ldr r1, =decimal_input
    mov r2, #4
    mov r7, #3
    svc 0
    ldr r0, =decimal_input
    ldr r0, [r0]
    pop {lr}
    bx lr

; Function to convert a decimal number to binary
decimal_to_binary:
    push {lr}
    ldr r1, =decimal_input
    ldr r1, [r1]
    ldr r2, =binary_output
    mov r3, #31
    mov r4, #0

convert_loop:
    cmp r1, #0
    beq end_convert
    and r4, r1, #1
    strb r4, [r2, r3]
    lsr r1, r1, #1
    sub r3, r3, #1
    b convert_loop

end_convert:
    pop {lr}
    bx lr

; Function to print the binary result
print_binary:
    push {lr}
    ldr r0, =binary_output
    mov r1, r0
    mov r2, #32
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

