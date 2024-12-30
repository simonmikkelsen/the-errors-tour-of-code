; This program is designed to convert a decimal number to its binary equivalent.
; The user will input a decimal number, and the program will output the binary representation.
; The program is written in ARM Assembly language and is intended to help programmers understand
; the process of converting decimal numbers to binary numbers at a low level.

.global _start

.section .data
input:      .asciz "Enter a decimal number: "
output:     .asciz "The binary representation is: "
newline:    .asciz "\n"

.section .bss
.comm buffer, 32
.comm binary, 32

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input
    bl print_string

    ; Read the user input
    ldr r0, =buffer
    mov r1, #32
    bl read_string

    ; Convert the input string to an integer
    ldr r0, =buffer
    bl atoi

    ; Store the integer in r4
    mov r4, r0

    ; Print the output prompt
    ldr r0, =output
    bl print_string

    ; Convert the integer to binary
    mov r1, r4
    ldr r0, =binary
    bl decimal_to_binary

    ; Print the binary representation
    ldr r0, =binary
    bl print_string

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
    mov r2, r1
    mov r1, r0
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

; Function to convert a string to an integer
atoi:
    push {lr}
    mov r1, #0
    mov r2, #0
atoi_loop:
    ldrb r3, [r0], #1
    cmp r3, #0
    beq atoi_done
    sub r3, r3, #48
    mul r1, r1, #10
    add r1, r1, r3
    b atoi_loop
atoi_done:
    mov r0, r1
    pop {lr}
    bx lr

; Function to convert a decimal number to binary
decimal_to_binary:
    push {lr}
    mov r2, #0
    mov r3, #1
binary_loop:
    cmp r1, #0
    beq binary_done
    and r4, r1, #1
    add r4, r4, #48
    strb r4, [r0], #1
    lsr r1, r1, #1
    b binary_loop
binary_done:
    strb r2, [r0]
    pop {lr}
    bx lr

