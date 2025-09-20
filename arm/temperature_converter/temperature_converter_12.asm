; Temperature Converter Program
; This program converts temperatures from Celsius to Fahrenheit and vice versa.
; It is designed to help programmers understand ARM Assembly language and practice debugging.
; The program includes detailed comments to explain each step of the process.

.section .data
    celsius_input: .word 0
    fahrenheit_input: .word 0
    result: .word 0
    temp_storage: .word 0

.section .text
.global _start

_start:
    ; Load Celsius temperature from memory
    ldr r0, =celsius_input
    ldr r1, [r0]

    ; Convert Celsius to Fahrenheit
    bl celsius_to_fahrenheit

    ; Store the result in memory
    str r0, [r0]

    ; Load Fahrenheit temperature from memory
    ldr r2, =fahrenheit_input
    ldr r3, [r2]

    ; Convert Fahrenheit to Celsius
    bl fahrenheit_to_celsius

    ; Store the result in memory
    str r3, [r2]

    ; Exit the program
    mov r7, #1
    svc 0

; Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit:
    ; Formula: F = C * 9/5 + 32
    mov r2, #9
    mul r1, r1, r2
    mov r2, #5
    bl divide
    add r0, r0, #32
    bx lr

; Function to convert Fahrenheit to Celsius
fahrenheit_to_celsius:
    ; Formula: C = (F - 32) * 5/9
    sub r3, r3, #32
    mov r4, #5
    mul r3, r3, r4
    mov r4, #9
    bl divide
    bx lr

; Function to divide r1 by r2 and store the result in r0
divide:
    ; Perform integer division
    udiv r0, r1, r2
    bx lr

