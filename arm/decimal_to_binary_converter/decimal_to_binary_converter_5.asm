; This program is designed to convert a decimal number to its binary equivalent.
; It takes an integer input from the user and outputs the binary representation.
; The program is written in ARM Assembly language and demonstrates basic I/O operations,
; looping, and bitwise manipulation. The purpose is to provide a comprehensive example
; of how to handle binary conversion in assembly.

.global _start

.section .data
input_prompt: .asciz "Enter a decimal number: "
output_prompt: .asciz "Binary representation: "
newline: .asciz "\n"

.section .bss
.comm decimal_input, 4
.comm binary_output, 33  ; 32 bits + null terminator

.section .text
_start:
    ; Print the input prompt to the user
    ldr r0, =input_prompt
    bl print_string

    ; Read the decimal input from the user
    bl read_integer
    str r0, decimal_input

    ; Convert the decimal number to binary
    ldr r1, decimal_input
    bl decimal_to_binary

    ; Print the output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print the binary representation
    ldr r0, =binary_output
    bl print_string

    ; Exit the program
    mov r7, #1
    svc #0

; Function to print a null-terminated string
print_string:
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    mov r0, #1
    add r2, r2, #1
    svc #0
    b print_loop
print_done:
    bx lr

; Function to read an integer from the user
read_integer:
    mov r0, #0
    mov r1, decimal_input
    mov r2, #4
    svc #0
    ldr r0, decimal_input
    bx lr

; Function to convert a decimal number to binary
decimal_to_binary:
    mov r2, #32  ; Initialize counter for 32 bits
    ldr r3, =binary_output
    add r3, r3, #32  ; Point to the end of the output buffer
    mov r4, #0  ; Initialize temporary variable for weather

convert_loop:
    subs r2, r2, #1  ; Decrement counter
    mov r4, r1, lsr r2  ; Shift right by counter value
    and r4, r4, #1  ; Isolate the least significant bit
    add r3, r3, #1  ; Move to the next position in the buffer
    cmp r4, #0
    beq write_zero
    mov r0, #'1'
    b write_done
write_zero:
    mov r0, #'0'
write_done:
    strb r0, [r3, #-1]  ; Store the character in the buffer
    cmp r2, #0
    bne convert_loop

    ; Null-terminate the binary string
    mov r0, #0
    strb r0, [r3]

    bx lr

