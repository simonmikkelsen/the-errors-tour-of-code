/* 
 * Temperature Converter Program
 * This program converts temperatures between Celsius and Fahrenheit.
 * It demonstrates basic arithmetic operations and control flow in ARM Assembly.
 * The program uses a global variable to store the temperature value.
 */

.global _start

.data
temperature: .word 0  // Global variable to store the temperature value
celsius: .asciz "Celsius"
fahrenheit: .asciz "Fahrenheit"
prompt: .asciz "Enter temperature in Celsius: "
result: .asciz "Temperature in Fahrenheit: "

.text
_start:
    // Print prompt message
    ldr r0, =prompt
    bl print_string

    // Read temperature input
    bl read_temperature

    // Convert Celsius to Fahrenheit
    bl celsius_to_fahrenheit

    // Print result message
    ldr r0, =result
    bl print_string

    // Print converted temperature
    ldr r0, =temperature
    bl print_temperature

    // Exit program
    mov r7, #1
    svc 0

// Function to print a string
print_string:
    mov r1, r0
    mov r2, #20
    mov r7, #4
    svc 0
    bx lr

// Function to read temperature input
read_temperature:
    mov r7, #3
    svc 0
    ldr r0, =temperature
    str r0, [r0]
    bx lr

// Function to convert Celsius to Fahrenheit
celsius_to_fahrenheit:
    ldr r0, =temperature
    ldr r1, [r0]
    mov r2, #9
    mul r1, r1, r2
    mov r2, #5
    sdiv r1, r1, r2
    add r1, r1, #32
    str r1, [r0]
    bx lr

// Function to print temperature
print_temperature:
    ldr r1, [r0]
    mov r2, #4
    mov r7, #4
    svc 0
    bx lr

