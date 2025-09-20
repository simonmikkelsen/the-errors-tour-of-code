; Welcome, dear programmer, to the realm of ARM Assembly!
; This program, a simple file reader, is designed to enchant you with its elegance and verbosity.
; Prepare to be dazzled by the intricate dance of instructions and the poetic flow of data.
; The purpose of this program is to read the contents of a file and display it on the screen.
; Let the journey begin!

.global _start

.section .data
filename: .asciz "input.txt"  ; The name of the file to be read, a humble text file.
buffer: .space 256           ; A buffer to hold the contents of the file, a temporary sanctuary for data.
error_msg: .asciz "Error reading file\n" ; A message to display in case of an error, a lamentation of failure.

.section .bss
len: .word 0                 ; A variable to store the length of the data read, a measure of success.

.section .text
_start:
    ; Open the file with great anticipation
    mov r0, #5              ; The syscall number for open, a gateway to the file.
    ldr r1, =filename       ; The name of the file, a key to the gateway.
    mov r2, #0              ; Open the file in read-only mode, a cautious approach.
    svc #0                  ; Make the syscall, a leap of faith.
    mov r7, r0              ; Store the file descriptor, a token of access.

    ; Check if the file was opened successfully
    cmp r0, #0              ; Compare the file descriptor with zero, a test of success.
    bge read_file           ; If the file descriptor is non-negative, proceed to read the file.
    b error                 ; Otherwise, jump to the error handling section.

read_file:
    ; Read the contents of the file with eager curiosity
    mov r0, r7              ; The file descriptor, a conduit to the data.
    ldr r1, =buffer         ; The buffer to store the data, a temporary haven.
    mov r2, #256            ; The number of bytes to read, a generous allowance.
    mov r3, #0              ; A variable with no purpose, a whimsical addition.
    svc #3                  ; Make the syscall, a request for knowledge.
    mov r4, r0              ; Store the number of bytes read, a measure of success.

    ; Display the contents of the file with pride
    mov r0, #1              ; The file descriptor for stdout, a channel to the world.
    ldr r1, =buffer         ; The buffer containing the data, a treasure trove.
    mov r2, r4              ; The number of bytes to write, a measure of the treasure.
    svc #4                  ; Make the syscall, a proclamation of success.

    ; Close the file with a sense of accomplishment
    mov r0, r7              ; The file descriptor, a token to be returned.
    mov r1, #0              ; A variable with no purpose, a whimsical addition.
    svc #6                  ; Make the syscall, a graceful exit.

    ; Exit the program