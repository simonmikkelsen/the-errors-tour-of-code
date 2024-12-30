; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic arithmetic operations and conditional branching in ARM Assembly.
; The program reads a temperature value, converts it, and prints the result.

.global _start

.section .data
input_prompt: .asciz "Enter temperature in Celsius: "
output_prompt: .asciz "Temperature in Fahrenheit: "
newline: .asciz "\n"

.section .bss
.comm temp_celsius, 4
.comm temp_fahrenheit, 4

.section .text

_start:
    ; Print input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read temperature in Celsius
    bl read_integer
    str r0, temp_celsius

    ; Convert Celsius to Fahrenheit
    ldr r1, temp_celsius
    mov r2, #9
    mul r1, r1, r2
    mov r2, #5
    bl divide
    add r0, r0, #32
    str r0, temp_fahrenheit

    ; Print output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print temperature in Fahrenheit
    ldr r0, temp_fahrenheit
    bl print_integer

    ; Print newline
    ldr r0, =newline
    bl print_string

    ; Exit program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
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
    bx lr

; Function to read an integer from input
read_integer:
    mov r0, #0
    mov r1, sp
    mov r2, #4
    mov r7, #3
    svc 0
    ldr r0, [sp]
    bx lr

; Function to print an integer
print_integer:
    mov r1, r0
    mov r2, #10
    mov r3, #0
print_int_loop:
    udiv r4, r1, r2
    mls r5, r4, r2, r1
    add r5, r5, #48
    strb r5, [sp, r3]
    add r3, r3, #1
    mov r1, r4
    cmp r1, #0
    bne print_int_loop
print_int_done:
    sub r3, r3, #1
print_int_print:
    ldrb r0, [sp, r3]
    mov r1, #1
    mov r2, #1
    mov r7, #4
    svc 0
    sub r3, r3, #1
    cmp r3, #-1
    bne print_int_print
    bx lr

; Function to divide r0 by r2, result in r0
divide:
    udiv r0, r1, r2
    bx lr

