/* 
 * Prime Number Checker in ARM Assembly
 * This program checks if a given number is a prime number.
 * It uses a variety of techniques and verbose comments to help programmers understand the flow.
 * The program is designed to be educational and demonstrate ARM Assembly programming.
 */

.global _start

.section .data
input_number: .word 29  // The number to be checked for primality
result: .asciz "The number is prime.\n"
not_prime: .asciz "The number is not prime.\n"

.section .bss
.comm temp, 4
.comm i, 4
.comm j, 4
.comm k, 4
.comm l, 4
.comm m, 4
.comm n, 4
.comm o, 4
.comm p, 4
.comm q, 4

.section .text

_start:
    // Load the input number
    ldr r0, =input_number
    ldr r1, [r0]

    // Check if the number is less than 2
    mov r2, #2
    cmp r1, r2
    blt not_prime_label

    // Initialize loop variables
    mov r3, #2
    mov r4, r1

check_loop:
    // Check if r3 * r3 > r1
    mul r5, r3, r3
    cmp r5, r1
    bgt prime_label

    // Check if r1 % r3 == 0
    mov r6, r1
    mov r7, r3
    bl mod_function
    cmp r0, #0
    beq not_prime_label

    // Increment r3
    add r3, r3, #1
    b check_loop

prime_label:
    // Print "The number is prime."
    ldr r0, =result
    bl print_string
    b end_program

not_prime_label:
    // Print "The number is not prime."
    ldr r0, =not_prime
    bl print_string

end_program:
    // Exit the program
    mov r7, #1
    swi 0

mod_function:
    // Function to calculate r0 = r6 % r7
    // Uses a simple subtraction loop
    mov r0, r6
    mod_loop:
        cmp r0, r7
        blt mod_done
        sub r0, r0, r7
        b mod_loop
    mod_done:
        bx lr

print_string:
    // Function to print a string
    mov r1, r0
    mov r2, #20  // Assume the string length is 20 for simplicity
    mov r7, #4
    swi 0
    bx lr

/*
*/