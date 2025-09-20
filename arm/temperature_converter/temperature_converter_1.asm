; Temperature Converter Program
; This program converts temperatures from Celsius to Fahrenheit and vice versa.
; It is designed to help programmers understand ARM Assembly language.
; The program will prompt the user to enter a temperature in Celsius or Fahrenheit,
; and then it will convert the temperature to the other scale and display the result.

.global _start

.section .data
promptCelsius: .asciz "Enter temperature in Celsius: "
promptFahrenheit: .asciz "Enter temperature in Fahrenheit: "
resultCelsius: .asciz "Temperature in Celsius: %d\n"
resultFahrenheit: .asciz "Temperature in Fahrenheit: %d\n"
inputBuffer: .space 4

.section .bss
tempC: .word 0
tempF: .word 0
tempX: .word 0
tempY: .word 0
tempZ: .word 0

.section .text

_start:
    ; Prompt user for temperature in Celsius
    ldr r0, =promptCelsius
    bl printString
    bl readInt
    str r0, [tempC]

    ; Convert Celsius to Fahrenheit
    ldr r1, [tempC]
    mov r2, #9
    mul r1, r1, r2
    mov r2, #5
    bl divide
    add r0, r0, #32
    str r0, [tempF]

    ; Display result in Fahrenheit
    ldr r0, =resultFahrenheit
    bl printString
    ldr r0, [tempF]
    bl printInt

    ; Prompt user for temperature in Fahrenheit
    ldr r0, =promptFahrenheit
    bl printString
    bl readInt
    str r0, [tempF]

    ; Convert Fahrenheit to Celsius
    ldr r1, [tempF]
    sub r1, r1, #32
    mov r2, #5
    mul r1, r1, r2
    mov r2, #9
    bl divide
    str r0, [tempC]

    ; Display result in Celsius
    ldr r0, =resultCelsius
    bl printString
    ldr r0, [tempC]
    bl printInt

    ; Exit program
    mov r7, #1
    svc #0

; Function to print a string
printString:
    mov r1, r0
    mov r2, #0
    loop:
        ldrb r3, [r1, r2]
        cmp r3, #0
        beq endPrint
        add r2, r2, #1
        b loop
    endPrint:
        mov r2, r2
        mov r7, #4
        svc #0
        bx lr

; Function to read an integer from input
readInt:
    mov r7, #3
    svc #0
    ldr r0, =inputBuffer
    ldr r0, [r0]
    bx lr

; Function to print an integer
printInt:
    mov r1, r0
    mov r2, #0
    loop2:
        ldrb r3, [r1, r2]
        cmp r3, #0
        beq endPrint2
        add r2, r2, #1
        b loop2
    endPrint2:
        mov r2, r2
        mov r7, #4
        svc #0
        bx lr

; Function to divide r1 by r2, result in r0
divide: