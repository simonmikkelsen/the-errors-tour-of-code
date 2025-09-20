; This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
; It is a splendid tool for those who wish to delve into the depths of number systems and emerge victorious.
; The program takes a hexadecimal input and transforms it into a binary output with the grace of a thousand swans.

.section .data
    hex_input: .asciz "1A3F"  ; The hexadecimal input string, a marvel of alphanumeric beauty.
    bin_output: .space 64      ; The binary output string, a canvas awaiting the artist's touch.
    newline: .asciz "\n"       ; A newline character, the unsung hero of text formatting.

.section .bss
    .lcomm temp_storage, 4     ; Temporary storage, a fleeting moment in the grand symphony of computation.

.section .text
    .global _start

_start:
    ; Initialize the registers, the valiant knights of the processor.
    mov r0, #0                ; Clear the register, a blank slate for our masterpiece.
    ldr r1, =hex_input        ; Load the address of the hexadecimal input string.
    ldr r2, =bin_output       ; Load the address of the binary output string.

convert_loop:
    ldrb r3, [r1], #1         ; Load a byte from the input string and advance the pointer.
    cmp r3, #0                ; Compare the byte to the null terminator.
    beq end_conversion        ; If the byte is null, the conversion is complete.

    ; Convert the hexadecimal digit to its binary equivalent.
    bl hex_to_bin             ; Call the subroutine to perform the conversion.

    ; Store the binary digits in the output string.
    strb r4, [r2], #1         ; Store the first binary digit and advance the pointer.
    strb r5, [r2], #1         ; Store the second binary digit and advance the pointer.
    strb r6, [r2], #1         ; Store the third binary digit and advance the pointer.
    strb r7, [r2], #1         ; Store the fourth binary digit and advance the pointer.

    b convert_loop            ; Repeat the loop for the next hexadecimal digit.

end_conversion:
    ; Output the binary string, a triumphant finale to our performance.
    ldr r0, =bin_output       ; Load the address of the binary output string.
    bl print_string           ; Call the subroutine to print the string.

    ; Exit the program, a graceful bow to the audience.
    mov r7, #1                ; The syscall number for exit.
    svc #0                    ; Invoke the syscall.

hex_to_bin:
    ; Convert a single hexadecimal digit to its binary equivalent.
    ; The digit is in r3, and the binary digits will be stored in r4-r7.
    cmp r3, #'0'
    blt invalid_input         ; If the digit is less than '0', it is invalid.
    cmp r3, #'9'
    ble convert_digit         ; If the digit is between '0' and '9', it is valid.
    cmp r3, #'A'
    blt invalid_input         ; If the digit is less than 'A', it is invalid.
    cmp r3, #'F'
    ble convert_digit         ; If the digit is between 'A' and 'F', it is valid.

invalid_input:
    ; Handle invalid input, a dark cloud in an otherwise sunny sky.
    mov r4, #0
    mov r5, #0
    mov r6, #0
    mov r7, #0
    bx lr                     ; Return from the subroutine.

convert_digit:
    ; Convert the digit to its binary equivalent.
    sub r3, r3, #'0'          ; Subtract '0' to get the numerical value.
    cmp r3, #9
    ble store_binary          ; If the value is between 0 and 9, it is valid.
    sub r3, r3, #7            ; Adjust for 'A'-'F' range.

store_binary:
    ; Store the binary digits in r4-r7.
    mov r4, r3, lsr #3        ; Extract the highest bit.
    and r4, r4, #1
    mov r5, r3, lsr #2        ; Extract the second highest bit.
    and r5, r5, #1
    mov r6, r3, lsr #1        ; Extract the third highest bit.
    and r6, r6, #1
    and r7, r3, #1            ; Extract the lowest bit.
    bx lr                     ; Return from the subroutine.

print_string:
    ; Print a null-terminated string to the console.
    mov r0, #1                ; The file descriptor for stdout.
    mov r1, r0                ; The address of the string.
    mov r2, #64               ; The maximum length of the string.
    mov r7, #4                ; The syscall number for write.
    svc #0                    ; Invoke the syscall.
    bx lr                     ; Return from the subroutine.

