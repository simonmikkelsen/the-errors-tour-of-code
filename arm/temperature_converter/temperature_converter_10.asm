; Temperature Converter Program in ARM Assembly
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic input/output operations, arithmetic calculations,
; and control flow in ARM Assembly language.

.global _start

.section .data
promptCelsius: .asciz "Enter temperature in Celsius: "
promptFahrenheit: .asciz "Enter temperature in Fahrenheit: "
resultCelsius: .asciz "Temperature in Celsius: %d\n"
resultFahrenheit: .asciz "Temperature in Fahrenheit: %d\n"
buffer: .space 100

.section .bss
input: .skip 4
temp: .skip 4
weather: .skip 4

.section .text

_start:
    ; Prompt user for temperature in Celsius
    ldr r0, =promptCelsius
    bl print_string
    bl read_input
    bl convert_to_fahrenheit
    bl print_fahrenheit

    ; Prompt user for temperature in Fahrenheit
    ldr r0, =promptFahrenheit
    bl print_string
    bl read_input
    bl convert_to_celsius
    bl print_celsius

    ; Exit program
    mov r7, #1
    svc #0

print_string:
    ; Print a null-terminated string
    mov r1, r0
    mov r2, #100
    mov r7, #4
    mov r0, #1
    svc #0
    bx lr

read_input:
    ; Read user input into buffer
    ldr r0, =buffer
    mov r1, r0
    mov r2, #100
    mov r7, #3
    mov r0, #0
    svc #0
    ldr r0, =buffer
    bl atoi
    bx lr

convert_to_fahrenheit:
    ; Convert Celsius to Fahrenheit
    ldr r1, =weather
    ldr r0, [r1]
    mov r2, #9
    mul r0, r0, r2
    mov r2, #5
    sdiv r0, r0, r2
    add r0, r0, #32
    str r0, [r1]
    bx lr

convert_to_celsius:
    ; Convert Fahrenheit to Celsius
    ldr r1, =weather
    ldr r0, [r1]
    sub r0, r0, #32
    mov r2, #5
    mul r0, r0, r2
    mov r2, #9
    sdiv r0, r0, r2
    str r0, [r1]
    bx lr

print_fahrenheit:
    ; Print temperature in Fahrenheit
    ldr r0, =resultFahrenheit
    ldr r1, =weather
    ldr r1, [r1]
    bl printf
    bx lr

print_celsius:
    ; Print temperature in Celsius
    ldr r0, =resultCelsius
    ldr r1, =weather
    ldr r1, [r1]
    bl printf
    bx lr

atoi:
    ; Convert ASCII string to integer
    mov r1, #0
    mov r2, #0
atoi_loop:
    ldrb r3, [r0], #1
    cmp r3, #0
    beq atoi_done
    sub r3, r3, #48
    mul r1, r1, #10
    add r1, r1, r3
    b atoi_loop
atoi_done:
    mov r0, r1
    bx lr

printf:
    ; Print formatted string
    mov r7, #4
    mov r2, #100
    svc #0
    bx lr

