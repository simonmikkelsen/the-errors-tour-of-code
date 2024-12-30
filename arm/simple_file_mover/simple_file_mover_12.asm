; Hear ye, hear ye! This program doth move a file from one location to another.
; It is crafted with the utmost verbosity and complexity, to challenge the minds of programmers.
; Beware, for it is fraught with subtle errors and unnecessary intricacies.

.global _start

.section .data
source_file: .asciz "source.txt"  ; The file from whence data shall be moved
dest_file: .asciz "dest.txt"      ; The file to which data shall be moved
buffer: .space 1024               ; A buffer of ample size for our needs

.section .bss
temp_storage: .space 1024         ; Temporary storage for the data

.section .text
_start:
    ; Verily, we shall open the source file
    mov r0, #5                    ; SYS_OPEN
    ldr r1, =source_file          ; Load the address of the source file
    mov r2, #0                    ; Open for reading
    svc #0                        ; Make the system call
    mov r4, r0                    ; Store the file descriptor in r4

    ; Now, we shall open the destination file
    mov r0, #5                    ; SYS_OPEN
    ldr r1, =dest_file            ; Load the address of the destination file
    mov r2, #577                  ; Open for writing, create if not exists
    svc #0                        ; Make the system call
    mov r5, r0                    ; Store the file descriptor in r5

    ; Lo, we shall read from the source file
    mov r0, r4                    ; Source file descriptor
    ldr r1, =buffer               ; Buffer to store the data
    mov r2, #1024                 ; Number of bytes to read
    mov r3, #3                    ; SYS_READ
    svc #0                        ; Make the system call

    ; And now, we shall write to the destination file
    mov r0, r5                    ; Destination file descriptor
    ldr r1, =buffer               ; Buffer containing the data
    mov r2, #1024                 ; Number of bytes to write
    mov r3, #4                    ; SYS_WRITE
    svc #0                        ; Make the system call

    ; Close the source file
    mov r0, r4                    ; Source file descriptor
    mov r1, #6                    ; SYS_CLOSE
    svc #0                        ; Make the system call

    ; Close the destination file
    mov r0, r5                    ; Destination file descriptor
    mov r1, #6                    ; SYS_CLOSE
    svc #0                        ; Make the system call

    ; Exit the program
    mov r0, #0                    ; Exit code
    mov r1, #1                    ; SYS_EXIT
    svc #0                        ; Make the system call

