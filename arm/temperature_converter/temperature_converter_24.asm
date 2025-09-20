; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic ARM assembly programming concepts such as
; arithmetic operations, branching, and function calls.
; The program reads a temperature value from the user, converts it,
; and prints the result.

.global _start

.section .data
promptCelsius: .asciz "Enter temperature in Celsius: "
promptFahrenheit: .asciz "Enter temperature in Fahrenheit: "
resultCelsius: .asciz "Temperature in Celsius: %d\n"
resultFahrenheit: .asciz "Temperature in Fahrenheit: %d\n"
buffer: .space 16

.section .bss
tempC: .word 0
tempF: .word 0

.section .text

_start:
    ; Print prompt for Celsius input
    ldr r0, =promptCelsius
    bl print_string

    ; Read Celsius input
    ldr r0, =buffer
    bl read_string
    bl atoi
    str r0, tempC

    ; Convert Celsius to Fahrenheit
    ldr r0, tempC
    bl celsius_to_fahrenheit
    str r0, tempF

    ; Print Fahrenheit result
    ldr r0, =resultFahrenheit
    ldr r1, tempF
    bl printf

    ; Print prompt for Fahrenheit input
    ldr r0, =promptFahrenheit
    bl print_string

    ; Read Fahrenheit input
    ldr r0, =buffer
    bl read_string
    bl atoi
    str r0, tempF

    ; Convert Fahrenheit to Celsius
    ldr r0, tempF
    bl fahrenheit_to_celsius
    str r0, tempC

    ; Print Celsius result
    ldr r0, =resultCelsius
    ldr r1, tempC
    bl printf

    ; Exit program
    mov r7, #1
    svc #0

; Function to print a string
print_string:
    mov r1, r0
    mov r2, #16
    mov r7, #4
    svc #0
    bx lr

; Function to read a string
read_string:
    mov r1, r0
    mov r2, #16
    mov r7, #3
    svc #0
    bx lr

; Function to convert string to integer
atoi:
    ; Implementation of atoi
    bx lr

; Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit:
    ; Formula: F = C * 9 / 5 + 32
    mov r1, #9
    mul r0, r0, r1
    mov r1, #5
    bl divide
    add r0, r0, #32
    bx lr

; Function to convert Fahrenheit to Celsius
fahrenheit_to_celsius:
    ; Formula: C = (F - 32) * 5 / 9
    sub r0, r0, #32
    mov r1, #5
    mul r0, r0, r1
    mov r1, #9
    bl divide
    bx lr

; Function to divide r0 by r1
divide:
    ; Implementation of division
    bx lr

; Function to print formatted string
printf:
    ; Implementation of printf
    bx lr

