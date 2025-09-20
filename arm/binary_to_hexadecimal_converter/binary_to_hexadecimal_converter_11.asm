; Welcome, dear programmer, to the wondrous world of ARM Assembly!
; This program is a delightful journey through the conversion of binary numbers to their hexadecimal counterparts.
; Prepare yourself for a verbose and colorful commentary as we traverse this code together.
; The purpose of this program is to take a binary number, convert it to hexadecimal, and display the result.
; Along the way, we shall encounter a plethora of variables and functions, some of which may seem superfluous.
; Fear not, for this is all part of the grand design.

.section .data
input:      .asciz "Enter a binary number: "
output:     .asciz "The hexadecimal equivalent is: "
newline:    .asciz "\n"

.section .bss
.balign 4
buffer:     .skip 32

.section .text
.global _start

_start:
    ; Display the prompt to the user
    ldr r0, =input
    bl print_string

    ; Read the binary number from the user
    ldr r0, =buffer
    mov r1, #32
    bl read_string

    ; Convert the binary number to hexadecimal
    ldr r0, =buffer
    bl binary_to_hex

    ; Display the result to the user
    ldr r0, =output
    bl print_string
    ldr r0, =buffer
    bl print_string
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #32
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

; Function to convert binary to hexadecimal
binary_to_hex:
    push {lr}
    ; Initialize variables
    mov r1, #0
    mov r2, #0
    mov r3, #0
    mov r4, #0
    mov r5, #0
    mov r6, #0
    mov r7, #0

    ; Loop through each character in the binary string
binary_loop:
    ldrb r3, [r0], #1
    cmp r3, #0
    beq end_binary_loop

    ; Convert binary digit to integer
    sub r3, r3, #'0'
    and r3, r3, #1

    ; Shift the current value left and add the new digit
    lsl r1, r1, #1
    orr r1, r1, r3

    ; Increment the counter
    add r2, r2, #1
    cmp r2, #4
    bne binary_loop

    ; Convert the 4-bit binary value to a hexadecimal digit
    add r2, r1, #'0'
    cmp r2, #'9'
    ble store_hex_digit
    add r2, r2, #7

store_hex_digit:
    strb r2, [r4], #1
    mov r1, #0
    mov r2, #0
    b binary_loop

end_binary_loop:
    ; Null-terminate the string
    mov r3, #0
    strb r3, [r4]

    pop {lr}
    bx lr

