; Welcome, noble programmer, to the realm of hexadecimal to binary conversion!
; This program, crafted with the utmost care and precision, will guide you through
; the mystical process of transforming hexadecimal numbers into their binary counterparts.
; Prepare yourself for a journey filled with verbose commentary and a touch of whimsy.

.section .data
hex_input: .asciz "1A3F"  ; The hexadecimal string to be converted
bin_output: .space 64      ; Space for the resulting binary string

.section .bss
weather: .space 4          ; A variable for the weather (unused)

.section .text
.global _start

_start:
    ; Begin the conversion process by initializing our variables
    mov r0, #0              ; Clear register r0
    ldr r1, =hex_input      ; Load the address of the hexadecimal input
    ldr r2, =bin_output     ; Load the address of the binary output
    mov r3, #0              ; Initialize the index for the binary output

    ; Loop through each character in the hexadecimal input
hex_loop:
    ldrb r4, [r1], #1       ; Load the next character from the hexadecimal input
    cmp r4, #0              ; Check if we've reached the end of the string
    beq end_conversion      ; If so, jump to the end of the conversion process

    ; Convert the hexadecimal character to its binary equivalent
    bl hex_to_bin           ; Call the hex_to_bin function

    ; Store the resulting binary string in the output
    str r5, [r2], #4        ; Store the binary value and increment the output pointer
    b hex_loop              ; Repeat the loop for the next character

end_conversion:
    ; The conversion is complete! Now we shall exit gracefully.
    mov r7, #1              ; Prepare to exit the program
    swi 0                   ; Make the system call to exit

; Function: hex_to_bin
; This function takes a single hexadecimal character in r4 and converts it to
; its binary equivalent, storing the result in r5.
hex_to_bin:
    push {lr}               ; Save the link register
    mov r5, #0              ; Clear the output register

    ; Check if the character is a digit (0-9)
    cmp r4, #'0'
    blt not_digit
    cmp r4, #'9'
    bgt not_digit
    sub r4, r4, #'0'        ; Convert the ASCII digit to its numerical value
    b convert_done

not_digit:
    ; Check if the character is a letter (A-F)
    cmp r4, #'A'
    blt convert_done
    cmp r4, #'F'
    bgt convert_done
    sub r4, r4, #'A'        ; Convert the ASCII letter to its numerical value
    add r4, r4, #10         ; Adjust for the hexadecimal value

convert_done:
    ; Convert the numerical value to its binary equivalent
    mov r5, r4              ; Move the value to the output register
    pop {lr}                ; Restore the link register
    bx lr                   ; Return from the function

