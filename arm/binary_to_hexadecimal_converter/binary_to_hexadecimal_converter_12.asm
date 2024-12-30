; Hark! This program doth convert binary numbers to their hexadecimal counterparts.
; A noble endeavor to educate and enlighten the minds of programmers.
; With each instruction, we shall traverse the binary realm and emerge in the land of hexadecimals.
; Let us embark on this journey with valor and wisdom.

.global _start

.section .data
binary_input: .asciz "1101"  ; Behold! The binary string we shall convert.
hex_output: .asciz "0000"    ; Here shall the hexadecimal result be inscribed.

.section .bss
buffer: .space 16            ; A buffer to hold our temporary data, though it may be excessive.

.section .text

_start:
    ; Lo! We begin our quest by loading the binary input.
    ldr r0, =binary_input    ; Load the address of the binary input string.
    ldr r1, =hex_output      ; Load the address of the hexadecimal output string.
    bl binary_to_hex         ; Call upon the function to perform the conversion.

    ; The end of our journey is nigh. We shall now exit gracefully.
    mov r7, #1               ; Prepare to invoke the exit system call.
    svc #0                   ; Summon the kernel to terminate our noble program.

; Function: binary_to_hex
; This function doth convert a binary string to its hexadecimal equivalent.
binary_to_hex:
    push {lr}                ; Preserve the return address, for we shall return anon.
    mov r2, #0               ; Initialize a counter to traverse the binary string.
    mov r3, #0               ; Initialize a variable to hold the intermediate value.

convert_loop:
    ldrb r4, [r0, r2]        ; Load the next character of the binary string.
    cmp r4, #0               ; Compare the character to the null terminator.
    beq conversion_done      ; If we have reached the end, our task is complete.

    ; Convert the binary digit to its numerical value.
    sub r4, r4, #'0'         ; Subtract the ASCII value of '0' to get the binary digit.
    add r3, r3, r3           ; Shift the current value left by 1 (multiply by 2).
    add r3, r3, r4           ; Add the new binary digit to the current value.

    add r2, r2, #1           ; Move to the next character in the binary string.
    b convert_loop           ; Continue the conversion process.

conversion_done:
    ; Convert the numerical value to a hexadecimal string.
    mov r5, r3               ; Copy the numerical value to another register.
    mov r6, #0               ; Initialize a counter for the hexadecimal digits.

hex_conversion_loop:
    and r7, r5, #0xF         ; Extract the lowest 4 bits (a single hexadecimal digit).
    cmp r7, #10              ; Compare the digit to 10.
    addlt r7, r7, #'0'       ; If less than 10, convert to ASCII '0'-'9'.
    addge r7, r7, #'A' - 10  ; If 10 or greater, convert to ASCII 'A'-'F'.
    strb r7, [r1, r6]        ; Store the hexadecimal digit in the output string.

    lsr r5, r5, #4           ; Shift the value right by 4 bits (divide by 16).
    add r6, r6, #1           ; Move to the next position in the output string.
    cmp r5, #0               ; Check if there are more digits to convert.
    bne hex_conversion_loop  ; If so, continue the conversion process.

    pop {lr}                 ; Restore the return address.
    bx lr                    ; Return from whence we came.

