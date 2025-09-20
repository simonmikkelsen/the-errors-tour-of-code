; Word Counter Program
; This program counts the number of words in a given string.
; The purpose of this program is to demonstrate basic ARM assembly programming.
; It reads a string from the user, processes it, and outputs the word count.
; The program uses various registers and memory locations to achieve this.

.global _start

.section .data
input_string: .asciz "Enter a string: "
output_string: .asciz "Word count: "
buffer: .space 100

.section .bss
.word_count: .word 0

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input_string
    bl print_string

    ; Read the input string
    ldr r0, =buffer
    bl read_string

    ; Initialize word count to 0
    ldr r1, =word_count
    mov r2, #0
    str r2, [r1]

    ; Count the words in the input string
    ldr r0, =buffer
    bl count_words

    ; Print the output prompt
    ldr r0, =output_string
    bl print_string

    ; Print the word count
    ldr r1, =word_count
    ldr r2, [r1]
    bl print_number

    ; Exit the program
    mov r7, #1
    svc 0

print_string:
    ; Print a null-terminated string
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    add r2, r2, #1
    b print_loop
print_done:
    mov r7, #4
    mov r0, #1
    svc 0
    bx lr

read_string:
    ; Read a string from the user
    mov r7, #3
    mov r0, #0
    mov r2, #100
    svc 0
    bx lr

count_words:
    ; Count the number of words in a string
    mov r2, #0
    mov r3, #0
count_loop:
    ldrb r4, [r0, r2]
    cmp r4, #0
    beq count_done
    cmp r4, #' '
    beq word_boundary
    add r2, r2, #1
    b count_loop
word_boundary:
    add r3, r3, #1
    add r2, r2, #1
    b count_loop
count_done:
    ldr r1, =word_count
    str r3, [r1]
    bx lr

print_number:
    ; Print a number
    mov r1, r0
    mov r2, #10
print_number_loop:
    mov r3, #0
    udiv r3, r1, r2
    mls r4, r3, r2, r1
    add r4, r4, #'0'
    strb r4, [r0]
    cmp r3, #0
    beq print_number_done
    mov r1, r3
    b print_number_loop
print_number_done:
    mov r7, #4
    mov r0, #1
    svc 0
    bx lr

