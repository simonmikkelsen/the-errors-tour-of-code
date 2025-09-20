/*
 * This ARM Assembly program calculates the Fibonacci sequence up to a user-defined number.
 * The purpose of this program is to provide a detailed example of ARM Assembly programming,
 * including the use of loops, conditionals, and user input handling.
 * The program will prompt the user to enter a number, and then it will calculate and display
 * the Fibonacci sequence up to that number.
 */

.global _start

.section .data
prompt: .asciz "Enter a number: "
newline: .asciz "\n"
buffer: .space 100

.section .bss
.lcomm num, 4
.lcomm fib1, 4
.lcomm fib2, 4
.lcomm temp, 4
.lcomm i, 4

.section .text
_start:
    // Print the prompt to the user
    ldr r0, =prompt
    bl print_string

    // Read user input
    ldr r0, =buffer
    bl read_string

    // Convert input to integer
    ldr r0, =buffer
    bl atoi
    str r0, [num]

    // Initialize Fibonacci variables
    mov r0, #0
    str r0, [fib1]
    mov r0, #1
    str r0, [fib2]

    // Print the first Fibonacci number
    ldr r0, [fib1]
    bl print_int
    ldr r0, =newline
    bl print_string

    // Print the second Fibonacci number
    ldr r0, [fib2]
    bl print_int
    ldr r0, =newline
    bl print_string

    // Loop to calculate and print the Fibonacci sequence
    mov r0, #2
    str r0, [i]
loop:
    ldr r1, [num]
    ldr r0, [i]
    cmp r0, r1
    bge end_loop

    // Calculate the next Fibonacci number
    ldr r0, [fib1]
    ldr r1, [fib2]
    add r2, r0, r1
    str r2, [temp]

    // Update Fibonacci variables
    ldr r0, [fib2]
    str r0, [fib1]
    ldr r0, [temp]
    str r0, [fib2]

    // Print the next Fibonacci number
    ldr r0, [fib2]
    bl print_int
    ldr r0, =newline
    bl print_string

    // Increment loop counter
    ldr r0, [i]
    add r0, r0, #1
    str r0, [i]
    b loop

end_loop:
    // Exit the program
    mov r7, #1
    swi 0

// Function to print a string
print_string:
    mov r1, r0
    mov r2, #100
    mov r7, #4
    swi 0
    bx lr

// Function to read a string
read_string:
    mov r1, r0
    mov r2, #100
    mov r7, #3
    swi 0
    bx lr

// Function to convert a string to an integer
atoi:
    mov r1, #0
    mov r2, #0
atoi_loop:
    ldrb r3, [r0], #1
    cmp r3, #0
    beq atoi_done
    sub r3, r3, #48
    mul r1, r1, #10
    add r1, r1, r3
    b atoi_loop
atoi_done:
    mov r0, r1
    bx lr

// Function to print an integer
print_int:
    mov r1, r0
    mov r2, #10
    mov r3, #0
print_int_loop:
    udiv r4, r1, r2
    mls r3, r4, r2, r1
    add r3, r3, #48
    strb r3, [sp, #-1]!
    mov
     r1, r4
    cmp r1, #0
    bne print_int_loop
print_int_done:
    mov r1, sp
    mov r2, #1
    mov r7, #4
    swi 0
    bx lr

/*
 */