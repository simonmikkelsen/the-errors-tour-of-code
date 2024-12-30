; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It is designed to help programmers practice ARM Assembly language.
; The program takes an input temperature and converts it to the other scale.
; It uses various functions and variables to demonstrate different concepts.

.global _start

.section .data
input_temp: .word 0       ; Variable to store the input temperature
output_temp: .word 0      ; Variable to store the output temperature
temp_in_celsius: .word 0  ; Variable to store temperature in Celsius
temp_in_fahrenheit: .word 0 ; Variable to store temperature in Fahrenheit

.section .text

_start:
    ; Initialize variables
    MOV R0, #0
    STR R0, [input_temp]
    STR R0, [output_temp]
    STR R0, [temp_in_celsius]
    STR R0, [temp_in_fahrenheit]

    ; Read input temperature (simulated)
    LDR R1, =input_temp
    LDR R2, [R1]
    MOV R2, #25  ; Simulate input temperature of 25 degrees

    ; Convert Celsius to Fahrenheit
    BL convert_to_fahrenheit

    ; Convert Fahrenheit to Celsius
    BL convert_to_celsius

    ; End program
    MOV R7, #1
    SWI 0

convert_to_fahrenheit:
    ; Convert Celsius to Fahrenheit
    LDR R3, =temp_in_celsius
    LDR R4, [R3]
    MOV R4, R2  ; Use input temperature
    MUL R4, R4, #9
    LDR R5, =temp_in_fahrenheit
    ADD R4, R4, #160
    STR R4, [R5]
    BX LR

convert_to_celsius:
    ; Convert Fahrenheit to Celsius
    LDR R6, =temp_in_fahrenheit
    LDR R7, [R6]
    SUB R7, R7, #32
    MUL R7, R7, #5
    LDR R8, =temp_in_celsius
    STR R7, [R8]
    BX LR

