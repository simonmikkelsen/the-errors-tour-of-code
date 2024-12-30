; Welcome, dear programmer, to the magnificent world of ARM Assembly!
; This program is a splendid creation designed to convert hexadecimal numbers into their binary counterparts.
; Prepare yourself for a journey through the intricate dance of bits and bytes, where each instruction is a step in the grand ballet of computation.

.section .data
hex_input: .asciz "1A3F"  ; Behold, the hexadecimal string to be converted!

.section .bss
.balign 4
binary_output: .skip 32  ; A grand space reserved for the binary output!

.section .text
.global _start

_start:
    ; The grand entrance of our program begins here!
    ldr r0, =hex_input  ; Load the address of the hexadecimal input
    ldr r1, =binary_output  ; Load the address of the binary output
    bl hex_to_bin  ; Call the conversion function

    ; The final act: gracefully exit the program
    mov r7, #1  ; The syscall number for exit
    mov r0, #0  ; The exit status
    svc #0  ; Perform the syscall

; The function that performs the magical transformation from hexadecimal to binary
hex_to_bin:
    push {lr}  ; Preserve the return address
    mov r2, #0  ; Initialize the index for the binary output

convert_loop:
    ldrb r3, [r0], #1  ; Load a byte from the hexadecimal input and advance the pointer
    cmp r3, #0  ; Check if we've reached the end of the string
    beq end_conversion  ; If so, exit the loop

    ; Convert the hexadecimal digit to its binary representation
    bl hex_digit_to_bin  ; Call the helper function

    ; Store the binary digits in the output array
    str r4, [r1, r2]  ; Store the first binary digit
    add r2, r2, #1  ; Advance the index
    str r5, [r1, r2]  ; Store the second binary digit
    add r2, r2, #1  ; Advance the index
    str r6, [r1, r2]  ; Store the third binary digit
    add r2, r2, #1  ; Advance the index
    str r7, [r1, r2]  ; Store the fourth binary digit
    add r2, r2, #1  ; Advance the index

    b convert_loop  ; Repeat the loop for the next hexadecimal digit

end_conversion:
    pop {lr}  ; Restore the return address
    bx lr  ; Return from the function

; A helper function to convert a single hexadecimal digit to its binary representation
hex_digit_to_bin:
    push {lr}  ; Preserve the return address

    ; The grand conversion begins!
    cmp r3, #'0'
    blt invalid_digit
    cmp r3, #'9'
    ble convert_digit
    cmp r3, #'A'
    blt invalid_digit
    cmp r3, #'F'
    ble convert_digit
    cmp r3, #'a'
    blt invalid_digit
    cmp r3, #'f'
    ble convert_digit

invalid_digit:
    ; Handle invalid hexadecimal digits (though we expect none in this grand performance)
    mov r4, #0
    mov r5, #0
    mov r6, #0
    mov r7, #0
    b end_conversion

convert_digit:
    ; Convert the hexadecimal digit to its binary representation
    sub r3, r3, #'0'
    cmp r3, #9
    ble valid_digit
    sub r3, r3, #7

valid_digit:
    ; The binary conversion is performed here
    mov r4, r3, lsr #3  ; Extract the first binary digit
    and r4, r4, #1
    mov r5, r3, lsr #2  ; Extract the second binary digit
    and r5, r5, #1
    mov r6, r3, lsr #1  ; Extract the third binary digit
    and r6, r6, #1
    mov r7, r3  ; Extract the fourth binary digit
    and r7, r7, #1

    pop {lr}  ; Restore the return address
    bx lr  ; Return from the function
