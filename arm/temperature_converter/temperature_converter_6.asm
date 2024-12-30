; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic arithmetic operations and input/output handling in ARM Assembly.
; The program reads a temperature value and a character indicating the conversion type ('C' or 'F').
; It then performs the conversion and prints the result.

    .data
prompt1: .asciz "Enter temperature value: "
prompt2: .asciz "Enter conversion type (C/F): "
resultC: .asciz "Temperature in Celsius: %d\n"
resultF: .asciz "Temperature in Fahrenheit: %d\n"
input:   .space 4
type:    .space 1

    .text
    .global _start

_start:
    ; Print prompt for temperature value
    ldr r0, =prompt1
    bl  printf

    ; Read temperature value
    ldr r0, =input
    bl  scanf

    ; Print prompt for conversion type
    ldr r0, =prompt2
    bl  printf

    ; Read conversion type
    ldr r0, =type
    bl  scanf

    ; Load temperature value into r1
    ldr r1, =input
    ldr r1, [r1]

    ; Load conversion type into r2
    ldr r2, =type
    ldrb r2, [r2]

    ; Check conversion type and branch accordingly
    cmp r2, #'C'
    beq convert_to_celsius
    cmp r2, #'F'
    beq convert_to_fahrenheit

    ; Invalid conversion type, exit program
    b   exit

convert_to_celsius:
    ; Convert Fahrenheit to Celsius: C = (F - 32) * 5 / 9
    sub r1, r1, #32
    mov r3, #5
    mul r1, r1, r3
    mov r3, #9
    sdiv r1, r1, r3

    ; Print result in Celsius
    ldr r0, =resultC
    bl  printf
    b   exit

convert_to_fahrenheit:
    ; Convert Celsius to Fahrenheit: F = (C * 9 / 5) + 32
    mov r3, #9
    mul r1, r1, r3
    mov r3, #5
    sdiv r1, r1, r3
    add r1, r1, #32

    ; Print result in Fahrenheit
    ldr r0, =resultF
    bl  printf

exit:
    ; Exit program
    mov r7, #1
    svc 0

