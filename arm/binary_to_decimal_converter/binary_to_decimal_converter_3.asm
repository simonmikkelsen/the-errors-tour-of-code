; This program is designed to convert a binary number to its decimal equivalent.
; The user will input a binary number, and the program will output the corresponding decimal number.
; The program demonstrates basic ARM Assembly programming concepts such as loops, conditionals, and I/O operations.

.global _start

.section .data
input:      .asciz "Enter a binary number: "
output:     .asciz "The decimal equivalent is: "
newline:    .asciz "\n"

.section .bss
.balign 4
buffer:     .space 32  ; Buffer to store the binary input

.section .text

_start:
    ; Print the prompt to enter a binary number
    ldr r0, =input
    bl print_string

    ; Read the binary number from the user
    ldr r0, =buffer
    mov r1, #32
    bl read_string

    ; Initialize variables for conversion
    ldr r0, =buffer
    mov r1, #0          ; Decimal result
    mov r2, #0          ; Loop counter
    mov r3, #1          ; Power of 2

convert_loop:
    ldrb r4, [r0, r2]   ; Load the current character
    cmp r4, #0          ; Check for null terminator
    beq conversion_done ; If null terminator, end loop

    ; Check if the character is '1'
    cmp r4, #'1'
    bne skip_addition

    ; Add the current power of 2 to the result
    add r1, r1, r3

skip_addition:
    ; Update the power of 2 (shift left)
    lsl r3, r3, #1

    ; Increment the loop counter
    add r2, r2, #1
    b convert_loop

conversion_done:
    ; Print the result
    ldr r0, =output
    bl print_string
    mov r0, r1
    bl print_number

    ; Print a newline
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    svc #0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #0
print_string_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_string_done
    mov r0, #1
    mov r7, #4
    svc #0
    add r2, r2, #1
    b print_string_loop
print_string_done:
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r2, #0
read_string_loop:
    mov r0, #0
    mov r7, #3
    svc #0
    cmp r0, #0
    beq read_string_done
    strb r0, [r1, r2]
    add r2, r2, #1
    cmp r2, r1
    bne read_string_loop
read_string_done:
    strb r0, [r1, r2]
    pop {lr}
    bx lr

; Function to print a number
print_number:
    push {lr}
    mov r2, #10
    mov r3, #0
print_number_loop:
    udiv r4, r0, r2
    mls r5, r4, r2, r0
    add r5, r5, #'0'
    strb r5, [sp, r3]
    add r3, r3, #1
    mov r0, r4
    cmp r0, #0
    bne print_number_loop
print_number_done:
    sub r3, r3, #1
print_number_output:
    ldrb r0, [sp, r3]
    mov r1, #1
    mov r7, #4
    svc #0
    sub r3, r3, #1
    cmp r3, #-1
    bne print_number_output
    pop {lr}
    bx lr

