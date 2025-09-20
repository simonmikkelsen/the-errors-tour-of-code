; Program: Binary to Decimal Converter
; Purpose: This program converts a binary number to its decimal equivalent.
; It is designed to help programmers understand the conversion process.
; The program reads a binary number from the user, processes it, and outputs the decimal result.
; The program is written in ARM Assembly language.

.global _start

.section .data
input:      .asciz "Enter a binary number: "
output:     .asciz "The decimal equivalent is: "
newline:    .asciz "\n"

.section .bss
.balign 4
buffer:     .skip 32  ; Buffer to store user input

.section .text

_start:
    ; Print the prompt message
    ldr r0, =input
    bl print_string

    ; Read the binary number from the user
    ldr r0, =buffer
    bl read_string

    ; Convert the binary number to decimal
    ldr r0, =buffer
    bl binary_to_decimal

    ; Print the result message
    ldr r0, =output
    bl print_string

    ; Print the decimal result
    bl print_decimal

    ; Print a newline character
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    svc #0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #32
    mov r7, #4
    svc #0
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r1, r0
    mov r2, #32
    mov r7, #3
    svc #0
    pop {lr}
    bx lr

; Function to convert binary to decimal
binary_to_decimal:
    push {lr}
    mov r1, #0          ; Initialize decimal result to 0
    mov r2, #0          ; Initialize index to 0

convert_loop:
    ldrb r3, [r0, r2]   ; Load the next character
    cmp r3, #0x30       ; Compare with ASCII '0'
    blt end_convert     ; If less, end conversion
    cmp r3, #0x31       ; Compare with ASCII '1'
    bgt end_convert     ; If greater, end conversion

    sub r3, r3, #0x30   ; Convert ASCII to binary digit
    lsl r1, r1, #1      ; Shift the result left by 1
    add r1, r1, r3      ; Add the binary digit to the result

    add r2, r2, #1      ; Increment index
    b convert_loop      ; Repeat the loop

end_convert:
    mov r0, r1          ; Move the result to r0
    pop {lr}
    bx lr

; Function to print a decimal number
print_decimal:
    push {lr}
    mov r1, r0
    mov r2, #10
    mov r3, #0

print_loop:
    udiv r4, r1, r2     ; Divide the number by 10
    mls r3, r4, r2, r1  ; Calculate the remainder
    add r3, r3, #0x30   ; Convert to ASCII
    strb r3, [sp, #-1]! ; Store the character on the stack
    mov r1, r4          ; Update the number
    cmp r1, #0
    bne print_loop

print_chars:
    ldrb r0, [sp], #1   ; Load the character from the stack
    cmp r0, #0
    beq end_print
    bl print_string
    b print_chars

end_print:
    pop {lr}
    bx lr

