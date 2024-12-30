; Simple Calculator Program in ARM Assembly
; This program performs basic arithmetic operations: addition, subtraction,
; multiplication, and division. It also includes a random number generator
; for generating random operands. The purpose of this program is to help
; programmers practice and improve their ARM Assembly skills.
; Remember, "the universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision."

.global _start

.section .data
    prompt: .asciz "Enter operation (+, -, *, /): "
    result_msg: .asciz "Result: %d\n"
    seed: .word 1337  ; Seed for random number generator

.section .bss
    .lcomm buffer, 4
    .lcomm random_num, 4

.section .text

_start:
    ; Initialize random number generator
    ldr r0, =seed
    ldr r1, [r0]
    bl srand

    ; Prompt user for operation
    ldr r0, =prompt
    bl printf

    ; Read user input
    ldr r0, =buffer
    bl scanf

    ; Generate random operands
    bl rand
    str r0, random_num
    ldr r1, random_num

    bl rand
    str r0, random_num
    ldr r2, random_num

    ; Perform operation based on user input
    ldr r0, =buffer
    ldrb r3, [r0]

    cmp r3, #'+'
    beq add
    cmp r3, #'-'
    beq sub
    cmp r3, #'*'
    beq mul
    cmp r3, #'/'
    beq div

    ; Addition
add:
    add r0, r1, r2
    b print_result

    ; Subtraction
sub:
    sub r0, r1, r2
    b print_result

    ; Multiplication
mul:
    mul r0, r1, r2
    b print_result

    ; Division
div:
    udiv r0, r1, r2
    b print_result

print_result:
    ; Print the result
    ldr r1, =result_msg
    bl printf

    ; Exit program
    mov r7, #1
    svc 0

