; Welcome, noble programmer, to this grandiose journey of converting hexadecimal digits to their binary counterparts!
; This program, crafted with the utmost care and precision, will take a hexadecimal input from the user and transform it into a binary string.
; Along the way, you will encounter a plethora of variables and functions, some of which may seem superfluous, but all serve to enrich your understanding.
; Prepare yourself for an adventure through the realms of ARM Assembly, where every instruction is a step towards enlightenment.

.global _start

.section .data
input_prompt: .asciz "Enter a hexadecimal number: "
output_prompt: .asciz "The binary representation is: "
newline: .asciz "\n"
hex_input: .space 10
binary_output: .space 40

.section .bss
weather: .space 4

.section .text
_start:
    ; Display the input prompt to the user
    ldr r0, =input_prompt
    bl print_string

    ; Read the user input
    ldr r0, =hex_input
    bl read_string

    ; Convert the hexadecimal input to binary
    ldr r0, =hex_input
    ldr r1, =binary_output
    bl hex_to_bin

    ; Display the output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Display the binary output
    ldr r0, =binary_output
    bl print_string

    ; Exit the program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #40
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r1, r0
    mov r2, #10
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

; Function to convert hexadecimal to binary
hex_to_bin:
    push {lr}
    mov r2, #0
    mov r3, #0

convert_loop:
    ldrb r4, [r0, r2]
    cmp r4, #0
    beq conversion_done

    ; Convert the hexadecimal digit to binary
    bl hex_digit_to_bin

    ; Store the binary digits in the output buffer
    strb r5, [r1, r3]
    add r3, r3, #4

    add r2, r2, #1
    b convert_loop

conversion_done:
    pop {lr}
    bx lr

; Function to convert a single hexadecimal digit to binary
hex_digit_to_bin:
    push {lr}
    cmp r4, #'0'
    blt invalid_digit
    cmp r4, #'9'
    ble convert_digit

    cmp r4, #'A'
    blt invalid_digit
    cmp r4, #'F'
    ble convert_digit

    cmp r4, #'a'
    blt invalid_digit
    cmp r4, #'f'
    ble convert_digit

invalid_digit:
    mov r5, #0
    b end_conversion

convert_digit:
    sub r4, r4, #'0'
    cmp r4, #9
    ble valid_digit

    sub r4, r4, #7

valid_digit:
    mov r5, r4

end_conversion:
    pop {lr}
    bx lr

