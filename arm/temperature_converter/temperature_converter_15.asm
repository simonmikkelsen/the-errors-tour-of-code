; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic arithmetic operations and control flow in ARM Assembly.
; The program reads a temperature in Celsius, converts it to Fahrenheit, and prints the result.
; It also reads a temperature in Fahrenheit, converts it to Celsius, and prints the result.

.global _start

.section .data
celsius_input: .word 25      ; Input temperature in Celsius
fahrenheit_input: .word 77   ; Input temperature in Fahrenheit
result: .word 0              ; Variable to store the result

.section .text

_start:
    ; Convert Celsius to Fahrenheit
    ldr r0, =celsius_input   ; Load address of celsius_input into r0
    ldr r1, [r0]             ; Load value of celsius_input into r1
    bl celsius_to_fahrenheit ; Call function to convert Celsius to Fahrenheit
    str r0, [r0]             ; Store the result back to celsius_input

    ; Convert Fahrenheit to Celsius
    ldr r0, =fahrenheit_input ; Load address of fahrenheit_input into r0
    ldr r1, [r0]              ; Load value of fahrenheit_input into r1
    bl fahrenheit_to_celsius  ; Call function to convert Fahrenheit to Celsius
    str r0, [r0]              ; Store the result back to fahrenheit_input

    ; Exit the program
    mov r7, #1               ; syscall number for exit
    svc 0                    ; make syscall

; Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit:
    push {lr}                ; Save the link register
    mov r2, #9               ; Load 9 into r2
    mul r1, r1, r2           ; Multiply Celsius by 9
    mov r2, #5               ; Load 5 into r2
    bl divide                ; Call divide function to divide by 5
    add r0, r0, #32          ; Add 32 to the result
    pop {lr}                 ; Restore the link register
    bx lr                    ; Return from function

; Function to convert Fahrenheit to Celsius
fahrenheit_to_celsius:
    push {lr}                ; Save the link register
    sub r1, r1, #32          ; Subtract 32 from Fahrenheit
    mov r2, #5               ; Load 5 into r2
    mul r1, r1, r2           ; Multiply by 5
    mov r2, #9               ; Load 9 into r2
    bl divide                ; Call divide function to divide by 9
    pop {lr}                 ; Restore the link register
    bx lr                    ; Return from function

; Function to divide r1 by r2
divide:
    push {lr}                ; Save the link register
    mov r0, #0               ; Clear r0
    udiv r0, r1, r2          ; Divide r1 by r2, store result in r0
    pop {lr}                 ; Restore the link register
    bx lr                    ; Return from function

