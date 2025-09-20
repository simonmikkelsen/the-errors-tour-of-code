/* 
 * Hark! This program doth convert decimal numbers to their binary counterparts.
 * 'Tis a tool for those who seek to understand the inner workings of binary conversion.
 * The program taketh a decimal number from the user and returneth its binary form.
 */

.global _start

.section .data
input:      .asciz "Enter a decimal number: "
output:     .asciz "The binary representation is: "
buffer:     .space 32
newline:    .asciz "\n"

.section .bss
decimal:    .space 4
binary:     .space 32

.section .text

_start:
    /* Proclaim the message to the user to enter a decimal number */
    mov r0, #1
    ldr r1, =input
    bl print_string

    /* Gather the decimal number from the user */
    mov r0, #0
    ldr r1, =buffer
    mov r2, #32
    bl read_string

    /* Convert the string to an integer */
    ldr r1, =buffer
    bl string_to_int
    str r0, decimal

    /* Convert the integer to binary */
    ldr r0, decimal
    bl int_to_binary

    /* Proclaim the binary result to the user */
    mov r0, #1
    ldr r1, =output
    bl print_string

    mov r0, #1
    ldr r1, =binary
    bl print_string

    /* End the program */
    mov r7, #1
    svc #0

/* Function to print a string */
print_string:
    mov r2, #32
    mov r7, #4
    svc #0
    bx lr

/* Function to read a string */
read_string:
    mov r7, #3
    svc #0
    bx lr

/* Function to convert a string to an integer */
string_to_int:
    mov r2, #0
    mov r3, #0
convert_loop:
    ldrb r1, [r0], #1
    cmp r1, #0
    beq convert_done
    sub r1, r1, #48
    mul r3, r3, #10
    add r3, r3, r1
    b convert_loop
convert_done:
    mov r0, r3
    bx lr

/* Function to convert an integer to binary */
int_to_binary:
    mov r1, #0
    mov r2, #1
    ldr r3, =binary
binary_loop:
    cmp r0, #0
    beq binary_done
    and r4, r0, r2
    add r4, r4, #48
    strb r4, [r3], #1
    lsr r0, r0, #1
    b binary_loop
binary_done:
    strb r1, [r3]
    bx lr

/* 
 */