; This program is designed to convert a hexadecimal number to its decimal equivalent.
; It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
; The program is written in ARM Assembly language and demonstrates basic input/output operations,
; string manipulation, and arithmetic operations in assembly.

.global _start

.section .data
input_prompt: .asciz "Enter a hexadecimal number: "
output_prompt: .asciz "The decimal equivalent is: "
buffer: .space 100
newline: .asciz "\n"

.section .bss
input_buffer: .space 100

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read the user input
    ldr r0, =input_buffer
    mov r1, #100
    bl read_string

    ; Convert the input from hexadecimal to decimal
    ldr r0, =input_buffer
    bl hex_to_dec

    ; Print the output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print the decimal result
    bl print_decimal

    ; Print a newline
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
    svc 0
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r2, r1
    mov r1, r0
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

; Function to convert a hexadecimal string to a decimal number
hex_to_dec:
    push {lr}
    mov r1, #0
    mov r2, #0

hex_to_dec_loop:
    ldrb r3, [r0], #1
    cmp r3, #'0'
    blt hex_to_dec_done
    cmp r3, #'9'
    ble hex_to_dec_digit
    cmp r3, #'A'
    blt hex_to_dec_done
    cmp r3, #'F'
    ble hex_to_dec_letter
    cmp r3, #'a'
    blt hex_to_dec_done
    cmp r3, #'f'
    bgt hex_to_dec_done

hex_to_dec_letter:
    sub r3, r3, #'A' - 10
    b hex_to_dec_continue

hex_to_dec_digit:
    sub r3, r3, #'0'

hex_to_dec_continue:
    add r1, r1, r1, lsl #3
    add r1, r1, r1, lsl #1
    add r1, r1, r3
    b hex_to_dec_loop

hex_to_dec_done:
    mov r0, r1
    pop {lr}
    bx lr

; Function to print a decimal number
print_decimal:
    push {lr}
    mov r1, r0
    mov r2, #10
    bl int_to_str
    ldr r0, =buffer
    bl print_string
    pop {lr}
    bx lr

; Function to convert an integer to a string
int_to_str:
    push {lr}
    mov r2, r0
    ldr r0, =buffer
    add r0, r0, #99
    movb r0, #0
    sub r0, r0, #1

int_to_str_loop:
    mov r3, r2
    mov r4, #10
    bl divmod
    add r3, r3, #'0'
    strb r3, [r0], #-1
    cmp r2, #0
    bne int_to_str_loop

    add r0, r0, #1
    pop {lr}
    bx lr

; Function to perform division and modulus
divmod:
    push {lr}
    udiv r3, r2, r4
    mls r2, r3, r4, r2
    mov r2, r3
    pop {lr}
    bx lr

