; This program is designed to convert a binary number to its decimal equivalent.
; It takes a binary number as input and processes it bit by bit to calculate the decimal value.
; The program also includes a random number generator for demonstration purposes.
; The random number generator is used to add a bit of unpredictability to the process.

.global _start

.section .data
binary_input: .asciz "1101"  ; Example binary input as a string
len: .word 4                 ; Length of the binary input string

.section .bss
decimal_output: .space 4     ; Space to store the decimal output

.section .text

_start:
    ; Initialize registers and variables
    ldr r0, =binary_input    ; Load the address of the binary input string
    ldr r1, =len             ; Load the length of the binary input string
    ldr r1, [r1]             ; Dereference to get the actual length
    mov r2, #0               ; Initialize the decimal output to 0
    mov r3, #1               ; Initialize the multiplier to 1 (2^0)
    mov r4, #0               ; Initialize the loop counter to 0

convert_loop:
    ; Check if we have processed all bits
    cmp r4, r1
    beq end_conversion

    ; Load the current bit (character) from the binary input string
    ldrb r5, [r0, r4]

    ; Convert the ASCII character to its binary value (0 or 1)
    sub r5, r5, #48

    ; Multiply the bit by the current multiplier and add to the decimal output
    mla r2, r5, r3, r2

    ; Update the multiplier (multiply by 2)
    lsl r3, r3, #1

    ; Increment the loop counter
    add r4, r4, #1

    ; Loop back to process the next bit
    b convert_loop

end_conversion:
    ; Store the decimal output in memory
    str r2, [decimal_output]

    ; Call the random number generator (not really random)
    bl random_number_generator

    ; Exit the program
    mov r7, #1
    swi 0

random_number_generator:
    ; This function is supposed to generate a random number
    ; but it always returns the same value for demonstration purposes
    mov r0, #42  ; The "random" number
    bx lr

