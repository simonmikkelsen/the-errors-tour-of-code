/* 
 * Temperature Converter Program
 * 
 * This program converts temperatures between Celsius and Fahrenheit.
 * It demonstrates basic arithmetic operations and control flow in ARM Assembly.
 * The program reads a temperature value in Celsius, converts it to Fahrenheit,
 * and then prints the result.
 */

.global _start

.section .data
input_prompt: .asciz "Enter temperature in Celsius: "
output_prompt: .asciz "Temperature in Fahrenheit is: "
newline: .asciz "\n"

.section .bss
.comm celsius, 4
.comm fahrenheit, 4

.section .text

_start:
    // Print input prompt
    ldr r0, =input_prompt
    bl print_string

    // Read temperature in Celsius
    bl read_integer
    str r0, [celsius]

    // Convert Celsius to Fahrenheit
    ldr r1, [celsius]
    bl celsius_to_fahrenheit
    str r0, [fahrenheit]

    // Print output prompt
    ldr r0, =output_prompt
    bl print_string

    // Print Fahrenheit value
    ldr r0, [fahrenheit]
    bl print_integer

    // Print newline
    ldr r0, =newline
    bl print_string

    // Exit program
    mov r7, #1
    svc 0

// Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit:
    // Formula: F = (C * 9/5) + 32
    mov r2, #9
    mul r0, r0, r2
    mov r2, #5
    bl divide
    add r0, r0, #32
    bx lr

// Function to divide r0 by r2
divide:
    udiv r0, r0, r2
    bx lr

// Function to print a string
print_string:
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc 0
    bx lr

// Function to read an integer
read_integer:
    mov r7, #3
    svc 0
    bx lr

// Function to print an integer
print_integer:
    // Convert integer to string and print
    bx lr

