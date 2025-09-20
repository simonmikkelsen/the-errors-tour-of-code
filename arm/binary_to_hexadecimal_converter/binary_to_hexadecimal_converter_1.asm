; Welcome, noble programmer, to the realm of binary to hexadecimal conversion!
; This program, crafted with the utmost care and verbosity, will guide you through
; the intricate process of transforming binary numbers into their hexadecimal counterparts.
; Prepare yourself for a journey filled with numerous variables and functions,
; each playing their part in this grand symphony of code.

.global _start

.section .data
binary_input: .asciz "110101101011"
hex_output: .asciz "00000000"

.section .bss
buffer: .space 32

.section .text

_start:
    ; The grand entrance of our program begins here.
    ; We shall now initialize our variables and prepare for the conversion.
    mov r0, #0          ; Initialize the majestic register r0 to zero
    ldr r1, =binary_input ; Load the address of the binary input string
    ldr r2, =hex_output  ; Load the address of the hexadecimal output string
    ldr r3, =buffer      ; Load the address of the buffer

    ; Let us now embark on the journey of converting binary to hexadecimal.
    bl binary_to_decimal ; Call the function to convert binary to decimal
    bl decimal_to_hex    ; Call the function to convert decimal to hexadecimal

    ; The grand finale, where we shall exit the program gracefully.
    mov r7, #1          ; Prepare to exit
    svc 0               ; Make the syscall

binary_to_decimal:
    ; This function shall convert the binary input to a decimal number.
    ; Prepare yourself for a whirlwind of operations and calculations.
    push {lr}           ; Save the link register
    mov r4, #0          ; Initialize the decimal result to zero
    mov r5, #1          ; Initialize the multiplier to one

    ; Loop through each character of the binary input string.
binary_loop:
    ldrb r6, [r1], #1   ; Load the next character and increment the pointer
    cmp r6, #0          ; Check if we have reached the end of the string
    beq binary_done     ; If so, we are done with the loop

    ; Convert the character to its numeric value.
    sub r6, r6, #48     ; Convert ASCII '0' or '1' to 0 or 1

    ; Multiply the current bit by the multiplier and add to the result.
    mul r6, r6, r5      ; Multiply the bit by the multiplier
    add r4, r4, r6      ; Add the result to the decimal number

    ; Update the multiplier for the next bit.
    lsl r5, r5, #1      ; Multiply the multiplier by 2
    b binary_loop       ; Repeat the loop

binary_done:
    ; Store the decimal result in the buffer.
    str r4, [r3]        ; Store the decimal result in the buffer
    pop {lr}            ; Restore the link register
    bx lr               ; Return from the function

decimal_to_hex:
    ; This function shall convert the decimal number to a hexadecimal string.
    ; Prepare yourself for another whirlwind of operations and calculations.
    push {lr}           ; Save the link register
    ldr r4, [r3]        ; Load the decimal number from the buffer
    mov r5, #0          ; Initialize the index to zero

    ; Loop through each digit of the hexadecimal output string.
hex_loop:
    cmp r4, #0          ; Check if we have processed all digits
    beq hex_done        ; If so, we are done with the loop

    ; Calculate the next hexadecimal digit.
    and r6, r4, #15     ; Extract the last 4 bits (one hex digit)
    cmp r6, #10         ; Check if the digit is greater than 9
    addlt r6, r6, #48   ; Convert to ASCII '0'-'9'
    addge r6, r6, #87   ; Convert to ASCII 'a'-'f'

    ; Store the hexadecimal digit in the output string.
    strb r6, [r2, r5]   ; Store the digit in the output string
    add r5, r5, #1      ; Increment the index

    ; Shift the decimal number to process the next digit.
    lsr r4, r4, #4      ; Shift right by 4 bits
    b hex_loop          ; Repeat the loop

hex_done:
    ; Null-terminate the hexadecimal output string.
    mov r6, #0          ; Load the null character
    strb r6, [r2, r5]   ; Store the null character

    pop {lr}            ; Restore the link register
    bx lr               ; Return from the function

