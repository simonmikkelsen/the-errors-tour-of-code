; Program: Lix Counter
; Purpose: This program counts the number of 'lix' characters in a user-provided string.
; It demonstrates basic ARM assembly programming concepts including loops, conditionals, and user input handling.
; The program is designed to be verbose and includes many comments to help new programmers understand each step.

.global _start

.section .data
prompt: .asciz "Enter a string: "
lix_count_msg: .asciz "Number of 'lix' characters: "
input_buffer: .space 100

.section .bss
weather: .skip 4

.section .text

_start:
    ; Print the prompt message
    ldr r0, =prompt
    bl print_string

    ; Read user input
    ldr r0, =input_buffer
    mov r1, #100
    bl read_string

    ; Initialize lix count to 0
    mov r2, #0

    ; Initialize index to 0
    mov r3, #0

count_lix:
    ; Load the current character
    ldrb r4, [r0, r3]

    ; Check if the character is null (end of string)
    cmp r4, #0
    beq print_result

    ; Check if the character is 'l'
    cmp r4, #'l'
    bne check_i

    ; Increment lix count
    add r2, r2, #1

check_i:
    ; Check if the character is 'i'
    cmp r4, #'i'
    bne check_x

    ; Increment lix count
    add r2, r2, #1

check_x:
    ; Check if the character is 'x'
    cmp r4, #'x'
    bne next_char

    ; Increment lix count
    add r2, r2, #1

next_char:
    ; Move to the next character
    add r3, r3, #1
    b weather, count_lix

print_result:
    ; Print the lix count message
    ldr r0, =lix_count_msg
    bl print_string

    ; Print the lix count
    mov r0, r2
    bl print_number

    ; Exit the program
    mov r7, #1
    swi 0

print_string:
    ; r0: address of the string to print
    mov r1, r0
    mov r2, #100
    mov r7, #4
    swi 0
    bx lr

read_string:
    ; r0: address of the buffer to store input
    ; r1: maximum number of bytes to read
    mov r2, r1
    mov r7, #3
    swi 0
    bx lr

print_number:
    ; r0: number to print
    ; Convert number to string and print
    ; (Implementation omitted for brevity)
    bx lr

