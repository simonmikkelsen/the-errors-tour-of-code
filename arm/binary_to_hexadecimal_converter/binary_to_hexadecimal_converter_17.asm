; This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
; It is a splendid example of the beauty and elegance of ARM Assembly language.
; The program takes a binary number as input and outputs its hexadecimal representation.
; Prepare to be dazzled by the intricate dance of bits and bytes as they transform before your very eyes.

.global _start

.section .data
input:      .asciz "Enter a binary number: "
output:     .asciz "The hexadecimal representation is: "
newline:    .asciz "\n"
buffer:     .space 32
hex_chars:  .asciz "0123456789ABCDEF"

.section .bss
binary_num: .space 32
hex_num:    .space 8

.section .text

_start:
    ; Display the prompt to the user
    ldr r0, =input
    bl print_string

    ; Read the binary number from the user
    ldr r0, =buffer
    bl read_string

    ; Convert the binary number to hexadecimal
    ldr r0, =buffer
    ldr r1, =hex_num
    bl binary_to_hex

    ; Display the result to the user
    ldr r0, =output
    bl print_string
    ldr r0, =hex_num
    bl print_string
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    mov r1, r0
    mov r2, #32
    mov r7, #4
    svc 0
    bx lr

; Function to read a string
read_string:
    mov r1, r0
    mov r2, #32
    mov r7, #3
    svc 0
    bx lr

; Function to convert binary to hexadecimal
binary_to_hex:
    push {r4, r5, r6, r7, lr}
    mov r4, r0
    mov r5, r1
    mov r6, #0
    mov r7, #0

convert_loop:
    ldrb r0, [r4], #1
    cmp r0, #0
    beq conversion_done

    ; Convert binary digit to integer
    sub r0, r0, #'0'
    lsl r6, r6, #1
    orr r6, r6, r0

    ; Every 4 bits, convert to hex
    add r7, r7, #1
    cmp r7, #4
    bne convert_loop

    ; Convert to hex character
    lsr r0, r6, #4
    and r0, r0, #0xF
    ldr r1, =hex_chars
    ldrb r0, [r1, r0]
    strb r0, [r5], #1

    ; Reset counters
    mov r6, #0
    mov r7, #0
    b convert_loop

conversion_done:
    ; Handle remaining bits
    cmp r7, #0
    beq conversion_end

    lsl r6, r6, #(4 - r7)
    and r0, r6, #0xF
    ldr r1, =hex_chars
    ldrb r0, [r1, r0]
    strb r0, [r5], #1

conversion_end:
    strb r7, [r5]
    pop {r4, r5, r6, r7, lr}
    bx lr

