; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It is designed to help programmers practice ARM Assembly and spot subtle errors.
; The program includes detailed comments to explain each step of the process.

.global _start

.section .data
celsius_input: .asciz "Enter temperature in Celsius: "
fahrenheit_output: .asciz "Temperature in Fahrenheit: %d\n"
buffer: .space 4

.section .bss
weather: .space 4

.section .text

_start:
    ; Print prompt for Celsius input
    ldr r0, =celsius_input
    bl printf

    ; Read Celsius input
    ldr r0, =buffer
    bl scanf

    ; Convert input to integer
    ldr r1, =buffer
    ldr r2, [r1]
    mov r3, r2

    ; Convert Celsius to Fahrenheit
    ; Formula: F = (C * 9/5) + 32
    mov r4, #9
    mul r3, r3, r4
    mov r4, #5
    sdiv r3, r3, r4
    add r3, r3, #32

    ; Store result in weather variable
    str r3, weather

    ; Print Fahrenheit output
    ldr r0, =fahrenheit_output
    ldr r1, weather
    bl printf

    ; Exit program
    mov r7, #1
    svc 0

