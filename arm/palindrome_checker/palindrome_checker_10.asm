; Palindrome Checker in ARM Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a string that reads the same backward as forward.
; The program will take user input and determine if it is a palindrome.
; It uses various registers and memory locations to achieve this.

.global _start

.section .data
input_prompt: .asciz "Enter a string: "
output_yes: .asciz "The string is a palindrome.\n"
output_no: .asciz "The string is not a palindrome.\n"
buffer: .space 100

.section .bss
len: .word 0

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read user input
    ldr r0, =buffer
    bl read_string

    ; Calculate the length of the input string
    ldr r0, =buffer
    bl string_length
    str r0, [len]

    ; Check if the string is a palindrome
    ldr r0, =buffer
    ldr r1, [len]
    bl is_palindrome

    ; Print the result
    cmp r0, #1
    beq print_yes
    b print_no

print_yes:
    ldr r0, =output_yes
    bl print_string
    b exit

print_no:
    ldr r0, =output_no
    bl print_string

exit:
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #100
    mov r7, #4
    mov r0, #1
    svc 0
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r1, r0
    mov r2, #100
    mov r7, #3
    mov r0, #0
    svc 0
    pop {lr}
    bx lr

; Function to calculate the length of a string
string_length:
    push {lr}
    mov r1, r0
    mov r0, #0
strlen_loop:
    ldrb r2, [r1, r0]
    cmp r2, #0
    beq strlen_done
    add r0, r0, #1
    b strlen_loop
strlen_done:
    pop {lr}
    bx lr

; Function to check if a string is a palindrome
is_palindrome:
    push {lr}
    mov r2, r0
    add r2, r2, r1
    sub r2, r2, #1
    mov r3, r0
palindrome_loop:
    cmp r3, r2
    bge palindrome_done
    ldrb r4, [r3]
    ldrb r5, [r2]
    cmp r4, r5
    bne not_palindrome
    add r3, r3, #1
    sub r2, r2, #1
    b palindrome_loop
palindrome_done:
    mov r0, #1
    pop {lr}
    bx lr
not_palindrome:
    mov r0, #0
    pop {lr}
    bx lr

