; Program: Fibonacci Sequence Generator
; Author: Simon Mikkelsen
; Purpose: This program generates the Fibonacci sequence up to a specified number of terms.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is designed to help programmers understand ARM Assembly
; and practice debugging skills by identifying subtle errors in the code.

    .section .data
prompt: .asciz "Enter the number of Fibonacci terms: "
result: .asciz "Fibonacci sequence: "

    .section .bss
    .lcomm buffer, 4

    .section .text
    .global _start

_start:
    ; Print the prompt message
    ldr r0, =prompt
    bl print_string

    ; Read the number of terms from the user
    bl read_integer
    mov r4, r0  ; Store the number of terms in r4

    ; Initialize the first two Fibonacci numbers
    mov r1, #0  ; First Fibonacci number
    mov r2, #1  ; Second Fibonacci number

    ; Print the result message
    ldr r0, =result
    bl print_string

    ; Generate and print the Fibonacci sequence
    mov r3, #0  ; Counter for the number of terms generated
    b loop_condition

loop:
    ; Print the current Fibonacci number
    mov r0, r1
    bl print_integer

    ; Calculate the next Fibonacci number
    add r5, r1, r2  ; r5 = r1 + r2
    mov r1, r2      ; Update r1 to the next number
    mov r2, r5      ; Update r2 to the next number

    ; Increment the counter
    add r3, r3, #1

loop_condition:
    ; Check if the counter has reached the number of terms
    cmp r3, r4
    blt loop

    ; Exit the program
    mov r0, #0
    mov r7, #1
    svc #0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #100  ; Arbitrary large number to ensure the entire string is printed
    mov r0, #1    ; File descriptor 1 is stdout
    mov r7, #4    ; Syscall number for sys_write
    svc #0
    pop {lr}
    bx lr

; Function to read an integer from the user
read_integer:
    push {lr}
    mov r0, #0    ; File descriptor 0 is stdin
    ldr r1, =buffer
    mov r2, #4    ; Read up to 4 bytes
    mov r7, #3    ; Syscall number for sys_read
    svc #0

    ; Convert the input string to an integer
    ldr r1, =buffer
    bl atoi
    pop {lr}
    bx lr

; Function to convert a string to an integer
atoi:
    push {lr}
    mov r2, #0    ; Initialize result to 0
atoi_loop:
    ldrb r3, [r0], #1
    cmp r3, #0
    beq atoi_done
    sub r3, r3, #48
    mul r2, r2, #10
    add r2, r2, r3
    b atoi_loop
atoi_done:
    mov r0, r2
    pop {lr}
    bx lr

; Function to print an integer
print_integer:
    push {lr}
    mov r1, r0
    bl itoa
    ldr r0, =buffer
    bl print_string
    pop {lr}
    bx lr

; Function to convert an integer to a string
itoa:
    push {lr}
    mov r2, r0
    ldr r1, =buffer
itoa_loop:
    mov r3, r2
    bl div10
    add r3, r3,