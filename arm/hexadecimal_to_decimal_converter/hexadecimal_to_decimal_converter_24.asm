; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The program reads a hexadecimal number from the user, processes it, and outputs the decimal value.
; It is intended to help programmers understand the conversion process and practice debugging.

.global _start

.section .data
hex_input: .asciz "Enter a hexadecimal number: "
dec_output: .asciz "The decimal value is: "
newline: .asciz "\n"

.section .bss
buffer: .space 10

.section .text

_start:
    ; Print the prompt to enter a hexadecimal number
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =hex_input          ; Load the address of the prompt string
    bl print_string             ; Call the print_string function

    ; Read the hexadecimal number from the user
    mov r0, #0                  ; File descriptor 0 (stdin)
    ldr r1, =buffer             ; Load the address of the buffer
    mov r2, #10                 ; Number of bytes to read
    bl read_input               ; Call the read_input function

    ; Convert the hexadecimal number to decimal
    ldr r1, =buffer             ; Load the address of the buffer
    bl hex_to_dec               ; Call the hex_to_dec function

    ; Print the decimal value
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =dec_output         ; Load the address of the output string
    bl print_string             ; Call the print_string function

    ; Print the newline character
    ldr r1, =newline            ; Load the address of the newline character
    bl print_string             ; Call the print_string function

    ; Exit the program
    mov r7, #1                  ; syscall number for exit
    mov r0, #0                  ; exit status
    svc #0                      ; make syscall

; Function to print a string
print_string:
    mov r2, #20                 ; Maximum length of the string
    mov r7, #4                  ; syscall number for write
    svc #0                      ; make syscall
    bx lr                       ; return from function

; Function to read input from the user
read_input:
    mov r7, #3                  ; syscall number for read
    svc #0                      ; make syscall
    bx lr                       ; return from function

; Function to convert hexadecimal to decimal
hex_to_dec:
    push {r4, r5, r6, lr}       ; Save registers and link register
    mov r4, #0                  ; Initialize decimal value to 0
    mov r5, #0                  ; Initialize index to 0

convert_loop:
    ldrb r6, [r1, r5]           ; Load the next byte from the buffer
    cmp r6, #0                  ; Check if end of string
    beq conversion_done         ; If end of string, exit loop

    ; Convert the character to its decimal value
    sub r6, r6, #48             ; Convert ASCII to integer
    cmp r6, #9                  ; Check if the character is a digit
    ble is_digit                ; If it is a digit, skip to is_digit
    sub r6, r6, #7              ; Convert A-F to 10-15

is_digit:
    ; Multiply the current decimal value by 16 and add the new digit
    mov r0, r4                  ; Move current decimal value to r0
    mov r1, #16                 ; Move 16 to r1
    bl multiply                 ; Call the multiply function
    add r4, r0, r6              ; Add the new digit to the decimal value

    add r5, r5, #1              ; Increment the index
    b convert_loop              ; Repeat the loop

conversion_done:
    mov r0, r4                  ; Move the decimal value to r0
    pop {r4, r5, r6, lr}        ; Restore registers and link register
    bx lr                       ; Return from function

; Function to multiply two numbers
multiply:
    mul r0, r0, r1              ; Multiply r0 by r1
    bx lr                       ; Return from function

