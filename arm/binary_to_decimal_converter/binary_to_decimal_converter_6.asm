; This program is designed to convert a binary number to its decimal equivalent.
; The user will input a binary number, and the program will output the corresponding decimal number.
; The program uses a loop to process each bit of the binary number, starting from the least significant bit.
; The purpose of this program is to demonstrate the conversion process in a clear and detailed manner.
; We will use various registers and memory locations to store intermediate values and results.

.global _start

.section .data
input:      .asciz "Enter a binary number: "
output:     .asciz "The decimal equivalent is: "
newline:    .asciz "\n"

.section .bss
.balign 4
buffer:     .space 32

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input
    bl print_string

    ; Read the binary number from the user
    ldr r0, =buffer
    bl read_string

    ; Initialize variables
    ldr r1, =buffer  ; Pointer to the input buffer
    mov r2, #0       ; Decimal result
    mov r3, #1       ; Multiplier for the current bit (2^0)

convert_loop:
    ldrb r4, [r1], #1  ; Load the next character from the input buffer
    cmp r4, #0         ; Check for the null terminator
    beq done           ; If null terminator, end the loop

    ; Convert ASCII '0' or '1' to binary value
    sub r4, r4, #'0'
    cmp r4, #1
    bhi invalid_input  ; If the character is not '0' or '1', handle invalid input

    ; Update the decimal result
    mul r4, r4, r3     ; Multiply the bit value by the current multiplier
    add r2, r2, r4     ; Add the result to the decimal result

    ; Update the multiplier for the next bit (shift left by 1)
    lsl r3, r3, #1

    b convert_loop     ; Repeat the loop

done:
    ; Print the output prompt
    ldr r0, =output
    bl print_string

    ; Print the decimal result
    mov r0, r2
    bl print_number

    ; Print a newline
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    swi 0

invalid_input:
    ; Handle invalid input (not implemented)
    b done

; Function to print a null-terminated string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #0
    mov r7, #4
    swi 0
    pop {lr}
    bx lr

; Function to read a string from the user
read_string:
    push {lr}
    mov r1, r0
    mov r2, #32
    mov r7, #3
    swi 0
    pop {lr}
    bx lr

; Function to print a number
print_number:
    push {lr}
    mov r1, r0
    mov r2, #10
    mov r3, #0
print_number_loop:
    udiv r4, r1, r2
    mls r5, r4, r2, r1
    add r5, r5, #'0'
    strb r5, [sp, r3]
    add r3, r3, #1
    mov r1, r4
    cmp r1, #0
    bne print_number_loop
print_number_done:
    sub r3, r3, #1
print_number_output:
    ldrb r0, [sp, r3]
    bl print_char
    subs r3, r3, #1
    bge print_number_output
    pop {lr}
    bx lr

; Function to print a single character
print_char:
    push {lr}
    mov r1, r0
    mov r2, #1
    mov r7, #4
    swi 0
    pop {lr}
    bx lr

