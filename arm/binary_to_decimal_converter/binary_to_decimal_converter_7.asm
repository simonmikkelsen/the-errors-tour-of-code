; This program converts a binary number to its decimal equivalent.
; The user is expected to input a binary number, and the program will output the decimal value.
; This program is designed to help programmers understand the conversion process in detail.

.global _start

.section .data
input:      .asciz "Enter a binary number: "
output:     .asciz "The decimal value is: "
newline:    .asciz "\n"
buffer:     .space 32
buffer_len: .word 32

.section .bss
decimal_value: .word 0
temp_value:    .word 0
index:         .word 0
length:        .word 0

.section .text
_start:
    ; Print the prompt to the user
    ldr r0, =input
    bl print_string

    ; Read the user input
    ldr r0, =buffer
    ldr r1, =buffer_len
    bl read_string

    ; Calculate the length of the input string
    ldr r0, =buffer
    bl string_length
    str r0, [length]

    ; Initialize the decimal value to 0
    mov r4, #0
    str r4, [decimal_value]

    ; Initialize the index to 0
    mov r5, #0
    str r5, [index]

convert_loop:
    ; Load the current index
    ldr r5, [index]

    ; Check if we have reached the end of the string
    ldr r6, [length]
    cmp r5, r6
    beq end_conversion

    ; Load the current character
    ldr r0, =buffer
    add r0, r0, r5
    ldrb r1, [r0]

    ; Convert the character to its numeric value
    sub r1, r1, #'0'

    ; Update the decimal value
    ldr r2, [decimal_value]
    lsl r2, r2, #1
    add r2, r2, r1
    str r2, [decimal_value]

    ; Increment the index
    add r5, r5, #1
    str r5, [index]

    ; Loop back to process the next character
    b convert_loop

end_conversion:
    ; Print the result to the user
    ldr r0, =output
    bl print_string

    ; Load the decimal value
    ldr r0, [decimal_value]
    bl print_decimal

    ; Print a newline
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    swi 0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #0
    loop:
        ldrb r3, [r1, r2]
        cmp r3, #0
        beq end_print
        add r2, r2, #1
        b loop
    end_print:
        mov r2, r2
        mov r7, #4
        swi 0
        pop {lr}
        bx lr

; Function to read a string
read_string:
    push {lr}
    mov r2, r1
    mov r1, r0
    mov r7, #3
    swi 0
    pop {lr}
    bx lr

;