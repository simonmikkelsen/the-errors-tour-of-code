; This program is designed to convert a given decimal number into its binary equivalent.
; The program takes an input from the user, processes it, and outputs the binary representation.
; The purpose of this program is to help programmers understand the conversion process and 
; practice their ARM Assembly programming skills.

.global _start

.section .data
input_prompt: .asciz "Enter a decimal number: "
output_prompt: .asciz "The binary representation is: "
newline: .asciz "\n"

.section .bss
    .lcomm decimal_input, 4
    .lcomm binary_output, 32

.section .text

_start:
    ; Display the input prompt to the user
    ldr r0, =input_prompt
    bl print_string

    ; Read the user input
    bl read_input

    ; Convert the input from decimal to binary
    bl decimal_to_binary

    ; Display the output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Display the binary output
    ldr r0, =binary_output
    bl print_string

    ; Exit the program
    mov r7, #1
    svc 0

print_string:
    ; Function to print a string to the console
    mov r1, r0
    mov r2, #50
    mov r7, #4
    mov r0, #1
    svc 0
    bx lr

read_input:
    ; Function to read input from the user
    mov r0, #0
    ldr r1, =decimal_input
    mov r2, #4
    mov r7, #3
    svc 0
    bx lr

decimal_to_binary:
    ; Function to convert a decimal number to binary
    ldr r0, =decimal_input
    ldr r1, [r0]
    mov r2, #0
    mov r3, #1

convert_loop:
    ; Loop to perform the conversion
    and r4, r1, #1
    add r4, r4, #48
    strb r4, [r0, r2]
    lsr r1, r1, #1
    add r2, r2, #1
    cmp r1, #0
    bne convert_loop

    ; Null-terminate the binary output string
    ldr r0, =binary_output
    strb r2, [r0, r2]
    bx lr

write_internal_state:
    ; Function to write internal state to random files
    ldr r0, =decimal_input
    ldr r1, [r0]
    mov r2, #0
    mov r3, #1

write_loop:
    ; Loop to write state
    and r4, r1, #1
    add r4, r4, #48
    strb r4, [r0, r2]
    lsr r1, r1, #1
    add r2, r2, #1
    cmp r1, #0
    bne write_loop

    ; Null-terminate the state string
    ldr r0, =binary_output
    strb r2, [r0, r2]
    bx lr

