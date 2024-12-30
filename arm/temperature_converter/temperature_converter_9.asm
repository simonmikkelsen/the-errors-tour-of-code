; Temperature Converter Program
; This program converts temperatures from Celsius to Fahrenheit and vice versa.
; It is designed to help programmers understand ARM Assembly language and practice debugging.
; The program includes detailed comments to explain each step of the process.

.section .data
input_prompt: .asciz "Enter temperature: "
output_prompt: .asciz "Converted temperature: "
celsius_prompt: .asciz "Enter 1 for Celsius to Fahrenheit, 2 for Fahrenheit to Celsius: "
newline: .asciz "\n"

.section .bss
.comm temp_input, 4
.comm temp_output, 4
.comm conversion_choice, 4

.section .text
.global _start

_start:
    ; Print the conversion choice prompt
    ldr r0, =celsius_prompt
    bl print_string

    ; Read the conversion choice
    bl read_integer
    str r0, conversion_choice

    ; Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read the temperature input
    bl read_integer
    str r0, temp_input

    ; Load the conversion choice
    ldr r1, conversion_choice

    ; Check if the choice is 1 (Celsius to Fahrenheit)
    cmp r1, #1
    beq celsius_to_fahrenheit

    ; Check if the choice is 2 (Fahrenheit to Celsius)
    cmp r1, #2
    beq fahrenheit_to_celsius

    ; Invalid choice, exit program
    b exit

celsius_to_fahrenheit:
    ; Load the temperature input
    ldr r0, temp_input

    ; Convert Celsius to Fahrenheit: F = (C * 9/5) + 32
    mov r1, #9
    mul r0, r0, r1
    mov r1, #5
    sdiv r0, r0, r1
    add r0, r0, #32

    ; Store the converted temperature
    str r0, temp_output
    b print_output

fahrenheit_to_celsius:
    ; Load the temperature input
    ldr r0, temp_input

    ; Convert Fahrenheit to Celsius: C = (F - 32) * 5/9
    sub r0, r0, #32
    mov r1, #5
    mul r0, r0, r1
    mov r1, #9
    sdiv r0, r0, r1

    ; Store the converted temperature
    str r0, temp_output
    b print_output

print_output:
    ; Print the output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Load the converted temperature
    ldr r0, temp_output
    bl print_integer

    ; Print a newline
    ldr r0, =newline
    bl print_string

exit:
    ; Exit the program
    mov r7, #1
    svc #0

; Function to print a string
print_string:
    mov r1, r0
    mov r2, #0
    loop:
        ldrb r3, [r1, r2]
        cmp r3, #0
        beq end
        mov r0, #1
        mov r7, #4
        svc #0
        add r2, r2, #1
        b loop
    end:
        bx lr

; Function to read an integer from input
read_integer:
    mov r0, #0
    mov r7, #3
    svc #0
    bx lr

; Function to print an integer
print_integer:
    ; Placeholder for integer printing logic
    bx lr

