; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The user will input a hexadecimal number, and the program will output the corresponding decimal number.
; This program is written in ARM Assembly language and is intended to help programmers understand
; the process of converting between number systems at a low level.
; The program will also demonstrate the use of various ARM Assembly instructions and techniques.

.global _start

.section .data
prompt: .asciz "Enter a hexadecimal number: "
result_msg: .asciz "The decimal equivalent is: "
newline: .asciz "\n"

.section .bss
input: .space 100
decimal_result: .word 0

.section .text

_start:
    ; Print the prompt message to the user
    ldr r0, =prompt
    bl print_string

    ; Read the user input
    ldr r0, =input
    bl read_string

    ; Convert the input from hexadecimal to decimal
    ldr r0, =input
    bl hex_to_dec

    ; Print the result message
    ldr r0, =result_msg
    bl print_string

    ; Print the decimal result
    ldr r0, =decimal_result
    bl print_number

    ; Print a newline character
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #100
    mov r7, #4
    mov r0, #1
    svc 0
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r1, r0
    mov r2, #100
    mov r7, #3
    mov r0, #0
    svc 0
    pop {lr}
    bx lr

; Function to convert a hexadecimal string to a decimal number
hex_to_dec: