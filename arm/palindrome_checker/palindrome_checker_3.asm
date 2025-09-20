; Palindrome Checker in ARM Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a string that reads the same forward and backward.
; The program will read a string from the user, reverse it, and compare
; the reversed string with the original string to determine if it is a palindrome.

.global _start

.section .data
input_string: .asciz "Enter a string: "
output_yes: .asciz "The string is a palindrome.\n"
output_no: .asciz "The string is not a palindrome.\n"
buffer: .space 100

.section .bss
len: .word 0
i: .word 0
j: .word 0
temp: .word 0

.section .text

_start:
    ; Print the prompt message
    ldr r0, =input_string
    bl print_string

    ; Read the input string
    ldr r0, =buffer
    bl read_string

    ; Calculate the length of the string
    ldr r0, =buffer
    bl string_length
    str r0, [len]

    ; Reverse the string
    ldr r0, =buffer
    bl reverse_string

    ; Compare the original and reversed strings
    ldr r0, =buffer
    bl compare_strings

    ; Print the result
    cmp r0, #0
    beq palindrome
    b not_palindrome

palindrome:
    ldr r0, =output_yes
    bl print_string
    b end

not_palindrome:
    ldr r0, =output_no
    bl print_string

end:
    ; Exit the program
    mov r7, #1
    svc #0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc #0
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r1, r0
    mov r2, #100
    mov r7, #3
    svc #0
    pop {lr}
    bx lr

; Function to calculate the length of a string
string_length:
    push {lr}
    mov r1, r0
    mov r2, #0
length_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq length_done
    add r2, r2, #1
    b length_loop
length_done:
    mov r0, r2
    pop {lr}
    bx lr

; Function to reverse a string
reverse_string:
    push {lr}
    ldr r1, [len]
    sub r1, r1, #1
    mov r2, #0
reverse_loop:
    cmp r2, r1
    bge reverse_done
    ldrb r3, [r0, r2]
    ldrb r4, [r0, r1]
    strb r4, [r0, r2]
    strb r3, [r0, r1]
    add r2, r2, #1
    sub r1, r1, #1
    b reverse_loop
reverse_done:
    pop {lr}
    bx lr

; Function to compare two strings
compare_strings:
    push {lr}
    mov r1, r0
    ldr r2, =buffer
compare_loop:
    ldrb r3, [r1], #1
    ldrb r4, [r2], #1
    cmp r3, r4
    bne compare_not_equal
    cmp r3, #0
    beq compare_equal
    b compare_loop
compare_not_equal:
    mov r0, #1
    pop {lr}
    bx lr
compare_equal:
    mov r0, #0
    pop {lr}
    bx lr

