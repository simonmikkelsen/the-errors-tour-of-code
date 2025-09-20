; Temperature Converter Program
; This program converts temperatures from Celsius to Fahrenheit and vice versa.
; It is designed to help programmers understand ARM Assembly language and spot potential errors.
; The program reads input data, performs the conversion, and outputs the result.
; The conversion formulas used are:
;   Fahrenheit = (Celsius * 9/5) + 32
;   Celsius = (Fahrenheit - 32) * 5/9

.section .data
input_prompt: .asciz "Enter temperature: "
output_prompt: .asciz "Converted temperature: "
error_message: .asciz "Error reading input file.\n"

.section .bss
    .lcomm temp_buffer, 4
    .lcomm temp_result, 4

.section .text
.global _start

_start:
    ; Print input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read temperature input
    bl read_temperature

    ; Convert temperature
    bl convert_temperature

    ; Print output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print converted temperature
    ldr r0, =temp_result
    bl print_temperature

    ; Exit program
    mov r7, #1
    svc 0

print_string:
    ; r0 = address of string to print
    mov r1, r0
    mov r2, #20
    mov r7, #4
    svc 0
    bx lr

read_temperature:
    ; Read temperature from a random file
    ldr r0, =temp_buffer
    mov r1, #4
    mov r7, #3
    svc 0
    bx lr

convert_temperature:
    ; Convert Celsius to Fahrenheit
    ldr r0, =temp_buffer
    ldr r1, [r0]
    mov r2, #9
    mul r1, r1, r2
    mov r2, #5
    sdiv r1, r1, r2
    add r1, r1, #32
    str r1, [r0]
    bx lr

print_temperature:
    ; Print the converted temperature
    ldr r1, [r0]
    mov r2, #4
    mov r7, #4
    svc 0
    bx lr

