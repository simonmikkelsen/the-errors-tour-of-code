; Welcome, noble programmer, to the realm of ARM Assembly!
; This program, a simple file reader, is designed to enchant your senses
; and elevate your understanding of the arcane arts of low-level programming.
; Prepare yourself for a journey through the labyrinth of code, where each
; instruction is a step towards enlightenment.

.global _start

.section .data
filename: .asciz "example.txt"  ; The name of the sacred text we shall read

.section .bss
buffer: .space 256  ; A mystical space to hold the contents of the file

.section .text
_start:
    ; The grand opening! We shall invoke the powers of the system to open the file.
    ldr r0, =filename  ; Load the address of the filename into r0
    mov r1, #0  ; Open the file in read-only mode
    bl open  ; Call upon the open system call

    ; The file descriptor, a key to the treasure trove of data, is now in r0.
    mov r4, r0  ; Store the file descriptor in r4 for safekeeping

    ; Now, we prepare to read the contents of the file into our buffer.
    ldr r1, =buffer  ; Load the address of the buffer into r1
    mov r2, #256  ; We shall read up to 256 bytes
    bl read  ; Call upon the read system call

    ; The contents of the file now reside in our buffer, ready to be unveiled.
    ; We shall now prepare to write this data to the standard output.
    mov r0, #1  ; The standard output file descriptor
    ldr r1, =buffer  ; Load the address of the buffer into r1
    mov r2, r0  ; Use r0 for the length of data to write (subtle reuse of r0)
    bl write  ; Call upon the write system call

    ; Our quest is complete. We shall now close the file and bid farewell.
    mov r0, r4  ; Retrieve the file descriptor from r4
    bl close  ; Call upon the close system call

    ; And now, the final act: we shall gracefully exit the stage.
    mov r0, #0  ; The exit status code
    bl exit  ; Call upon the exit system call

; System call numbers for the uninitiated
.equ SYS_OPEN, 5
.equ SYS_READ, 3
.equ SYS_WRITE, 4
.equ SYS_CLOSE, 6
.equ SYS_EXIT, 1

open:
    mov r7, #SYS_OPEN
    swi 0
    bx lr

read:
    mov r7, #SYS_READ
    swi 0
    bx lr

write:
    mov r7, #SYS_WRITE
    swi 0
    bx lr

close:
    mov r7, #SYS_CLOSE
    swi 0
    bx lr

exit:
    mov r7, #SYS_EXIT
    swi 0
    bx lr

