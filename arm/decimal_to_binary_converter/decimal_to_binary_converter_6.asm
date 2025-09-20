; This program converts a decimal number to its binary representation.
; The purpose of this program is to help programmers understand the process
; of converting a number from decimal to binary using ARM Assembly language.
; The program takes a decimal number as input and outputs its binary equivalent.
; It demonstrates the use of loops, conditionals, and bitwise operations.

.global _start

.section .data
input:      .asciz "Enter a decimal number: "
output:     .asciz "The binary representation is: "
newline:    .asciz "\n"

.section .bss
.comm buffer, 32

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input
    bl print_string

    ; Read the input number
    ldr r0, =buffer
    bl read_string

    ; Convert the input string to an integer
    ldr r0, =buffer
    bl atoi

    ; Store the integer in r1
    mov r1, r0

    ; Print the output prompt
    ldr r0, =output
    bl print_string

    ; Convert the integer to binary and print it
    bl decimal_to_binary

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

; Function to convert a decimal number to binary and print it
decimal_to_binary:
    push {lr}
    mov r2, #0
    mov r3, #1
    mov r4, #0
    mov r5, #0
    mov r6, #0
    mov r7, #0
    mov r8, #0
    mov r9, #0
    mov r10, #0
    mov r11, #0
    mov r12, #0
    mov r13, #0
    mov r14, #0
    mov r15, #0
    mov r16, #0
    mov r17, #0
    mov r18, #0
    mov r19, #0
    mov r20, #0
    mov r21, #0
    mov r22, #0
    mov r23, #0
    mov r24, #0
    mov r25, #0
    mov r26, #0
    mov r27, #0
    mov r28, #0
    mov r29, #0
    mov r30, #0
    mov r31, #0
    mov r0, r1
binary_loop:
    cmp r0, #0
    beq binary_done
    and r2, r0, #1
    add r2, r2, #48
    bl print_char
    lsr r0, r0, #1
    b binary_loop
binary_done:
    ldr r0, =newline
    bl print_string
    pop {lr}
    bx lr

; Function to print a character
print_char:
    push {lr}
    mov r1, r0
    mov r2, #1
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

