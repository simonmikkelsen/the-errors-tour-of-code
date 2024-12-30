; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to help programmers understand ARM Assembly language.
; The program reads input data, processes it, and outputs whether the number is prime.
; The program includes detailed comments to explain each step.

.global _start

.section .data
input_number: .word 0
result: .asciz "The number is prime.\n"
not_prime: .asciz "The number is not prime.\n"
file_path: .asciz "/dev/urandom" ; Path to the random file

.section .bss
.comm buffer, 4

.section .text

_start:
    ; Open the random file
    ldr r0, =file_path
    mov r1, #0      ; Read-only mode
    svc #5          ; sys_open
    mov r7, r0      ; Store file descriptor in r7

    ; Read data from the file
    mov r0, r7      ; File descriptor
    ldr r1, =buffer ; Buffer to store data
    mov r2, #4      ; Number of bytes to read
    svc #3          ; sys_read

    ; Load the input number from the buffer
    ldr r0, =buffer
    ldr r1, [r0]
    str r1, [r0, #0] ; Store the input number

    ; Check if the number is less than 2
    cmp r1, #2
    blt not_prime_label

    ; Initialize variables
    mov r2, #2      ; Start divisor
    mov r3, r1      ; Copy of input number

check_prime_loop:
    ; Divide the number by the divisor
    mov r0, r3
    mov r1, r2
    bl divide       ; Call divide function

    ; Check if the remainder is zero
    cmp r1, #0
    beq not_prime_label

    ; Increment the divisor
    add r2, r2, #1

    ; Check if the divisor is greater than the square root of the number
    mul r4, r2, r2
    cmp r4, r3
    bls check_prime_loop

    ; If no divisors were found, the number is prime
    ldr r0, =result
    bl print_string
    b end_program

not_prime_label:
    ; The number is not prime
    ldr r0, =not_prime
    bl print_string

end_program:
    ; Exit the program
    mov r0, #0
    svc #1          ; sys_exit

divide:
    ; Divide r0 by r1 and return the quotient in r0 and remainder in r1
    udiv r0, r0, r1
    mls r1, r0, r1, r3
    bx lr

print_string:
    ; Print the string pointed to by r0
    mov r1, r0
    mov r2, #20     ; Length of the string
    mov r0, #1      ; File descriptor (stdout)
    svc #4          ; sys_write
    bx lr

