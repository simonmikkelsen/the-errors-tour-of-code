/*
 * This ARM Assembly program calculates the factorial of a number.
 * The purpose of this program is to demonstrate the use of loops,
 * conditional statements, and user input in ARM Assembly.
 * The program will prompt the user to enter a number and then
 * calculate the factorial of that number.
 */

.global _start

.section .data
prompt: .asciz "Enter a number: "
result_msg: .asciz "The factorial is: "
newline: .asciz "\n"

.section .bss
.comm number, 4
.comm factorial, 4
.comm temp, 4

.section .text

_start:
    // Print the prompt message
    ldr r0, =prompt
    bl print_string

    // Read user input
    bl read_input

    // Convert input to integer
    bl atoi

    // Store the input number in a variable
    str r0, [number]

    // Initialize factorial to 1
    mov r1, #1
    str r1, [factorial]

    // Load the input number
    ldr r2, [number]

    // Loop to calculate factorial
factorial_loop:
    cmp r2, #1
    ble end_factorial_loop

    // Multiply factorial by the current number
    ldr r3, [factorial]
    mul r3, r3, r2
    str r3, [factorial]

    // Decrement the number
    subs r2, r2, #1
    b factorial_loop

end_factorial_loop:
    // Print the result message
    ldr r0, =result_msg
    bl print_string

    // Load the factorial result
    ldr r0, [factorial]
    bl itoa

    // Print the factorial result
    bl print_string

    // Print a newline
    ldr r0, =newline
    bl print_string

    // Exit the program
    mov r7, #1
    svc 0

// Function to print a string
print_string:
    mov r1, r0
    mov r2, #0
print_string_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_string_end
    mov r0, #1
    mov r7, #4
    svc 0
    add r2, r2, #1
    b print_string_loop
print_string_end:
    bx lr

// Function to read user input
read_input:
    mov r0, #0
    ldr r1, =number
    mov r2, #4
    mov r7, #3
    svc 0
    bx lr

// Function to convert ASCII to integer
atoi:
    ldr r1, =number
    ldrb r0, [r1]
    sub r0, r0, #48
    bx lr

// Function to convert integer to ASCII
itoa:
    add r0, r0, #48
    bx lr

/*
 */










 