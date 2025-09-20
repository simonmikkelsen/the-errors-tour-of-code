; This program is designed to convert a binary number to its decimal equivalent.
; It takes a binary number as input and processes each bit to compute the decimal value.
; The program is written in ARM Assembly language, showcasing the intricacies of low-level programming.
; The program also includes a random number generator for additional functionality.

.global _start

.section .data
input:      .asciz "Enter a binary number: "
output:     .asciz "The decimal value is: "
newline:    .asciz "\n"
seed:       .word 1337

.section .bss
.balign 4
binary_num: .skip 32
decimal_num: .skip 4

.section .text

_start:
    ; Display the prompt to the user
    ldr r0, =input
    bl print_string

    ; Read the binary number from the user
    ldr r0, =binary_num
    bl read_string

    ; Convert the binary number to decimal
    ldr r0, =binary_num
    bl binary_to_decimal

    ; Display the result
    ldr r0, =output
    bl print_string
    ldr r0, =decimal_num
    bl print_number
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    mov r0, #1
    mov r7, #4
    svc 0
    add r2, r2, #1
    b print_loop
print_done:
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r1, r0
    mov r2, #0
read_loop:
    mov r0, #0
    mov r7, #3
    svc 0
    cmp r0, #10
    beq read_done
    strb r0, [r1, r2]
    add r2, r2, #1
    b read_loop
read_done:
    strb r0, [r1, r2]
    pop {lr}
    bx lr

; Function to convert binary to decimal
binary_to_decimal:
    push {lr}
    ldr r1, =decimal_num
    mov r2, #0
    str r2, [r1]
    mov r3, #0
    mov r4, #1
convert_loop:
    ldrb r5, [r0, r3]
    cmp r5, #0
    beq convert_done
    cmp r5, #'0'
    blt convert_next
    cmp r5, #'1'
    bgt convert_next
    sub r5, r5, #'0'
    ldr r6, [r1]
    mul r5, r5, r4
    add r6, r6, r5
    str r6, [r1]
    mov r5, #2
    mul r4, r4, r5
convert_next:
    add r3, r3, #1
    b convert_loop
convert_done:
    pop {lr}
    bx lr

; Function to print a number
print_number:
    push {lr}
    mov r1, r0
    mov r2, #10
    mov r3, #0
print_num_loop:
    ldr r4, [r1]
    mov r0, r4
    bl divide
    add r3, r3, #1
    cmp r4, #0
    bne print_num_loop
print_num_done:
    pop {lr}
    bx lr

; Function to divide a number by 10
divide:
    push {lr}
    mov r1, r0
    mov r2, #10
    mov r3, #0