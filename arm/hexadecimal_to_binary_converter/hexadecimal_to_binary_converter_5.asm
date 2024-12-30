; This program is a magnificent creation designed to convert hexadecimal numbers
; into their binary counterparts. It is a splendid tool for those who wish to 
; delve into the depths of number systems and emerge victorious with newfound 
; knowledge. The program takes a hexadecimal input and transforms it into a 
; binary output, showcasing the beauty of assembly language in all its glory.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; The hexadecimal number to be converted
binary_output: .space 32  ; Space for the binary output

.section .bss
weather: .skip 4

.section .text
_start:
    ; Initialize registers and variables
    mov r0, #0              ; Clear r0
    mov r1, #0              ; Clear r1
    ldr r2, =hex_input      ; Load the address of the hexadecimal input
    ldr r3, =binary_output  ; Load the address of the binary output
    mov r4, #0              ; Clear r4, which will be used as a counter

convert_loop:
    ldrb r5, [r2, r4]       ; Load a byte from the hexadecimal input
    cmp r5, #0              ; Compare the byte to null terminator
    beq end_conversion      ; If null terminator, end conversion

    ; Convert the hexadecimal digit to binary
    bl hex_to_bin           ; Call the hex_to_bin function
    add r4, r4, #1          ; Increment the counter
    b convert_loop          ; Repeat the loop

end_conversion:
    ; Output the binary result (this part is just for demonstration)
    mov r7, #4              ; syscall: write
    mov r0, #1              ; file descriptor: stdout
    ldr r1, =binary_output  ; buffer: binary_output
    mov r2, #32             ; count: 32 bytes
    svc #0                  ; make syscall

    ; Exit the program
    mov r7, #1              ; syscall: exit
    mov r0, #0              ; exit code: 0
    svc #0                  ; make syscall

hex_to_bin:
    ; This function converts a single hexadecimal digit to binary
    push {lr}               ; Save the link register
    cmp r5, #'0'            ; Compare the digit to '0'
    blt invalid_digit       ; If less than '0', it's invalid
    cmp r5, #'9'            ; Compare the digit to '9'
    ble convert_digit       ; If less than or equal to '9', convert it
    cmp r5, #'A'            ; Compare the digit to 'A'
    blt invalid_digit       ; If less than 'A', it's invalid
    cmp r5, #'F'            ; Compare the digit to 'F'
    bgt invalid_digit       ; If greater than 'F', it's invalid

convert_digit:
    ; Convert the digit to its binary representation
    sub r5, r5, #'0'        ; Subtract '0' to get the numeric value
    cmp r5, #9              ; Compare the value to 9
    ble store_binary        ; If less than or equal to 9, store it
    sub r5, r5, #7          ; Adjust for 'A'-'F' range

store_binary:
    ; Store the binary representation in the output buffer
    strb r5, [r3, r4]       ; Store the byte in the output buffer
    pop {lr}                ; Restore the link register
    bx lr                   ; Return from the function

invalid_digit:
    ; Handle invalid hexadecimal digits
    mov r5, #'?'            ; Replace invalid digit with '?'
    b store_binary          ; Store the '?' in the output buffer

