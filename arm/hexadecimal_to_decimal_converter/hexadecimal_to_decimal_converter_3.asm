; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The user will input a hexadecimal number, and the program will output the corresponding decimal number.
; The program demonstrates basic ARM assembly programming concepts, including loops, conditionals, and I/O operations.

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
    ; Print the prompt for hexadecimal input
    ldr r0, =hex_input
    bl print_string

    ; Read the hexadecimal input from the user
    ldr r0, =buffer
    bl read_string

    ; Convert the hexadecimal input to decimal
    ldr r0, =buffer
    bl hex_to_dec

    ; Print the result
    ldr r0, =dec_output
    bl print_string

    ; Print the decimal result
    ldr r0, =result
    bl print_number

    ; Print a newline character
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    svc #0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #32
    mov r7, #4
    svc #0
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r1, r0
    mov r2, #32
    mov r7, #3
    svc #0
    pop {lr}
    bx lr

; Function to convert hexadecimal to decimal
hex_to_dec:
    push {lr}
    mov r1, r0
    mov r2, #0
    mov r3, #0

hex_to_dec_loop:
    ldrb r4, [r1], #1
    cmp r4, #'0'
    blt hex_to_dec_done
    cmp r4, #'9'
    ble hex_to_dec_digit
    cmp r4, #'A'
    blt hex_to_dec_done
    cmp r4, #'F'
    ble hex_to_dec_letter

hex_to_dec_done:
    str r2, [r0]
    pop {lr}
    bx lr

hex_to_dec_digit:
    sub r4, r4, #'0'
    b hex_to_dec_common

hex_to_dec_letter:
    sub r4, r4, #'A'
    add r4, r4, #10

hex_to_dec_common:
    mov r5, #16
    mul r2, r2, r5
    add r2, r2, r4
    b hex_to_dec_loop

; Function to print a number
print_number:
    push {lr}
    mov r1, r0
    mov r2, #4
    mov r7, #4
    svc #0
    pop {lr}
    bx lr

