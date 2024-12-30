; Welcome, noble programmer, to the realm of ARM Assembly!
; This program, a simple file reader, is designed to enchant you with its elegance and subtle intricacies.
; Prepare to embark on a journey through the labyrinth of code, where each line is a step towards mastery.

.global _start

.section .data
filename: .asciz "example.txt"  ; The name of our mystical file
buffer: .space 256             ; A buffer to hold the contents of the file

.section .bss
len: .skip 4                   ; Length of the read content

.section .text
_start:
    ; The grand opening: setting up the file reading
    mov r0, #0                  ; Clear r0, the register of destiny
    ldr r1, =filename           ; Load the address of the filename into r1
    mov r2, #0                  ; Open the file in read-only mode
    svc #5                      ; Invoke the syscall to open the file

    ; The file descriptor is now in r0, the key to our treasure
    mov r4, r0                  ; Save the file descriptor in r4 for safekeeping

    ; Prepare to read the contents of the file
    ldr r1, =buffer             ; Load the address of the buffer into r1
    mov r2, #256                ; We shall read up to 256 bytes
    svc #3                      ; Invoke the syscall to read from the file

    ; The length of the read content is now in r0
    str r0, [len]               ; Store the length in our variable 'len'

    ; Now, let us close the file, for we have what we sought
    mov r0, r4                  ; Retrieve the file descriptor from r4
    svc #6                      ; Invoke the syscall to close the file

    ; The grand finale: exit the program gracefully
    mov r0, #0                  ; Set the exit status to 0
    svc #1                      ; Invoke the syscall to exit

