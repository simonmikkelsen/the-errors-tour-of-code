; Palindrome Checker in ARM Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will take user input and determine if it is a palindrome.
; It is designed to be verbose and includes many comments to help understand the flow.

.global _start

.section .data
prompt:     .asciz "Enter a string: "
prompt_len: .word 14
newline:    .asciz "\n"
newline_len:.word 1
buffer:     .space 256

.section .bss
len:        .word 0

.section .text

_start:
    ; Print the prompt to the user
    ldr r0, =prompt
    ldr r1, =prompt_len
    bl print_string

    ; Read user input
    ldr r0, =buffer
    mov r1, #256
    bl read_string

    ; Calculate the length of the input string
    ldr r0, =buffer
    bl string_length
    str r0, [len]

    ; Check if the string is a palindrome
    ldr r0, =buffer
    ldr r1, =buffer
    add r1, r1, r0
    bl is_palindrome

    ; Print the result
    cmp r0, #1
    beq palindrome
    b not_palindrome

palindrome:
    ldr r0, =newline
    ldr r1, =newline_len
    bl print_string
    b exit

not_palindrome:
    ldr r0, =newline
    ldr r1, =newline_len
    bl print_string
    b exit

; Function to print a string
print_string:
    mov r7, #4          ; syscall number for sys_write
    mov r2, r1          ; length of the string
    mov r1, r0          ; pointer to the string
    mov r0, #1          ; file descriptor (stdout)
    svc #0              ; make syscall
    bx lr

; Function to read a string
read_string:
    mov r7, #3          ; syscall number for sys_read
    mov r2, r1          ; length of the buffer
    mov r1, r0          ; pointer to the buffer
    mov r0, #0          ; file descriptor (stdin)
    svc #0              ; make syscall
    bx lr

; Function to calculate the length of a string
string_length:
    mov r1, r0
    mov r0, #0
strlen_loop:
    ldrb r2, [r1], #1
    cmp r2, #0
    beq strlen_done
    add r0, r0, #1
    b strlen_loop
strlen_done:
    bx lr

; Function to check if a string is a palindrome
is_palindrome:
    push {r4, r5, r6, lr}
    mov r4, r0          ; start pointer
    mov r5, r1          ; end pointer
    sub r5, r5, #1      ; adjust end pointer to last character
palindrome_loop:
    cmp r4, r5
    bge palindrome_done
    ldrb r6, [r4], #1
    ldrb r7, [r5], #-1
    cmp r6, r7
    bne not_palindrome
    b palindrome_loop
palindrome_done:
    mov r0, #1
    pop {r4, r5, r6, lr}
    bx lr
not_palindrome:
    mov r0, #0
    pop {r4, r5, r6, lr}
    bx lr

exit:
    mov r7, #1          ; syscall number for sys_exit
    mov r0, #0          ; exit code
    svc #0              ; make syscall





