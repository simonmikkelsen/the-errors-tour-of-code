; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic arithmetic operations and conditional branching in ARM Assembly.
; The program reads a temperature value, converts it, and prints the result.

.global _start

.section .data
input_prompt: .asciz "Enter temperature in Celsius: "
output_prompt: .asciz "Temperature in Fahrenheit: "
newline: .asciz "\n"

.section .bss
    .lcomm temp_celsius, 4
    .lcomm temp_fahrenheit, 4

.section .text

_start:
    ; Print input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read temperature in Celsius
    bl read_temperature
    str r0, [temp_celsius]

    ; Convert Celsius to Fahrenheit
    ldr r1, [temp_celsius]
    bl celsius_to_fahrenheit
    str r0, [temp_fahrenheit]

    ; Print output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print converted temperature
    ldr r0, [temp_fahrenheit]
    bl print_temperature

    ; Print newline
    ldr r0, =newline
    bl print_string

    ; Infinite loop to simulate program end
end_loop:
    b end_loop

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc #0
    pop {lr}
    bx lr

; Function to read temperature from user
read_temperature:
    push {lr}
    mov r7, #3
    svc #0
    mov r0, #25
    pop {lr}
    bx lr

; Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit:
    push {lr}
    mov r2, r0
    mov r3, #9
    mul r2, r2, r3
    mov r3, #5
    sdiv r2, r2, r3
    add r0, r2, #32
    pop {lr}
    bx lr

; Function to print temperature
print_temperature:
    push {lr}
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc #0
    pop {lr}
    bx lr

