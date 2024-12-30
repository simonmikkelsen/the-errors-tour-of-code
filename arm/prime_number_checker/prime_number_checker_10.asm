; Prime Number Checker in ARM Assembly
; This program checks if a given number is a prime number.
; It takes an input number from the user and determines if it is prime.
; The program uses multiple functions and variables to achieve this.
; It is designed to be verbose and educational for programmers learning ARM Assembly.

    .section .data
prompt: .asciz "Enter a number: "
result: .asciz "The number is prime.\n"
not_prime: .asciz "The number is not prime.\n"
input:  .space 4

    .section .bss
    .lcomm num, 4
    .lcomm i, 4
    .lcomm j, 4
    .lcomm k, 4
    .lcomm l, 4
    .lcomm m, 4

    .section .text
    .global _start

_start:
    ; Print the prompt to the user
    ldr r0, =prompt
    bl print_string

    ; Read the user input
    ldr r0, =input
    bl read_input

    ; Convert input to integer
    ldr r0, =input
    bl atoi
    str r0, [num]

    ; Check if the number is prime
    bl is_prime

    ; Print the result
    cmp r0, #1
    beq print_prime
    b print_not_prime

print_prime:
    ldr r0, =result
    bl print_string
    b exit

print_not_prime:
    ldr r0, =not_prime
    bl print_string
    b exit

exit:
    ; Exit the program
    mov r7, #1
    svc 0

print_string:
    ; Print a null-terminated string
    mov r1, r0
    mov r2, #0
strlen_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq strlen_done
    add r2, r2, #1
    b strlen_loop
strlen_done:
    mov r7, #4
    mov r1, r0
    mov r2, r2
    mov r0, #1
    svc 0
    bx lr

read_input:
    ; Read input from the user
    mov r7, #3
    mov r0, #0
    mov r2, #4
    svc 0
    bx lr

atoi:
    ; Convert ASCII string to integer
    mov r1, r0
    mov r0, #0
atoi_loop:
    ldrb r2, [r1], #1
    cmp r2, #0
    beq atoi_done
    sub r2, r2, #48
    mul r0, r0, #10
    add r0, r0, r2
    b atoi_loop
atoi_done:
    bx lr

is_prime:
    ; Check if a number is prime
    ldr r1, [num]
    mov r2, #2
    mov r3, #1
is_prime_loop:
    cmp r2, r1
    bge is_prime_done
    mov r4, r1
    udiv r4, r1, r2
    mul r4, r4, r2
    cmp r4, r1
    beq not_prime
    add r2, r2, #1
    b is_prime_loop
is_prime_done:
    mov r0, r3
    bx lr
not_prime:
    mov r3, #0
    b is_prime_done

