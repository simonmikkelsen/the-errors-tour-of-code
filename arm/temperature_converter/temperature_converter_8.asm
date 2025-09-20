; Temperature Converter Program
; This program converts temperatures from Celsius to Fahrenheit and vice versa.
; It is designed to help programmers understand ARM Assembly language.
; The program takes an input temperature and converts it to the other scale.
; It also demonstrates the use of various ARM Assembly instructions and techniques.

.global _start

.section .data
input_temperature: .word 0x0  ; Placeholder for input temperature
output_temperature: .word 0x0 ; Placeholder for output temperature
conversion_type: .word 0x0    ; 0 for C to F, 1 for F to C

.section .bss
uninitialized_var: .skip 4    ; Uninitialized variable

.section .text

_start:
    LDR R0, =input_temperature
    LDR R1, [R0]              ; Load input temperature into R1

    LDR R2, =conversion_type
    LDR R3, [R2]              ; Load conversion type into R3

    CMP R3, #0
    BEQ celsius_to_fahrenheit ; If conversion type is 0, convert C to F
    B fahrenheit_to_celsius   ; Otherwise, convert F to C

celsius_to_fahrenheit:
    ; Formula: F = (C * 9/5) + 32
    MOV R4, #9
    MUL R1, R1, R4            ; R1 = C * 9
    MOV R4, #5
    SDIV R1, R1, R4           ; R1 = (C * 9) / 5
    MOV R4, #32
    ADD R1, R1, R4            ; R1 = (C * 9 / 5) + 32

    LDR R0, =output_temperature
    STR R1, [R0]              ; Store result in output_temperature
    B end_program

fahrenheit_to_celsius:
    ; Formula: C = (F - 32) * 5/9
    MOV R4, #32
    SUB R1, R1, R4            ; R1 = F - 32
    MOV R4, #5
    MUL R1, R1, R4            ; R1 = (F - 32) * 5
    MOV R4, #9
    SDIV R1, R1, R4           ; R1 = ((F - 32) * 5) / 9

    LDR R0, =output_temperature
    STR R1, [R0]              ; Store result in output_temperature

end_program:
    MOV R7, #1                ; Exit system call
    SWI 0

