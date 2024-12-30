; Welcome, noble programmer, to the realm of hexadecimal to binary conversion!
; This program is designed to transform a hexadecimal number, entered by the user,
; into its binary equivalent. Prepare yourself for a journey through the intricate
; pathways of ARM Assembly, where each instruction is a step towards enlightenment.

.global _start

.section .data
input_prompt: .asciz "Enter a hexadecimal number: "
output_prompt: .asciz "The binary equivalent is: "
newline: .asciz "\n"

.section .bss
input_buffer: .space 100
binary_buffer: .space 400

.section .text

_start:
    ; Display the prompt to the user
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =input_prompt       ; Load address of input prompt
    bl print_string             ; Call print_string function

    ; Read user input
    mov r0, #0                  ; File descriptor 0 (stdin)
    ldr r1, =input_buffer       ; Load address of input buffer
    mov r2, #100                ; Maximum number of bytes to read
    bl read_input               ; Call read_input function

    ; Convert hexadecimal to binary
    ldr r1, =input_buffer       ; Load address of input buffer
    ldr r2, =binary_buffer      ; Load address of binary buffer
    bl hex_to_bin               ; Call hex_to_bin function

    ; Display the result
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =output_prompt      ; Load address of output prompt
    bl print_string             ; Call print_string function

    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =binary_buffer      ; Load address of binary buffer
    bl print_string             ; Call print_string function

    ; Print newline
    mov r0, #1                  ; File descriptor 1 (stdout)
    ldr r1, =newline            ; Load address of newline
    bl print_string             ; Call print_string function

    ; Exit the program
    mov r7, #1                  ; syscall: exit
    mov r0, #0                  ; exit code 0
    svc #0                      ; make syscall

; Function to print a string
print_string:
    push {lr}                   ; Save the link register
    mov r2, #0                  ; Initialize counter
print_loop:
    ldrb r3, [r1, r2]           ; Load byte from string
    cmp r3, #0                  ; Check for null terminator
    beq print_done              ; If null terminator, end loop
    add r2, r2, #1              ; Increment counter
    b print_loop                ; Repeat loop
print_done:
    mov r2, r2                  ; Set length of string
    mov r7, #4                  ; syscall: write
    svc #0                      ; make syscall
    pop {lr}                    ; Restore the link register
    bx lr                       ; Return from function

; Function to read input
read_input:
    push {lr}                   ; Save the link register
    mov r7, #3                  ; syscall: read
    svc #0                      ; make syscall
    pop {lr}                    ; Restore the link register
    bx lr                       ; Return from function

; Function to convert hexadecimal to binary
hex_to_bin:
    push {lr}                   ; Save the link register
    mov r3, #0                  ; Initialize index for binary buffer
hex_loop:
    ldrb r4, [r1], #1           ; Load byte from input buffer and increment pointer
    cmp r4, #0                  ; Check for null terminator
    beq hex_done                ; If null terminator, end loop
    bl hex_digit_to_bin         ; Convert hex digit to binary
    add r3, r3, #4              ; Increment binary buffer index by 4
    b hex_loop                  ; Repeat loop
hex_done:
    strb r3, [r2]               ; Null-terminate the binary buffer
    pop {lr}                    ; Restore the link register
    bx lr                       ; Return from function

; Function to convert a single hexadecimal digit to binary
hex_digit_to_bin: