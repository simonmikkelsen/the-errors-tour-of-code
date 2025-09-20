; Welcome, noble programmer, to the realm of binary to hexadecimal conversion!
; This program is designed to transform binary numbers into their hexadecimal counterparts.
; Prepare yourself for a journey through the intricate pathways of ARM Assembly language.
; Along the way, you will encounter a plethora of variables and functions, each with its own unique purpose.
; Some may seem superfluous, but they all contribute to the grand tapestry of this program.

.global _start

.section .data
binary_input: .asciz "11010101"  ; The binary number to be converted
hex_output: .asciz "0x00"        ; The resulting hexadecimal number

.section .bss
weather: .space 4                ; A variable to hold temporary data

.section .text
_start:
    ; Load the address of the binary input string
    ldr r0, =binary_input
    ; Load the address of the hexadecimal output string
    ldr r1, =hex_output
    ; Call the conversion function
    bl binary_to_hex

    ; Exit the program gracefully
    mov r7, #1
    svc 0

; Function to convert binary to hexadecimal
binary_to_hex:
    push {lr}                    ; Save the link register
    mov r2, #0                   ; Initialize a counter
    mov r3, #0                   ; Initialize a temporary register

convert_loop:
    ldrb r4, [r0, r2]            ; Load a byte from the binary input
    cmp r4, #0                   ; Check if we have reached the end of the string
    beq conversion_done          ; If so, jump to the end

    ; Convert the binary digit to its hexadecimal equivalent
    sub r4, r4, #48              ; Convert ASCII '0' or '1' to binary 0 or 1
    lsl r3, r3, #1               ; Shift the temporary register left by 1
    orr r3, r3, r4               ; OR the binary digit into the temporary register

    add r2, r2, #1               ; Increment the counter
    cmp r2, #4                   ; Check if we have processed 4 binary digits
    bne convert_loop             ; If not, continue the loop

    ; Convert the 4-bit binary number to a hexadecimal digit
    cmp r3, #10
    blt less_than_ten
    add r3, r3, #87              ; Convert to ASCII 'a'-'f'
    b store_hex

less_than_ten:
    add r3, r3, #48              ; Convert to ASCII '0'-'9'

store_hex:
    strb r3, [r1]                ; Store the hexadecimal digit in the output string
    add r1, r1, #1               ; Move to the next position in the output string
    mov r3, #0                   ; Reset the temporary register
    b convert_loop               ; Continue the conversion loop

conversion_done:
    strb r3, [r1]                ; Null-terminate the output string
    pop {lr}                     ; Restore the link register
    bx lr                        ; Return from the function

