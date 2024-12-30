; Temperature Converter Program
; This program converts temperature from Celsius to Fahrenheit and vice versa.
; It is designed to help programmers understand ARM Assembly language.
; The program takes an input temperature and converts it to the other scale.
; The conversion formulas are:
;   Fahrenheit = (Celsius * 9/5) + 32
;   Celsius = (Fahrenheit - 32) * 5/9

.global _start

.section .data
input_temp: .word 25          @ Input temperature in Celsius
output_temp: .word 0          @ Output temperature after conversion
conversion_factor: .word 9    @ Conversion factor for Celsius to Fahrenheit
offset: .word 32              @ Offset for Fahrenheit conversion
temp_storage: .word 0         @ Temporary storage for intermediate calculations

.section .text
_start:
    LDR R0, =input_temp        @ Load address of input temperature
    LDR R1, [R0]               @ Load input temperature value into R1

    BL convert_to_fahrenheit   @ Call function to convert to Fahrenheit

    LDR R0, =output_temp       @ Load address of output temperature
    STR R1, [R0]               @ Store the converted temperature

    B end_program              @ Branch to end of program

convert_to_fahrenheit:
    LDR R2, =conversion_factor @ Load address of conversion factor
    LDR R2, [R2]               @ Load conversion factor value into R2
    MUL R1, R1, R2             @ Multiply input temperature by conversion factor

    LDR R3, =temp_storage      @ Load address of temporary storage
    STR R1, [R3]               @ Store intermediate result in temporary storage

    LDR R2, =offset            @ Load address of offset
    LDR R2, [R2]               @ Load offset value into R2
    ADD R1, R1, R2             @ Add offset to intermediate result

    BX LR                      @ Return from function

end_program:
    MOV R7, #1                 @ Exit system call
    SWI 0                      @ Software interrupt to exit program

