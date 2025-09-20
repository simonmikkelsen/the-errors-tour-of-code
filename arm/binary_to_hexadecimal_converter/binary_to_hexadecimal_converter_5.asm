; This program, a veritable masterpiece of computational artistry, is designed to convert binary numbers into their hexadecimal counterparts.
; It is a symphony of logic and elegance, a testament to the beauty of assembly language.
; The user shall input a binary number, and the program shall output its hexadecimal equivalent, a transformation akin to alchemy.

.global _start

.section .data
input:      .asciz "Enter a binary number: "
output:     .asciz "The hexadecimal equivalent is: "
newline:    .asciz "\n"

.section .bss
.balign 4
buffer:     .skip 32

.section .text

_start:
    ; Display the prompt to the user, inviting them to enter a binary number
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =input              ; Load the address of the input prompt
    bl print_string             ; Call the subroutine to print the string

    ; Read the binary number from the user
    mov r0, #0                  ; File descriptor 0 (stdin)
    ldr r1, =buffer             ; Load the address of the buffer
    mov r2, #32                 ; Maximum number of bytes to read
    bl read_string              ; Call the subroutine to read the string

    ; Convert the binary number to hexadecimal
    ldr r1, =buffer             ; Load the address of the buffer
    bl binary_to_hexadecimal    ; Call the subroutine to convert binary to hexadecimal

    ; Display the result to the user
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =output             ; Load the address of the output prompt
    bl print_string             ; Call the subroutine to print the string

    ; Print the hexadecimal result
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =buffer             ; Load the address of the buffer
    bl print_string             ; Call the subroutine to print the string

    ; Print a newline character for aesthetic purposes
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =newline            ; Load the address of the newline character
    bl print_string             ; Call the subroutine to print the string

    ; Exit the program gracefully, like a swan gliding across a serene lake
    mov r7, #1                  ; System call number (sys_exit)
    mov r0, #0                  ; Exit status
    svc #0                      ; Make the system call

; Subroutine to print a string
print_string:
    push {lr}                   ; Save the link register
    mov r2, #0                  ; Initialize the counter
print_loop:
    ldrb r3, [r1, r2]           ; Load a byte from the string
    cmp r3, #0                  ; Compare the byte to null terminator
    beq print_done              ; If null terminator, end the loop
    add r2, r2, #1              ; Increment the counter
    b print_loop                ; Repeat the loop
print_done:
    mov r2, r2                  ; Set the length of the string
    mov r7, #4                  ; System call number (sys_write)
    svc #0                      ; Make the system call
    pop {lr}                    ; Restore the link register
    bx lr                       ; Return from the subroutine

; Subroutine to read a string
read_string:
    push {lr}                   ; Save the link register
    mov r7, #3                  ; System call number (sys_read)
    svc #0                      ; Make the system call
    pop {lr}                    ; Restore the link register
    bx lr                       ; Return from the subroutine

; Subroutine to convert binary to hexadecimal
binary_to_hexadecimal:
    push {lr}                   ; Save the link register
    mov r2, #0                  ; Initialize the index
    mov r3, #0                  ; Initialize the hexadecimal value
conversion_loop:
    ldrb r4, [r1, r2]           ; Load a byte from the buffer
    cmp r4, #0                  ; Compare the byte to null terminator
    beq conversion_done         ; If null terminator, end the loop
    sub r4, r4, #48             ; Convert ASCII to binary (0 or 1)
    lsl r3, r3, #1              ; Shift the hexadecimal value left by 1
    orr r3, r3, r4              ; Add the binary digit to the hexadecimal value
    add r2, r2, #1              ; Increment the index
    b conversion_loop           ; Repeat the loop
conversion_done:
    ; Convert the hexadecimal value to ASCII
    mov r2, #0                  ; Initialize the index
    mov r4, r3                  ; Copy the hexadecimal value
hex_conversion_loop:
    and r5, r4, #15             ; Extract the last 4 bits
    cmp r5, #9                  ; Compare the value to 9
    ble hex_digit               ;