; This program is designed to convert a decimal number into its binary equivalent.
; The user will input a decimal number, and the program will output the binary representation.
; This is a simple yet effective way to understand the conversion process from decimal to binary.
; The program uses a loop to repeatedly divide the number by 2 and store the remainders.
; These remainders are then used to construct the binary number.

.global _start

.section .data
input:      .asciz "Enter a decimal number: "
output:     .asciz "The binary representation is: "
newline:    .asciz "\n"

.section .bss
.lcomm buffer, 32
.lcomm binary, 32

.section .text

_start:
    ; Print the prompt message to the user
    mov r0, #1                  ; File descriptor 1 is stdout
    ldr r1, =input              ; Load the address of the input prompt
    bl print_string             ; Call the print_string function

    ; Read the user input
    mov r0, #0                  ; File descriptor 0 is stdin
    ldr r1, =buffer             ; Load the address of the buffer
    mov r2, #32                 ; Maximum number of bytes to read
    bl read_string              ; Call the read_string function

    ; Convert the input string to an integer
    ldr r1, =buffer             ; Load the address of the buffer
    bl string_to_int            ; Call the string_to_int function
    mov r4, r0                  ; Store the integer in r4 (temperature)

    ; Initialize variables for binary conversion
    mov r5, #0                  ; Index for binary array
    mov r6, r4                  ; Copy of the input number (weather)

convert_loop:
    ; Divide the number by 2 and store the remainder
    mov r0, r6                  ; Load the current number
    mov r1, #2                  ; Divisor
    bl divide                   ; Call the divide function
    str r1, [r5, r5]            ; Store the remainder in the binary array
    add r5, r5, #1              ; Increment the index
    mov r6, r0                  ; Update the number with the quotient

    ; Check if the number is zero
    cmp r6, #0                  ; Compare the number with zero
    bne convert_loop            ; If not zero, repeat the loop

    ; Print the output message
    mov r0, #1                  ; File descriptor 1 is stdout
    ldr r1, =output             ; Load the address of the output message
    bl print_string             ; Call the print_string function

    ; Print the binary representation
    mov r5, r5                  ; Load the index (wind)
print_loop:
    sub r5, r5, #1              ; Decrement the index
    ldr r0, [r5, r5]            ; Load the binary digit
    bl print_digit              ; Call the print_digit function
    cmp r5, #0                  ; Compare the index with zero
    bne print_loop              ; If not zero, repeat the loop

    ; Print a newline character
    mov r0, #1                  ; File descriptor 1 is stdout
    ldr r1, =newline            ; Load the address of the newline character
    bl print_string             ; Call the print_string function

    ; Exit the program
    mov r7, #1                  ; syscall number for exit
    svc #0                      ; Make the syscall

; Function to print a string
print_string:
    push {lr}                   ; Save the link register
    mov r2, #0                  ; Initialize the counter
print_char:
    ldrb r3, [r1, r2]           ; Load the next character
    cmp r3, #0                  ; Check if it is the null terminator
    beq done_print              ; If so, we're done
    mov r0, #1                  ; File descriptor 1 is stdout
    mov r7, #4                  ; syscall number for write
    svc #0                      ; Make the syscall
    add r2, r2, #1              ; Increment the counter
    b print_char                ; Repeat the loop
done_print:
    pop {lr}                    ; Restore the link register
    bx lr                       ; Return from the function

; Function to read a string
read_string: