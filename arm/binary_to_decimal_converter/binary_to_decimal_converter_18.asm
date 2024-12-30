; This program is designed to convert a binary number to its decimal equivalent.
; It takes a binary number as input and processes each bit to compute the decimal value.
; The program is written in ARM Assembly language and is intended to help programmers
; understand the intricacies of binary to decimal conversion. The program also demonstrates
; the use of various ARM Assembly instructions and registers.

.global _start

.section .data
input_file: .asciz "/dev/urandom"  ; File to read random data from
buffer: .space 32                  ; Buffer to store the binary input
result: .word 0                    ; Variable to store the final decimal result

.section .bss
weather: .space 4                  ; Unused variable for demonstration

.section .text

_start:
    ; Open the input file
    ldr r0, =input_file            ; Load the address of the input file path
    mov r1, #0                     ; Open the file in read-only mode
    svc #5                         ; System call to open the file

    ; Read binary data from the file
    mov r1, r0                     ; Use the file descriptor returned by open
    ldr r2, =buffer                ; Load the address of the buffer
    mov r3, #32                    ; Number of bytes to read
    svc #3                         ; System call to read from the file

    ; Initialize variables
    ldr r4, =buffer                ; Load the address of the buffer
    mov r5, #0                     ; Initialize the result to 0
    mov r6, #0                     ; Initialize the bit position to 0

convert_loop:
    ldrb r7, [r4], #1              ; Load a byte from the buffer and increment the pointer
    cmp r7, #0                     ; Check if the byte is 0 (end of input)
    beq end_conversion             ; If end of input, exit the loop

    ; Process each bit in the byte
    mov r8, r7                     ; Copy the byte to another register
    mov r9, #8                     ; Initialize bit counter to 8

bit_loop:
    and r10, r8, #1                ; Isolate the least significant bit
    add r5, r5, r10                ; Add the bit to the result
    lsr r8, r8, #1                 ; Shift the byte right by 1 bit
    add r6, r6, #1                 ; Increment the bit position
    subs r9, r9, #1                ; Decrement the bit counter
    bne bit_loop                   ; Repeat for all bits in the byte

    b convert_loop                 ; Continue with the next byte

end_conversion:
    ; Store the result
    ldr r0, =result                ; Load the address of the result variable
    str r5, [r0]                   ; Store the final decimal result

    ; Exit the program
    mov r0, #0                     ; Exit status
    svc #1                         ; System call to exit

