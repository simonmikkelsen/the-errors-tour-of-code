; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic arithmetic operations and conditional branching in ARM Assembly.
; The program reads a temperature value from the user, converts it, and prints the result.
; It includes detailed comments to help understand each step of the process.

.global _start

.section .data
promptCelsius: .asciz "Enter temperature in Celsius: "
promptFahrenheit: .asciz "Enter temperature in Fahrenheit: "
resultCelsius: .asciz "Temperature in Celsius: %d\n"
resultFahrenheit: .asciz "Temperature in Fahrenheit: %d\n"
buffer: .space 16

.section .bss
temp: .word 0
tempF: .word 0
tempC: .word 0

.section .text

_start:
    ; Print prompt for Celsius input
    ldr r0, =promptCelsius
    bl print_string

    ; Read Celsius input
    ldr r0, =buffer
    bl read_string

    ; Convert input to integer
    ldr r0, =buffer
    bl atoi
    str r0, [tempC]

    ; Convert Celsius to Fahrenheit
    ldr r1, [tempC]
    mov r2, #9
    mul r1, r1, r2
    mov r2, #5
    bl divide
    add r0, r0, #32
    str r0, [tempF]

    ; Print Fahrenheit result
    ldr r0, =resultFahrenheit
    ldr r1, [tempF]
    bl printf

    ; Print prompt for Fahrenheit input
    ldr r0, =promptFahrenheit
    bl print_string

    ; Read Fahrenheit input
    ldr r0, =buffer
    bl read_string

    ; Convert input to integer
    ldr r0, =buffer
    bl atoi
    str r0, [tempF]

    ; Convert Fahrenheit to Celsius
    ldr r1, [tempF]
    sub r1, r1, #32
    mov r2, #5
    mul r1, r1, r2
    mov r2, #9
    bl divide
    str r0, [tempC]

    ; Print Celsius result
    ldr r0, =resultCelsius
    ldr r1, [tempC]
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

; Function to convert ASCII string to integer
atoi:
    mov r1, #0
atoi_loop:
    ldrb r2, [r0], #1
    cmp r2, #0
    beq atoi_done
    sub r2, r2, #48
    mul r1, r1, #10
    add r1, r1, r2
    b atoi_loop
atoi_done:
    mov r0, r1
    bx lr

; Function to perform integer division
divide:
    mov r3, #0
divide_loop:
    subs r1, r1, r2
    add r3, r3, #1
    bge divide_loop
    mov r0, r3
    bx lr

