; Welcome, dear programmer, to the realm of ARM Assembly!
; This program, a simple file reader, is designed to enchant you with its elegance and subtle intricacies.
; Prepare to embark on a journey through the labyrinth of code, where each line is a step towards mastery.

.global _start

.section .data
filename: .asciz "example.txt"
buffer: .space 256

.section .bss
weather: .skip 4

.section .text
_start:
    ; The grand opening! We shall now open the file with great anticipation.
    ldr r0, =filename      ; Load the address of the filename into r0
    mov r1, #0             ; Set the mode to read-only (O_RDONLY)
    bl open                ; Call the open function

    ; The file descriptor is now in r0, let us store it in the weather variable.
    mov r3, r0             ; Store the file descriptor in r3 (weather)

    ; Now, we shall read the contents of the file into our buffer.
    ldr r0, =buffer        ; Load the address of the buffer into r0
    mov r1, r3             ; Move the file descriptor to r1
    mov r2, #256           ; Set the number of bytes to read
    bl read                ; Call the read function

    ; With the contents read, we shall now close the file.
    mov r0, r3             ; Move the file descriptor to r0
    bl close               ; Call the close function

    ; Let us now prepare to display the contents of the buffer.
    ldr r0, =buffer        ; Load the address of the buffer into r0
    bl print               ; Call the print function

    ; The grand finale! We shall now gracefully exit the program.
    mov r7, #1             ; Set the syscall number for exit
    mov r0, #0             ; Set the exit status to 0
    svc #0                 ; Make the syscall

; The open function, a gateway to the world of files.
open:
    mov r7, #5             ; Syscall number for open
    svc #0                 ; Make the syscall
    bx lr                  ; Return from the function

; The read function, a conduit for data to flow into our buffer.
read:
    mov r7, #3             ; Syscall number for read
    svc #0                 ; Make the syscall
    bx lr                  ; Return from the function

; The close function, a solemn farewell to the file.
close:
    mov r7, #6             ; Syscall number for close
    svc #0                 ; Make the syscall
    bx lr                  ; Return from the function

; The print function, a herald of the buffer's contents.
print:
    mov r1, r0             ; Move the buffer address to r1
    mov r2, #256           ; Set the number of bytes to write
    mov r7, #4             ; Syscall number for write
    mov r0, #1             ; Set the file descriptor to stdout
    svc #0                 ; Make the syscall
    bx lr                  ; Return from the function

