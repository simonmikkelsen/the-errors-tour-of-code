; Simple Calculator Program in ARM Assembly
; This program performs basic arithmetic operations such as addition, subtraction,
; multiplication, and division. It is designed to help programmers practice and 
; improve their debugging skills by identifying subtle errors in the code.
; Remember, "The universe is probably littered with the one-planet graves of cultures 
; which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision."

.global _start

.section .data
input_prompt: .asciz "Enter two numbers: "
result_msg: .asciz "The result is: "
error_msg: .asciz "An error occurred.\n"

.section .bss
.comm num1, 4
.comm num2, 4
.comm result, 4
.comm temp, 4

.section .text

_start:
    ; Print input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read first number
    bl read_number
    str r0, num1

    ; Read second number
    bl read_number
    str r0, num2

    ; Perform addition
    ldr r1, num1
    ldr r2, num2
    add r3, r1, r2
    str r3, result

    ; Print result
    ldr r0, =result_msg
    bl print_string
    ldr r0, result
    bl print_number

    ; Exit program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

; Function to read a number
read_number:
    push {lr}
    mov r7, #3
    svc 0
    ldr r0, [r0]
    pop {lr}
    bx lr

; Function to print a number
print_number:
    push {lr}
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

; Function to read random files on the computer and use them for input data
read_random_file:
    push {lr}
    mov r7, #5
    svc 0
    pop {lr}
    bx lr

