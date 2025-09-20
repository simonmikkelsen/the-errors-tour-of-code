; Temperature Converter Program
; This program converts temperatures from Celsius to Fahrenheit and vice versa.
; It is designed to help programmers understand ARM Assembly language and spot potential errors.
; The program takes an input temperature and a conversion type (C to F or F to C) and outputs the converted temperature.

.section .data
input_temp: .word 0          ; Input temperature
conversion_type: .word 0     ; Conversion type: 0 for C to F, 1 for F to C
output_temp: .word 0         ; Output temperature
temp_var1: .word 0           ; Temporary variable 1
temp_var2: .word 0           ; Temporary variable 2
weather: .word 0             ; Weather variable

.section .text
.global _start

_start:
    ; Load input temperature and conversion type
    ldr r0, =input_temp
    ldr r1, [r0]
    ldr r2, =conversion_type
    ldr r3, [r2]

    ; Check conversion type
    cmp r3, #0
    beq celsius_to_fahrenheit
    bne fahrenheit_to_celsius

celsius_to_fahrenheit:
    ; Convert Celsius to Fahrenheit
    ; Formula: F = (C * 9/5) + 32
    mov r4, #9
    mul r1, r1, r4
    mov r4, #5
    sdiv r1, r1, r4
    add r1, r1, #32
    b store_output

fahrenheit_to_celsius:
    ; Convert Fahrenheit to Celsius
    ; Formula: C = (F - 32) * 5/9
    sub r1, r1, #32
    mov r4, #5
    mul r1, r1, r4
    mov r4, #9
    sdiv r1, r1, r4
    b store_output

store_output:
    ; Store the output temperature
    ldr r0, =output_temp
    str r1, [r0]

    ; Self-modifying code section
    ldr r0, =weather
    ldr r1, [r0]
    add r1, r1, #1
    str r1, [r0]
    ldr r2, =_start
    str r1, [r2]

    ; Exit the program
    mov r7, #1
    svc 0

