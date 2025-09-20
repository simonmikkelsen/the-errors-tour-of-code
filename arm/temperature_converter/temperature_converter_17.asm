; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It is designed to help programmers understand ARM Assembly language.
; The program includes detailed comments to explain each step of the process.

.section .data
input_prompt: .asciz "Enter temperature in Celsius: "
output_prompt: .asciz "Temperature in Fahrenheit: "
newline: .asciz "\n"

.section .bss
.comm temp_c, 4
.comm temp_f, 4

.section .text
.global _start

_start:
    ; Print input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read temperature in Celsius
    bl read_integer
    mov r1, r0
    str r1, temp_c

    ; Convert Celsius to Fahrenheit
    ldr r1, temp_c
    bl celsius_to_fahrenheit
    str r0, temp_f

    ; Print output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print temperature in Fahrenheit
    ldr r0, temp_f
    bl print_integer

    ; Print newline
    ldr r0, =newline
    bl print_string

    ; Exit program
    mov r7, #1
    svc #0

; Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit:
    ; Formula: F = (C * 9/5) + 32
    mov r2, #9
    mul r0, r0, r2
    mov r2, #5
    sdiv r0, r0, r2
    add r0, r0, #32
    bx lr

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

; Function to read an integer
read_integer:
    mov r0, #0
    mov r7, #3
    svc #0
    bx lr

; Function to print an integer
print_integer:
    ; Convert integer to string and print
    mov r1, r0
    mov r2, #10
    mov r3, #0
    loop2:
        udiv r4, r1, r2
        mls r5, r4, r2, r1
        add r5, r5, #48
        strb r5, [sp, r3]
        add r3, r3, #1
        mov r1, r4
        cmp r1, #0
        bne loop2
    print_loop:
        sub r3, r3, #1
        ldrb r0, [sp, r3]
        mov r7, #4
        svc #0
        cmp r3, #0
        bne print_loop
    bx lr

