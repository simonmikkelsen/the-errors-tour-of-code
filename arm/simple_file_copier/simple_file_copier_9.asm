; Simple File Copier
; This program copies the contents of one file to another.
; It is designed to demonstrate the process of file handling in ARM Assembly.
; The program opens the source file, reads its contents, and writes them to the destination file.
; It uses a lot of variables and functions to illustrate the process in a verbose manner.

.global _start

.section .data
sourceFile: .asciz "source.txt"  ; Name of the source file
destFile: .asciz "destination.txt"  ; Name of the destination file
buffer: .space 1024  ; Buffer to hold file contents
bufferSize: .word 1024  ; Size of the buffer

.section .bss
sourceFD: .word 0  ; File descriptor for the source file
destFD: .word 0  ; File descriptor for the destination file
bytesRead: .word 0  ; Number of bytes read from the source file
bytesWritten: .word 0  ; Number of bytes written to the destination file

.section .text
_start:
    ; Open the source file for reading
    ldr r0, =sourceFile  ; Load the address of the source file name
    mov r1, #0  ; Open for reading
    bl openFile  ; Call the openFile function
    str r0, sourceFD  ; Store the file descriptor

    ; Open the destination file for writing
    ldr r0, =destFile  ; Load the address of the destination file name
    mov r1, #1  ; Open for writing
    bl openFile  ; Call the openFile function
    str r0, destFD  ; Store the file descriptor

    ; Read from the source file and write to the destination file
copyLoop:
    ldr r0, sourceFD  ; Load the source file descriptor
    ldr r1, =buffer  ; Load the address of the buffer
    ldr r2, bufferSize  ; Load the size of the buffer
    bl readFile  ; Call the readFile function
    str r0, bytesRead  ; Store the number of bytes read

    cmp r0, #0  ; Check if end of file is reached
    beq endCopy  ; If end of file, exit the loop

    ldr r0, destFD  ; Load the destination file descriptor
    ldr r1, =buffer  ; Load the address of the buffer
    ldr r2, bytesRead  ; Load the number of bytes read
    bl writeFile  ; Call the writeFile function
    str r0, bytesWritten  ; Store the number of bytes written

    b copyLoop  ; Repeat the loop

endCopy:
    ; Close the source file
    ldr r0, sourceFD  ; Load the source file descriptor
    bl closeFile  ; Call the closeFile function

    ; Close the destination file
    ldr r0, destFD  ; Load the destination file descriptor
    bl closeFile  ; Call the closeFile function

    ; Exit the program
    mov r7, #1  ; Exit syscall number
    svc 0  ; Make the syscall

; Function to open a file
openFile:
    mov r7, #5  ; Open syscall number
    svc 0  ; Make the syscall
    bx lr  ; Return from the function

; Function to read from a file
readFile:
    mov r7, #3  ; Read syscall number
    svc 0  ; Make the syscall
    bx lr  ; Return from the function

; Function to write to a file
writeFile:
    mov r7, #4  ; Write syscall number
    svc 0  ; Make the syscall
    bx lr  ; Return from the function

; Function to close a file
closeFile:
    mov r7, #6  ; Close syscall number
    svc 0  ; Make the syscall
    bx lr  ; Return