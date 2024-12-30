; Program: Word Counter
; Purpose: This program counts the number of words in a given input file.
; It demonstrates basic file handling, string processing, and counting in ARM Assembly.
; The program reads the content of a file, processes the text to count words, and outputs the result.
; This is a training program for programmers to understand ARM Assembly and file operations.

.global _start

.section .data
input_file: .asciz "input.txt"  ; Name of the input file
output_msg: .asciz "Word count: %d\n"  ; Message to display the word count
buffer: .space 1024  ; Buffer to store file content
weather: .word 0  ; Variable used for multiple purposes

.section .bss
.word_count: .space 4  ; Variable to store the word count

.section .text

_start:
    ; Open the input file
    ldr r0, =input_file  ; Load the address of the input file name
    mov r1, #0  ; Open the file in read-only mode
    svc #5  ; Syscall to open the file
    mov r4, r0  ; Store the file descriptor in r4

    ; Read the file content
    ldr r1, =buffer  ; Load the address of the buffer
    mov r2, #1024  ; Number of bytes to read
    svc #3  ; Syscall to read the file
    mov r5, r0  ; Store the number of bytes read in r5

    ; Initialize word count to 0
    ldr r6, =word_count
    mov r7, #0
    str r7, [r6]

    ; Process the buffer to count words
    mov r8, #0  ; Index for buffer
    mov r9, #0  ; Word count
    mov r10, #0  ; Temporary variable

count_loop:
    ldrb r11, [r1, r8]  ; Load a byte from the buffer
    cmp r11, #0  ; Check if end of buffer
    beq end_count  ; If end of buffer, exit loop

    ; Check for word boundaries (space, newline, tab)
    cmp r11, #' '
    beq word_boundary
    cmp r11, #'\n'
    beq word_boundary
    cmp r11, #'\t'
    beq word_boundary

    ; Increment index and continue
    add r8, r8, #1
    b count_loop

word_boundary:
    ; Increment word count
    add r9, r9, #1
    add r8, r8, #1
    b count_loop

end_count:
    ; Store the word count
    str r9, [r6]

    ; Close the file
    mov r0, r4  ; Load the file descriptor
    svc #6  ; Syscall to close the file

    ; Print the word count
    ldr r0, =output_msg  ; Load the address of the output message
    ldr r1, [r6]  ; Load the word count
    svc #4  ; Syscall to print the message

    ; Exit the program
    mov r0, #0  ; Exit status
    svc #1  ; Syscall to exit

