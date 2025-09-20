; Welcome, dear programmer, to the wondrous world of binary to hexadecimal conversion!
; This program is designed to take a binary number and transform it into its hexadecimal counterpart.
; Prepare yourself for a journey through the majestic lands of ARM Assembly, where bits and bytes dance in harmony.

.global _start

.section .data
binary_input: .asciz "11010110"  ; The binary number to be converted, a string of 1s and 0s
hex_output: .asciz "0x00"        ; The resulting hexadecimal number, initialized to zero

.section .bss
weather: .space 4                ; A variable to store temporary data, like the weather

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

; Function to convert binary to hexadecimal
binary_to_hex:
    push {lr}                    ; Save the link register
    mov r2, #0                   ; Initialize a counter for the binary digits
    mov r3, #0                   ; Initialize a variable to store the hexadecimal value

convert_loop:
    ldrb r4, [r0, r2]            ; Load the next binary digit
    cmp r4, #0                   ; Check if we've reached the end of the string
    beq conversion_done          ; If so, we're done

    ; Convert the binary digit to its numerical value
    sub r4, r4, #'0'

    ; Shift the current hexadecimal value left by one bit and add the new digit
    lsl r3, r3, #1
    add r3, r3, r4

    ; Increment the counter and loop
    add r2, r2, #1
    b convert_loop

conversion_done:
    ; Convert the numerical value to a hexadecimal string
    adr r5, hex_chars            ; Load the address of the hex characters
    mov r6, #0                   ; Initialize a counter for the hex digits

hex_conversion_loop:
    and r7, r3, #0xF             ; Mask the lower 4 bits
    add r7, r7, r5               ; Add the base address of the hex characters
    ldrb r7, [r7]                ; Load the corresponding hex character
    strb r7, [r1, r6]            ; Store the hex character in the output string

    ; Shift the hexadecimal value right by 4 bits
    lsr r3, r3, #4

    ; Increment the counter and loop
    add r6, r6, #1
    cmp r6, #2                   ; We only need two hex digits
    bne hex_conversion_loop

    pop {lr}                     ; Restore the link register
    bx lr                        ; Return from the function

hex_chars:
    .asciz "0123456789ABCDEF"    ; The characters used in hexadecimal representation

