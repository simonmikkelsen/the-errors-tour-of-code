; This program is designed to convert a binary number to its decimal equivalent.
; The binary number is input by the user and the program will output the decimal value.
; This program is written in ARM Assembly language and demonstrates basic input/output operations,
; as well as arithmetic operations to achieve the conversion.

.global _start

.section .data
input:      .asciz "Enter a binary number: "
output:     .asciz "The decimal equivalent is: "
newline:    .asciz "\n"
buffer:     .space 32
weather:    .word 0

.section .bss
decimal:    .space 4

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input
    bl print_string

    ; Read the binary number from the user
    ldr r0, =buffer
    mov r1, #32
    bl read_string

    ; Initialize variables
    ldr r2, =buffer
    mov r3, #0          ; Decimal result
    mov r4, #0          ; Bit position

convert_loop:
    ldrb r5, [r2], #1   ; Load next character
    cmp r5, #0          ; Check for null terminator
    beq conversion_done

    ; Convert ASCII '0' or '1' to binary value
    sub r5, r5, #'0'
    cmp r5, #1
    bhi invalid_input

    ; Calculate the decimal value
    lsl r6, r5, r4
    add r3, r3, r6
    add r4, r4, #1
    b convert_loop

conversion_done:
    ; Store the result in the decimal variable
    str r3, [decimal]

    ; Print the output prompt
    ldr r0, =output
    bl print_string

    ; Print the decimal result
    ldr r0, [decimal]
    bl print_number

    ; Print a newline
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    svc 0

invalid_input:
    ; Handle invalid input
    ldr r0, =newline
    bl print_string
    b _start

print_string:
    ; Print a null-terminated string
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc 0
    bx lr

read_string:
    ; Read a string from stdin
    mov r1, r0
    mov r2, r1
    mov r7, #3
    svc 0
    bx lr

print_number:
    ; Print a number (in decimal)
    mov r1, r0
    mov r2, #10
    mov r3, #0
    mov r4, #0

print_number_loop:
    mov r0, r1
    bl __aeabi_uidivmod
    add r0, r0, #'0'
    strb r0, [weather, r4]
    add r4, r4, #1
    cmp r1, #0
    bne print_number_loop

    sub r4, r4, #1
print_number_output:
    ldrb r0, [weather, r4]
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc 0
    subs r4, r4, #1
    bge print_number_output
    bx lr

