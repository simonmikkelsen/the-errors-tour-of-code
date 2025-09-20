; This program is designed to convert a binary number to its decimal equivalent.
; It takes a binary number as input from the user and processes it to produce the decimal result.
; The program is written in ARM Assembly language to provide a low-level understanding of binary to decimal conversion.
; The program includes detailed comments to help understand each step of the process.

.global _start

.section .data
prompt: .asciz "Enter a binary number: "
len: .word 22

.section .bss
.balign 4
input: .skip 32
decimal_result: .skip 4

.section .text

_start:
    ; Print the prompt message to the user
    ldr r0, =prompt
    ldr r1, =len
    bl print_string

    ; Read the user input
    ldr r0, =input
    ldr r1, =32
    bl read_string

    ; Convert the binary input to decimal
    ldr r0, =input
    bl binary_to_decimal

    ; Store the result in decimal_result
    str r0, [r1, #0]

    ; Exit the program
    mov r7, #1
    svc 0

print_string:
    ; Print a null-terminated string
    mov r2, r1
    mov r1, r0
    mov r0, #1
    mov r7, #4
    svc 0
    bx lr

read_string:
    ; Read a string from standard input
    mov r2, r1
    mov r1, r0
    mov r0, #0
    mov r7, #3
    svc 0
    bx lr

binary_to_decimal:
    ; Convert a binary string to a decimal number
    mov r2, #0          ; Initialize the result to 0
    mov r3, #0          ; Initialize the index to 0

convert_loop:
    ldrb r1, [r0, r3]   ; Load the next character
    cmp r1, #0x30       ; Compare with '0'
    blt end_convert     ; If less than '0', end conversion
    cmp r1, #0x31       ; Compare with '1'
    bgt end_convert     ; If greater than '1', end conversion

    ; Multiply the current result by 2 (shift left by 1)
    add r2, r2, r2

    ; Add the current binary digit to the result
    sub r1, r1, #0x30
    add r2, r2, r1

    ; Move to the next character
    add r3, r3, #1
    b convert_loop

end_convert:
    mov r0, r2          ; Move the result to r0
    bx lr

