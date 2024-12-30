; Program: Decimal to Binary Converter
; Purpose: This program converts a given decimal number into its binary representation.
; The program is designed to help programmers understand the conversion process and 
; practice their ARM Assembly programming skills. The program takes an input decimal 
; number, processes it, and outputs the corresponding binary number.

.global _start

.section .data
input:      .asciz "Enter a decimal number: "
output:     .asciz "The binary representation is: "
newline:    .asciz "\n"

.section .bss
.lcomm buffer, 32

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input
    bl print_string

    ; Read the input number
    bl read_number

    ; Convert the number to binary
    bl decimal_to_binary

    ; Print the output prompt
    ldr r0, =output
    bl print_string

    ; Print the binary number
    bl print_binary

    ; Exit the program
    mov r7, #1
    svc #0

print_string:
    ; r0 = address of the string to print
    mov r1, r0
    mov r2, #32
    mov r7, #4
    svc #0
    bx lr

read_number:
    ; Read a number from the user and store it in r1
    mov r0, #0
    ldr r1, =buffer
    mov r2, #32
    mov r7, #3
    svc #0
    ldr r1, =buffer
    bl atoi
    bx lr

atoi:
    ; Convert ASCII string to integer
    ; r0 = address of the string
    mov r2, #0
atoi_loop:
    ldrb r3, [r0], #1
    cmp r3, #0
    beq atoi_done
    sub r3, r3, #48
    mul r2, r2, #10
    add r2, r2, r3
    b atoi_loop
atoi_done:
    mov r0, r2
    bx lr

decimal_to_binary:
    ; Convert decimal number in r1 to binary and store in buffer
    mov r2, r1
    ldr r3, =buffer
    add r3, r3, #31
    mov r4, #0
    mov r5, #2
binary_loop:
    cmp r2, #0
    beq binary_done
    udiv r6, r2, r5
    mls r7, r6, r5, r2
    add r7, r7, #48
    strb r7, [r3], #-1
    mov r2, r6
    b binary_loop
binary_done:
    ldr r0, =buffer
    add r0, r0, #31
    bx lr

print_binary:
    ; Print the binary number stored in buffer
    ldr r1, =buffer
    add r1, r1, #31
print_binary_loop:
    ldrb r2, [r1], #-1
    cmp r2, #48
    blt print_binary_done
    mov r0, #1
    mov r7, #4
    svc #0
    b print_binary_loop
print_binary_done:
    ldr r0, =newline
    bl print_string
    bx lr

