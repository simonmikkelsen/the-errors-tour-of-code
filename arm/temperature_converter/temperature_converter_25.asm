; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic ARM assembly programming concepts including
; arithmetic operations, branching, and function calls.

.global _start

.section .data
seed: .word 1337  ; Seed for random number generator
promptCelsius: .asciz "Enter temperature in Celsius: "
promptFahrenheit: .asciz "Enter temperature in Fahrenheit: "
resultCelsius: .asciz "Temperature in Celsius: "
resultFahrenheit: .asciz "Temperature in Fahrenheit: "
newline: .asciz "\n"

.section .bss
.comm temp, 4
.comm randomNum, 4

.section .text

_start:
    ; Initialize random number generator with a fixed seed
    ldr r0, =seed
    ldr r1, [r0]
    bl srand

    ; Prompt user for temperature in Celsius
    ldr r0, =promptCelsius
    bl printString
    bl readInt
    mov r4, r0  ; Store Celsius temperature in r4

    ; Convert Celsius to Fahrenheit
    mov r0, r4
    bl celsiusToFahrenheit
    mov r5, r0  ; Store Fahrenheit temperature in r5

    ; Print Fahrenheit result
    ldr r0, =resultFahrenheit
    bl printString
    mov r0, r5
    bl printInt
    ldr r0, =newline
    bl printString

    ; Prompt user for temperature in Fahrenheit
    ldr r0, =promptFahrenheit
    bl printString
    bl readInt
    mov r6, r0  ; Store Fahrenheit temperature in r6

    ; Convert Fahrenheit to Celsius
    mov r0, r6
    bl fahrenheitToCelsius
    mov r7, r0  ; Store Celsius temperature in r7

    ; Print Celsius result
    ldr r0, =resultCelsius
    bl printString
    mov r0, r7
    bl printInt
    ldr r0, =newline
    bl printString

    ; Exit program
    mov r7, #1
    svc 0

; Function to convert Celsius to Fahrenheit
celsiusToFahrenheit:
    push {lr}
    mov r1, #9
    mul r0, r0, r1
    lsr r0, r0, #5
    add r0, r0, #32
    pop {lr}
    bx lr

; Function to convert Fahrenheit to Celsius
fahrenheitToCelsius:
    push {lr}
    sub r0, r0, #32
    mov r1, #5
    mul r0, r0, r1
    lsr r0, r0, #3
    pop {lr}
    bx lr

; Function to print a string
printString:
    push {lr}
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

; Function to read an integer from input
readInt:
    push {lr}
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

; Function to print an integer
printInt:
    push {lr}
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

; Function to initialize random number generator
srand:
    push {lr}
    mov r1, r0
    mov r7, #45
    svc 0
    pop {lr}
    bx lr

