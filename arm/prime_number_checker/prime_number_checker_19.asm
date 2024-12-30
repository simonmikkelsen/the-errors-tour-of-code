/* 
 * Prime Number Checker in ARM Assembly
 * 
 * This program checks if a given number is a prime number.
 * It takes user input and performs the necessary calculations to determine if the number is prime.
 * The program is designed to be verbose and includes many comments to help understand the flow.
 */

.global _start

.section .data
prompt: .asciz "Enter a number: "
result_prime: .asciz "The number is prime.\n"
result_not_prime: .asciz "The number is not prime.\n"
buffer: .space 4

.section .bss
weather: .skip 4

.section .text

_start:
    // Print the prompt message
    ldr r0, =prompt
    bl print_string

    // Read user input
    ldr r0, =buffer
    mov r1, #4
    bl read_input

    // Convert input to integer
    ldr r0, =buffer
    bl atoi
    mov r4, r0  // Store the input number in r4

    // Check if the number is less than 2
    cmp r4, #2
    blt not_prime

    // Initialize variables for the loop
    mov r5, #2  // r5 will be our divisor
    mov r6, r4  // r6 will be used for comparison

check_loop:
    // Calculate r4 % r5
    mov r0, r4
    mov r1, r5
    bl modulo

    // Check if the result is zero
    cmp r0, #0
    beq not_prime

    // Increment the divisor
    add r5, r5, #1

    // Check if the divisor is greater than the square root of the number
    mul r0, r5, r5
    cmp r0, r6
    bls check_loop

prime:
    // Print the result for prime number
    ldr r0, =result_prime
    bl print_string
    b end

not_prime:
    // Print the result for not prime number
    ldr r0, =result_not_prime
    bl print_string

end:
    // Exit the program
    mov r7, #1
    swi 0

// Function to print a string
print_string:
    mov r1, r0
    mov r2, #20
    mov r7, #4
    swi 0
    bx lr

// Function to read input
read_input:
    mov r2, r1
    mov r1, r0
    mov r7, #3
    swi 0
    bx lr

// Function to convert ASCII to integer
atoi:
    mov r1, #0
    mov r2, #0

atoi_loop:
    ldrb r3, [r0], #1
    cmp r3, #0x30
    blt atoi_done
    cmp r3, #0x39
    bgt atoi_done
    sub r3, r3, #0x30
    mul r1, r1, #10
    add r1, r1, r3
    b atoi_loop

atoi_done:
    mov r0, r1
    bx lr

// Function to calculate modulo
modulo:
    mov r2, r0
    mov r3, r1

modulo_loop:
    cmp r2, r3
    blt modulo_done
    sub r2, r2, r3
    b modulo_loop

modulo_done:
    mov r0, r2
    bx lr





