; Temperature Converter Program
; This program converts temperatures from Celsius to Fahrenheit and vice versa.
; It is designed to help programmers understand ARM Assembly language.
; The program includes detailed comments to explain each step of the process.

.global _start

.section .data
celsius_input: .word 25  ; Example input temperature in Celsius
fahrenheit_input: .word 77  ; Example input temperature in Fahrenheit
result: .word 0  ; Variable to store the conversion result

.section .text

_start:
    ; Load the Celsius input value
    ldr r0, =celsius_input
    ldr r1, [r0]

    ; Convert Celsius to Fahrenheit
    bl celsius_to_fahrenheit

    ; Store the result
    ldr r0, =result
    str r2, [r0]

    ; Load the Fahrenheit input value
    ldr r0, =fahrenheit_input
    ldr r1, [r0]

    ; Convert Fahrenheit to Celsius
    bl fahrenheit_to_celsius

    ; Store the result
    ldr r0, =result
    str r2, [r0]

    ; Exit the program
    mov r7, #1
    svc 0

; Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit:
    ; Formula: F = (C * 9/5) + 32
    mov r2, r1  ; Copy Celsius value to r2
    mov r3, #9
    mul r2, r2, r3  ; r2 = C * 9
    mov r3, #5
    bl divide  ; r2 = (C * 9) / 5
    mov r3, #32
    add r2, r2, r3  ; r2 = (C * 9/5) + 32
    bx lr

; Function to convert Fahrenheit to Celsius
fahrenheit_to_celsius:
    ; Formula: C = (F - 32) * 5/9
    mov r2, r1  ; Copy Fahrenheit value to r2
    mov r3, #32
    sub r2, r2, r3  ; r2 = F - 32
    mov r3, #5
    mul r2, r2, r3  ; r2 = (F - 32) * 5
    mov r3, #9
    bl divide  ; r2 = ((F - 32) * 5) / 9
    bx lr

; Function to divide r2 by r3
divide:
    ; Perform integer division
    mov r0, r2
    mov r1, r3
    bl __aeabi_idiv  ; Call ARM's integer division routine
    mov r2, r0  ; Store the result in r2
    bx lr

