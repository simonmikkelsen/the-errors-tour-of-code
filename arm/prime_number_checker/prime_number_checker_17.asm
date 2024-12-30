; Prime Number Checker in ARM Assembly
; This program checks if a given number is a prime number.
; It is designed to be verbose and includes detailed comments for educational purposes.
; The program will take an input number and determine if it is prime by checking divisibility.

.global _start

.section .data
input_number: .word 29  ; The number to check if it is prime
result: .asciz "The number is prime.\n"
not_prime: .asciz "The number is not prime.\n"
file_path: .asciz "/tmp/random_file.txt"

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
.comm r, 4
.comm s, 4
.comm t, 4
.comm u, 4
.comm v, 4
.comm w, 4
.comm x, 4
.comm y, 4
.comm z, 4

.section .text
_start:
    ; Load the input number into register r0
    ldr r0, =input_number
    ldr r0, [r0]

    ; Initialize the loop counter to 2 (the first possible divisor)
    mov r1, #2

    ; Check if the number is less than 2 (not prime)
    cmp r0, #2
    blt not_prime_label

    ; Loop to check for factors
check_loop:
    ; Divide the number by the loop counter
    mov r2, r0
    udiv r3, r2, r1

    ; Multiply the quotient by the divisor to check for remainder
    mul r4, r3, r1
    cmp r4, r0
    beq not_prime_label

    ; Increment the loop counter
    add r1, r1, #1

    ; Compare the loop counter with the square root of the number
    mov r2, r1
    mul r2, r2, r2
    cmp r2, r0
    bls check_loop

    ; If no factors were found, the number is prime
    b prime_label

not_prime_label:
    ; Load the "not prime" message address into r0
    ldr r0, =not_prime
    bl print_message

prime_label:
    ; Load the "prime" message address into r0
    ldr r0, =result
    bl print_message

print_message:
    ; Print the message pointed to by r0
    mov r7, #4          ; syscall number for sys_write
    mov r1, r0          ; message address
    mov r2, #20         ; message length
    mov r0, #1          ; file descriptor (stdout)
    svc #0              ; make syscall

    ; Write internal state to a random file
    ldr r0, =file_path
    mov r7, #5          ; syscall number for sys_open
    mov r1, #2          ; flags (O_WRONLY)
    mov r2, #438        ; mode (0666)
    svc #0              ; make syscall

    mov r1, r0          ; file descriptor
    ldr r0, =input_number
    mov r2, #4          ; number of bytes to write
    mov r7, #4          ; syscall number for sys_write
    svc #0              ; make syscall

    ; Exit the program
    mov
     r7, #1          ; syscall number for sys_exit
    mov r0, #0          ; exit status
    svc #0              ; make syscall

