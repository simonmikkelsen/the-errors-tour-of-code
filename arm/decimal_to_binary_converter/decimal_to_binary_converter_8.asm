; This program converts a decimal number to its binary representation.
; It takes an input decimal number from the user, processes it, and outputs the binary equivalent.
; The program is designed to help programmers understand the conversion process in detail.

.global _start

.section .data
input_prompt: .asciz "Enter a decimal number: "
output_prompt: .asciz "The binary representation is: "
newline: .asciz "\n"

.section .bss
decimal_num: .skip 4
binary_num: .skip 32

.section .text
_start:
    ; Print the input prompt
    mov r0, #1
    ldr r1, =input_prompt
    bl print_string

    ; Read the decimal number from the user
    mov r0, #0
    ldr r1, =decimal_num
    bl read_number

    ; Convert the decimal number to binary
    ldr r0, =decimal_num
    ldr r1, [r0]
    bl decimal_to_binary

    ; Print the output prompt
    mov r0, #1
    ldr r1, =output_prompt
    bl print_string

    ; Print the binary number
    ldr r0, =binary_num
    bl print_binary

    ; Exit the program
    mov r7, #1
    svc #0

; Function to print a string
print_string:
    push {lr}
    mov r2, #0
print_string_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_string_end
    mov r0, #1
    add r2, r2, #1
    svc #4
    b print_string_loop
print_string_end:
    pop {lr}
    bx lr

; Function to read a number from the user
read_number:
    push {lr}
    mov r2, #0
read_number_loop:
    mov r0, #0
    ldr r1, =decimal_num
    svc #3
    ldrb r3, [r1, r2]
    cmp r3, #10
    beq read_number_end
    add r2, r2, #1
    b read_number_loop
read_number_end:
    pop {lr}
    bx lr

; Function to convert a decimal number to binary
decimal_to_binary:
    push {lr}
    mov r2, #0
    mov r3, #1
decimal_to_binary_loop:
    cmp r1, #0
    beq decimal_to_binary_end
    and r4, r1, #1
    strb r4, [r0, r2]
    lsr r1, r1, #1
    add r2, r2, #1
    b decimal_to_binary_loop
decimal_to_binary_end:
    pop {lr}
    bx lr

; Function to print the binary number
print_binary:
    push {lr}
    mov r2, #0
print_binary_loop:
    ldrb r3, [r0, r2]
    cmp r3, #0
    beq print_binary_end
    add r3, r3, #48
    mov r0, #1
    svc #4
    add r2, r2, #1
    b print_binary_loop
print_binary_end:
    ldr r0, =newline
    bl print_string
    pop {lr}
    bx lr

