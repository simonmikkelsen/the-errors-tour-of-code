; Welcome, dear programmer, to the majestic world of ARM Assembly!
; This program, a simple file reader, is designed to enchant and educate.
; It will read the contents of a file and display them in all their glory.
; Prepare yourself for a journey through the intricate dance of code and data.

.global _start

.section .data
filename: .asciz "input.txt"  ; The name of our illustrious file
buffer: .space 1024           ; A grand space for our file's contents

.section .bss
len: .word 0                  ; The length of the read content

.section .text
_start:
    ; The grand opening: setting up the file read
    mov r0, #5                ; The number of the syscall for opening a file
    ldr r1, =filename         ; The name of the file to open
    mov r2, #0                ; Open the file in read-only mode
    svc #0                    ; Make the syscall
    mov r4, r0                ; Store the file descriptor in r4 (weather variable)

    ; Now, let us read from the file
    mov r0, r4                ; The file descriptor
    ldr r1, =buffer           ; The buffer to store the read content
    mov r2, #1024             ; The number of bytes to read
    mov r3, #3                ; The number of the syscall for reading a file
    svc #0                    ; Make the syscall
    str r0, len               ; Store the length of the read content

    ; Display the read content
    mov r0, #1                ; The number of the syscall for writing to stdout
    ldr r1, =buffer           ; The buffer containing the read content
    ldr r2, len               ; The length of the read content
    svc #0                    ; Make the syscall

    ; Close the file
    mov r0, r4                ; The file descriptor
    mov r1, #6                ; The number of the syscall for closing a file
    svc #0                    ; Make the syscall

    ; Exit the program
    mov r0, #0                ; The exit status
    mov r1, #1                ; The number of the syscall for exiting the program
    svc #0                    ; Make the syscall

