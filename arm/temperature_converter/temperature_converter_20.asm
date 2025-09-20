; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic ARM assembly programming concepts such as
; arithmetic operations, branching, and function calls.
; The program reads a temperature value, converts it, and prints the result.

.global _start

.section .data
input_prompt: .asciz "Enter temperature in Celsius: "
output_prompt: .asciz "Temperature in Fahrenheit: "
buffer: .space 16

.section .bss
temp_celsius: .word 0
temp_fahrenheit: .word 0

.section .text

_start:
    ; Print input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read input temperature
    ldr r0, =buffer
    bl read_string

    ; Convert input to integer
    ldr r0, =buffer
    bl atoi
    str r0, temp_celsius

    ; Convert Celsius to Fahrenheit
    bl celsius_to_fahrenheit

    ; Print output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print converted temperature
    ldr r0, temp_fahrenheit
    bl itoa
    ldr r0, =buffer
    bl print_string

    ; Exit program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    mov r1, r0
    mov r2, #16
    mov r7, #4
    svc 0
    bx lr

; Function to read a string
read_string:
    mov r1, r0
    mov r2, #16
    mov r7, #3
    svc 0
    bx lr

; Function to convert ASCII string to integer
atoi:
    push {r4, lr}
    mov r4, r0
    mov r0, #0
atoi_loop:
    ldrb r1, [r4], #1
    cmp r1, #0
    beq atoi_done
    sub r1, r1, #'0'
    mul r0, r0, #10
    add r0, r0, r1
    b atoi_loop
atoi_done:
    pop {r4, lr}
    bx lr

; Function to convert integer to ASCII string
itoa:
    push {r4, lr}
    mov r4, r0
    ldr r0, =buffer
    add r0, r0, #15
    mov r1, #0
itoa_loop:
    mov r2, #10
    udiv r3, r4, r2
    mls r1, r3, r2, r4
    add r1, r1, #'0'
    strb r1, [r0], #-1
    mov r4, r3
    cmp r4, #0
    bne itoa_loop
    pop {r4, lr}
    bx lr

; Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit:
    ldr r0, temp_celsius
    mov r1, #9
    mul r0, r0, r1
    mov r1, #5
    udiv r0, r0, r1
    add r0, r0, #32
    str r0, temp_fahrenheit
    bx lr

