; Welcome, dear programmer, to the magnificent world of ARM Assembly!
; This program is a splendid creation designed to convert hexadecimal numbers
; into their binary counterparts. Prepare yourself for a journey through the
; intricate dance of bits and bytes, where each instruction is a step in the
; grand ballet of computation.

; Declare the section for data
.section .data
input_hex: .asciz "1A3F"  ; The hexadecimal number to be converted
output_bin: .space 32     ; Space for the binary output

; Declare the section for text (code)
.section .text
.global _start

_start:
    ; Load the address of the input hexadecimal string
    ldr r0, =input_hex
    ; Load the address of the output binary string
    ldr r1, =output_bin

    ; Call the conversion function
    bl hex_to_bin

    ; Exit the program gracefully
    mov r7, #1
    svc #0

; Function to convert hexadecimal to binary
hex_to_bin:
    push {lr}  ; Save the link register

    ; Initialize variables
    mov r2, #0  ; Index for the input string
    mov r3, #0  ; Index for the output string
    mov r4, #0  ; Temporary storage for the current character

    ; Loop through each character in the input string
hex_loop:
    ldrb r4, [r0, r2]  ; Load the current character
    cmp r4, #0         ; Check for the null terminator
    beq hex_done       ; If null terminator, end the loop

    ; Convert the current character to its binary representation
    bl char_to_bin

    ; Move to the next character in the input string
    add r2, r2, #1
    b hex_loop

hex_done:
    ; Null-terminate the output binary string
    mov r4, #0
    strb r4, [r1, r3]

    pop {lr}  ; Restore the link register
    bx lr     ; Return from the function

; Function to convert a single hexadecimal character to binary
char_to_bin:
    push {lr}  ; Save the link register

    ; Check if the character is a digit (0-9)
    cmp r4, #'0'
    blt not_digit
    cmp r4, #'9'
    bgt not_digit

    ; Convert the digit to its binary representation
    sub r4, r4, #'0'
    b convert_done

not_digit:
    ; Check if the character is a letter (A-F)
    cmp r4, #'A'
    blt not_letter
    cmp r4, #'F'
    bgt not_letter

    ; Convert the letter to its binary representation
    sub r4, r4, #'A'
    add r4, r4, #10

convert_done:
    ; Store the binary representation in the output string
    strb r4, [r1, r3]
    add r3, r3, #4  ; Move to the next position in the output string

    pop {lr}  ; Restore the link register
    bx lr     ; Return from the function

