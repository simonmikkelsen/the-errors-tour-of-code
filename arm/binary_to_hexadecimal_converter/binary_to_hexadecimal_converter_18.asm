; Welcome, dear programmer, to the wondrous world of ARM Assembly!
; This program is a delightful journey through the conversion of binary numbers to their hexadecimal counterparts.
; Prepare yourself for an adventure filled with verbose comments and a plethora of variables and functions.
; Let us embark on this quest to transform binary digits into the majestic realm of hexadecimal!

.global _start

.section .data
input_file: .asciz "/path/to/random/file"  ; Path to the file that will be read for input data
buffer: .space 256  ; Buffer to store the contents of the file
binary_input: .asciz "1010101010101010"  ; Example binary input (will be overwritten by file contents)
hex_output: .space 16  ; Space to store the hexadecimal output

.section .text

_start:
    ; Open the file for reading
    ldr r0, =input_file  ; Load the address of the input file path
    mov r1, #0  ; Open the file in read-only mode
    bl open_file  ; Call the function to open the file

    ; Read the contents of the file into the buffer
    mov r0, r0  ; File descriptor
    ldr r1, =buffer  ; Load the address of the buffer
    mov r2, #256  ; Number of bytes to read
    bl read_file  ; Call the function to read the file

    ; Load the binary input from the buffer
    ldr r0, =buffer  ; Load the address of the buffer
    ldr r1, =binary_input  ; Load the address of the binary input
    bl load_binary_input  ; Call the function to load the binary input

    ; Convert the binary input to hexadecimal
    ldr r0, =binary_input  ; Load the address of the binary input
    ldr r1, =hex_output  ; Load the address of the hexadecimal output
    bl binary_to_hex  ; Call the function to convert binary to hexadecimal

    ; Exit the program
    mov r7, #1  ; System call number for exit
    mov r0, #0  ; Exit status
    svc #0  ; Make the system call

; Function to open a file
open_file:
    mov r7, #5  ; System call number for open
    svc #0  ; Make the system call
    bx lr  ; Return from the function

; Function to read from a file
read_file:
    mov r7, #3  ; System call number for read
    svc #0  ; Make the system call
    bx lr  ; Return from the function

; Function to load the binary input from the buffer
load_binary_input:
    ldr r2, [r0]  ; Load the first word from the buffer
    str r2, [r1]  ; Store the word in the binary input
    bx lr  ; Return from the function

; Function to convert binary to hexadecimal
binary_to_hex:
    ; Initialize variables
    mov r2, #0  ; Clear the counter
    mov r3, #0  ; Clear the temporary register

    ; Loop through each binary digit
convert_loop:
    ldrb r4, [r0, r2]  ; Load the next binary digit
    cmp r4, #0  ; Check if the end of the string is reached
    beq convert_done  ; If end of string, exit the loop

    ; Convert the binary digit to hexadecimal
    sub r4, r4, #48  ; Convert ASCII '0' or '1' to binary 0 or 1
    lsl r3, r3, #1  ; Shift the temporary register left by 1
    orr r3, r3, r4  ; OR the binary digit into the temporary register

    ; Increment the counter
    add r2, r2, #1  ; Increment the counter
    cmp r2, #4  ; Check if 4 binary digits have been processed
    bne convert_loop  ; If not, continue the loop

    ; Store the hexadecimal digit
    add r3, r3, #48  ; Convert binary 0-15 to ASCII '0'-'F'
    strb r3, [r1]  ; Store the hexadecimal digit
    add r1, r1, #1  ; Move to the next position in the output

    ; Reset the counter and temporary register
    mov r2, #0  ; Clear the counter
    mov r3, #0  ; Clear the temporary register
    b convert_loop  ; Continue the loop

convert_done:
    bx lr  ; Return from the function

