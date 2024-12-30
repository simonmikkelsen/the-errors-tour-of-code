; This program converts a decimal number to its binary representation.
; The purpose of this program is to help programmers understand the process
; of converting a decimal number to binary using ARM Assembly language.
; The program takes an input decimal number and outputs its binary equivalent.
; The program is written with verbose comments to aid in understanding.

.global _start

.section .data
input:      .asciz "Enter a decimal number: "
output:     .asciz "Binary representation: "
newline:    .asciz "\n"

.section .bss
.comm decimal, 4
.comm binary, 32

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input
    bl print_string

    ; Read the decimal number from the user
    bl read_decimal

    ; Convert the decimal number to binary
    bl decimal_to_binary

    ; Print the output prompt
    ldr r0, =output
    bl print_string

    ; Print the binary representation
    bl print_binary

    ; Exit the program
    mov r7, #1
    svc #0

print_string:
    ; Print a null-terminated string
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    mov r0, #1
    add r2, r2, #1
    svc #0
    b print_loop
print_done:
    bx lr

read_decimal:
    ; Read a decimal number from the user
    mov r0, #0
    mov r1, decimal
    mov r2, #4
    svc #0
    ldr r0, decimal
    bx lr

decimal_to_binary:
    ; Convert the decimal number to binary
    mov r1, #0
    mov r2, #1
    mov r3, #32
convert_loop:
    cmp r3, #0
    beq convert_done
    and r4, r0, r2
    cmp r4, #0
    beq skip_set
    orr r1, r1, r2
skip_set:
    lsr r0, r0, #1
    lsl r2, r2, #1
    sub r3, r3, #1
    b convert_loop
convert_done:
    str r1, binary
    bx lr

print_binary:
    ; Print the binary representation
    ldr r0, binary
    mov r1, #32
print_binary_loop:
    cmp r1, #0
    beq print_binary_done
    lsr r2, r0, #31
    add r2, r2, #'0'
    mov r0, #1
    svc #0
    lsl r0, r0, #1
    sub r1, r1, #1
    b print_binary_loop
print_binary_done:
    ldr r0, =newline
    bl print_string
    bx lr

