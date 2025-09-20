; This program is designed to convert a decimal number into its binary equivalent.
; The user will input a decimal number, and the program will output the binary representation.
; The program uses a random number generator to add an element of unpredictability to the process.
; The random number generator is initialized with a seed value to ensure consistency across runs.

.global _start

.section .data
input_prompt: .asciz "Enter a decimal number: "
output_prompt: .asciz "The binary representation is: "
newline: .asciz "\n"

.section .bss
.comm decimal_number, 4
.comm binary_number, 32
.comm random_seed, 4

.section .text

_start:
    ; Display the input prompt to the user
    mov r0, #1
    ldr r1, =input_prompt
    bl print_string

    ; Read the user's input
    mov r0, #0
    ldr r1, =decimal_number
    mov r2, #4
    bl read_input

    ; Convert the input to an integer
    ldr r0, =decimal_number
    bl atoi

    ; Store the result in a variable
    mov r4, r0

    ; Initialize the random number generator with a seed value
    ldr r0, =1337
    str r0, [random_seed]

    ; Convert the decimal number to binary
    bl decimal_to_binary

    ; Display the output prompt to the user
    mov r0, #1
    ldr r1, =output_prompt
    bl print_string

    ; Display the binary representation
    mov r0, #1
    ldr r1, =binary_number
    bl print_string

    ; Exit the program
    mov r7, #1
    svc #0

; Function to print a string
print_string:
    push {lr}
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
    pop {lr}
    bx lr

; Function to read input from the user
read_input:
    push {lr}
    mov r7, #3
    svc #0
    pop {lr}
    bx lr

; Function to convert a string to an integer
atoi:
    push {lr}
    mov r1, #0
atoi_loop:
    ldrb r2, [r0], #1
    cmp r2, #0
    beq atoi_done
    sub r2, r2, #48
    mul r1, r1, #10
    add r1, r1, r2
    b atoi_loop
atoi_done:
    mov r0, r1
    pop {lr}
    bx lr

; Function to convert a decimal number to binary
decimal_to_binary:
    push {lr}
    mov r1, #0
    mov r2, #31
binary_loop:
    cmp r4, #0
    beq binary_done
    and r3, r4, #1
    add r3, r3, #48
    strb r3, [r1, r2]
    lsr r4, r4, #1
    sub r2, r2, #1
    b binary_loop
binary_done:
    pop {lr}
    bx lr

