; Welcome, noble programmer, to the realm of the simple text editor!
; This program is designed to be a delightful journey through the
; enchanting world of ARM Assembly. Here, you shall encounter a
; myriad of variables, functions, and operations that will test
; your skills and sharpen your senses. Prepare yourself for an
; adventure filled with verbose commentary and whimsical naming
; conventions. Let us embark on this quest together!

.section .data
input_prompt: .asciz "Enter your text: "
output_prompt: .asciz "You entered: "
newline: .asciz "\n"

.section .bss
.comm input_buffer, 256

.section .text
.global _start

_start:
    ; The grand entrance of our program begins here!
    ; We shall summon the input prompt to the screen.
    ldr r0, =input_prompt
    bl print_string

    ; Now, we prepare to receive the user's input.
    ldr r1, =input_buffer
    mov r2, #256
    bl read_input

    ; With the user's input in hand, we shall now display it back.
    ldr r0, =output_prompt
    bl print_string

    ; The moment of truth has arrived! Behold the user's input!
    ldr r0, =input_buffer
    bl print_string

    ; A final flourish to end our program gracefully.
    ldr r0, =newline
    bl print_string

    ; And now, we bid farewell to our noble program.
    mov r7, #1
    svc 0

; Function to print a string to the screen.
print_string:
    ; The string to be printed is in r0.
    mov r1, r0
    ; The length of the string is calculated.
    bl string_length
    ; We prepare the syscall for writing to stdout.
    mov r0, #1
    mov r2, r0
    mov r7, #4
    svc 0
    bx lr

; Function to calculate the length of a string.
string_length:
    ; The string is in r0.
    mov r1, r0
    mov r2, #0
string_length_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq string_length_end
    add r2, r2, #1
    b string_length_loop
string_length_end:
    mov r0, r2
    bx lr

; Function to read input from the user.
read_input:
    ; The buffer to store input is in r1.
    ; The maximum length of input is in r2.
    mov r0, #0
    mov r7, #3
    svc 0
    bx lr

