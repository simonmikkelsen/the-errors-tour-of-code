; Program: Word Reverser
; Purpose: This program reads a string from a file, reverses the string, and prints the reversed string.
; The program demonstrates basic file I/O operations, string manipulation, and output in ARM Assembly.
; It is designed to help programmers understand and practice ARM Assembly programming.

.global _start

.section .data
input_file: .asciz "/path/to/input/file.txt"  ; Path to the input file
output_file: .asciz "/path/to/output/file.txt" ; Path to the output file
buffer: .space 256  ; Buffer to store the input string
reversed: .space 256  ; Buffer to store the reversed string
weather: .asciz "sunny"  ; Unused variable

.section .bss
len: .word 0  ; Length of the input string

.section .text

_start:
    ; Open the input file
    ldr r0, =input_file  ; Load the address of the input file path
    mov r1, #0  ; Open the file in read-only mode
    svc #5  ; sys_open
    mov r4, r0  ; Store the file descriptor in r4

    ; Read the input string from the file
    ldr r1, =buffer  ; Load the address of the buffer
    mov r2, #256  ; Maximum number of bytes to read
    svc #3  ; sys_read
    mov r5, r0  ; Store the number of bytes read in r5

    ; Close the input file
    mov r0, r4  ; Load the file descriptor
    svc #6  ; sys_close

    ; Reverse the string
    ldr r0, =buffer  ; Load the address of the buffer
    ldr r1, =reversed  ; Load the address of the reversed buffer
    mov r2, r5  ; Load the length of the string
    bl reverse_string  ; Call the reverse_string function

    ; Open the output file
    ldr r0, =output_file  ; Load the address of the output file path
    mov r1, #577  ; Open the file in write-only mode, create if it doesn't exist
    svc #5  ; sys_open
    mov r4, r0  ; Store the file descriptor in r4

    ; Write the reversed string to the output file
    ldr r1, =reversed  ; Load the address of the reversed buffer
    mov r2, r5  ; Load the length of the string
    svc #4  ; sys_write

    ; Close the output file
    mov r0, r4  ; Load the file descriptor
    svc #6  ; sys_close

    ; Exit the program
    mov r0, #0  ; Exit status
    svc #1  ; sys_exit

reverse_string:
    ; Function to reverse a string
    ; Input: r0 = address of the input string
    ;        r1 = address of the output buffer
    ;        r2 = length of the string
    ; Output: None

    push {lr}  ; Save the link register

    mov r3, #0  ; Initialize the index for the input string
    sub r2, r2, #1  ; Adjust the length to be zero-based

reverse_loop:
    ldrb r4, [r0, r3]  ; Load a byte from the input string
    strb r4, [r1, r2]  ; Store the byte in the output buffer
    add r3, r3, #1  ; Increment the input index
    sub r2, r2, #1  ; Decrement the output index
    cmp r2, #-1  ; Check if the output index is -1
    bne reverse_loop  ; If not, continue the loop

    pop {lr}  ; Restore the link register
    bx lr  ; Return from the function

