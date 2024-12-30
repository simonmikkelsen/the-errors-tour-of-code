; Welcome, dear programmer, to the wondrous world of ARM Assembly!
; This program is a delightful journey through the conversion of binary numbers
; into their hexadecimal counterparts. Prepare yourself for an adventure filled
; with verbose comments and a plethora of variables and functions that may or may not
; serve a purpose. Enjoy the ride!

.global _start

.section .data
binary_input: .asciz "110101101011"  ; Behold, the binary string to be converted!
hex_output: .asciz "00000000"        ; A place to store the magnificent hexadecimal result

.section .bss
.lcomm temp_storage, 4               ; Temporary storage for our grand calculations

.section .text

_start:
    ; Ah, the beginning of our journey! Let's load the binary string.
    ldr r0, =binary_input            ; Load the address of the binary input
    ldr r1, =hex_output              ; Load the address of the hexadecimal output
    bl binary_to_hex                 ; Call the conversion function

    ; The end is nigh! Exit the program gracefully.
    mov r7, #1                       ; Prepare to exit
    svc 0                            ; Make the system call

; The grand conversion function!
binary_to_hex:
    push {lr}                        ; Save the return address, for we shall return!
    mov r2, #0                       ; Initialize our index to zero
    mov r3, #0                       ; Initialize our temporary result to zero

convert_loop:
    ldrb r4, [r0, r2]                ; Load the next character from the binary string
    cmp r4, #0                       ; Compare it to the null terminator
    beq conversion_done              ; If it's the end, we're done!

    ; Convert the binary digit to its numerical value
    sub r4, r4, #'0'                 ; Subtract the ASCII value of '0'
    add r3, r3, r3                   ; Shift the result left by 1 (multiply by 2)
    add r3, r3, r4                   ; Add the new digit

    add r2, r2, #1                   ; Move to the next character
    b convert_loop                   ; Repeat the loop

conversion_done:
    ; Convert the numerical result to a hexadecimal string
    mov r5, r3                       ; Copy the result to another register
    mov r6, #0                       ; Initialize our hex index to zero

hex_conversion_loop:
    and r7, r5, #0xF                 ; Mask the lowest 4 bits
    cmp r7, #9                       ; Compare to 9
    ble hex_digit_is_number          ; If less than or equal, it's a number

    ; Convert to a letter (A-F)
    add r7, r7, #'A' - 10            ; Convert to ASCII letter

    b hex_digit_done                 ; Skip to the end

hex_digit_is_number:
    ; Convert to a number (0-9)
    add r7, r7, #'0'                 ; Convert to ASCII number

hex_digit_done:
    strb r7, [r1, r6]                ; Store the hex digit in the output string
    add r6, r6, #1                   ; Move to the next position
    lsr r5, r5, #4                   ; Shift the result right by 4 bits

    cmp r5, #0                       ; Check if there are more digits
    bne hex_conversion_loop          ; If so, repeat the loop

    ; Null-terminate the hex string
    mov r7, #0
    strb r7, [r1, r6]

    pop {lr}                         ; Restore the return address
    bx lr                            ; Return from whence we came

