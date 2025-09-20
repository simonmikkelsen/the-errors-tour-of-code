; This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
; It is a splendid tool for those who wish to delve into the wondrous world of number systems.
; The program takes a binary number as input and outputs the corresponding hexadecimal number.
; Prepare to be dazzled by the elegance and sophistication of this code!

.global _start

.section .data
binary_input: .asciz "1101"  ; The binary number to be converted, stored as a string
hex_output: .asciz "0000"    ; Placeholder for the hexadecimal output

.section .bss
buffer: .space 16            ; A buffer to hold intermediate values

.section .text

_start:
    ; Load the address of the binary input into register r0
    ldr r0, =binary_input

    ; Load the address of the hexadecimal output into register r1
    ldr r1, =hex_output

    ; Call the function to convert binary to hexadecimal
    bl binary_to_hex

    ; Exit the program gracefully
    mov r7, #1
    svc #0

; This function converts a binary string to a hexadecimal string
binary_to_hex:
    push {lr}                ; Save the link register
    mov r2, #0               ; Initialize a counter for the binary string
    mov r3, #0               ; Initialize a variable to hold the current binary digit
    mov r4, #0               ; Initialize a variable to hold the current hexadecimal digit
    mov r5, #0               ; Initialize a variable to hold the length of the binary string

    ; Calculate the length of the binary string
calculate_length:
    ldrb r6, [r0, r2]        ; Load the current character from the binary string
    cmp r6, #0               ; Compare the character to the null terminator
    beq length_calculated    ; If the null terminator is found, exit the loop
    add r2, r2, #1           ; Increment the counter
    b calculate_length       ; Repeat the loop

length_calculated:
    mov r5, r2               ; Store the length of the binary string in r5
    mov r2, #0               ; Reset the counter for the binary string

    ; Convert the binary string to a hexadecimal string
convert_loop:
    ldrb r6, [r0, r2]        ; Load the current character from the binary string
    cmp r6, #0               ; Compare the character to the null terminator
    beq conversion_done      ; If the null terminator is found, exit the loop

    ; Convert the binary digit to an integer
    sub r6, r6, #48          ; Convert ASCII '0' or '1' to integer 0 or 1
    add r3, r3, r6           ; Add the binary digit to the current value
    add r4, r4, r3           ; Add the current value to the hexadecimal digit

    ; Check if four binary digits have been processed
    add r2, r2, #1           ; Increment the counter
    cmp r2, #4               ; Compare the counter to 4
    bne convert_loop         ; If less than 4 digits, repeat the loop

    ; Convert the hexadecimal digit to a character
    cmp r4, #10              ; Compare the hexadecimal digit to 10
    blt less_than_ten        ; If less than 10, jump to less_than_ten
    add r4, r4, #87          ; Convert 10-15 to 'a'-'f'
    b store_hex_digit

less_than_ten:
    add r4, r4, #48          ; Convert 0-9 to '0'-'9'

store_hex_digit:
    strb r4, [r1]            ; Store the hexadecimal digit in the output string
    add r1, r1, #1           ; Move to the next position in the output string
    mov r3, #0               ; Reset the current value
    mov r4, #0               ; Reset the hexadecimal digit
    b convert_loop           ; Repeat the loop

conversion_done:
    strb r4, [r1]            ; Store the final hexadecimal digit in the output string
    pop {lr}                 ; Restore the link register
    bx lr                    ; Return from the function

