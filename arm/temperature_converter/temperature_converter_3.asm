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
    ldr r0, temp_celsius
    bl celsius_to_fahrenheit
    str r0, temp_fahrenheit

    ; Print output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print converted temperature
    ldr r0, temp_fahrenheit
    bl print_int

    ; Exit program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #16
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r1, r0
    mov r2, #16
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

; Function to convert string to integer
atoi:
    push {lr}
    mov r1, r0
    mov r0, #0
atoi_loop:
    ldrb r2, [r1], #1
    cmp r2, #0
    beq atoi_done
    sub r2, r2, #48
    mul r0, r0, #10
    add r0, r0, r2
    b atoi_loop
atoi_done:
    pop {lr}
    bx lr

; Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit:
    push {lr}
    mov r1, r0
    mul r0, r0, #9
    bl divide_by_5
    add r0, r0, #32
    pop {lr}
    bx lr

; Function to divide by 5
divide_by_5:
    push {lr}
    mov r1, #5
    udiv r0, r0, r1
    pop {lr}
    bx lr

; Function to print an integer
print_int:
    push {lr}
    mov r1, r0
    bl itoa
    ldr r0, =buffer
    bl print_string
    pop {lr}
    bx lr

; Function to convert integer to string
itoa:
    push {lr}
    mov r2, r0
    ldr r0, =buffer
    add r0, r0, #15
    mov r1, #0
itoa_loop:
    udiv r3, r2, #10
    mls r1, r3, #10, r2
    add r1, r1, #48
    strb r1, [r0], #-1
    mov r2, r3
    cmp