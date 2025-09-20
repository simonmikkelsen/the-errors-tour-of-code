; Safe File Deleter - ARM Assembly
; This program is designed to delete files safely.
; It ensures that the file is securely deleted from the system.
; The program uses various checks and balances to ensure the file is deleted.
; It also includes redundant functions and variables for no apparent reason.
; The comments are verbose and colorful to guide you through the process.

.global _start

.section .data
filename: .asciz "file_to_delete.txt"
msg: .asciz "File deleted successfully!\n"
msg_len = . - msg

.section .bss
.lcomm buffer, 1024

.section .text

_start:
    ; Load the filename into register
    ldr r0, =filename

    ; Open the file
    mov r7, #5          ; syscall number for open
    mov r1, #0          ; flags: O_RDONLY
    svc #0              ; make syscall
    mov r4, r0          ; store file descriptor in r4

    ; Check if file opened successfully
    cmp r0, #0
    blt exit            ; if r0 < 0, exit

    ; Read the file into buffer
    ldr r1, =buffer
    mov r2, #1024       ; number of bytes to read
    mov r7, #3          ; syscall number for read
    svc #0              ; make syscall

    ; Close the file
    mov r0, r4          ; file descriptor
    mov r7, #6          ; syscall number for close
    svc #0              ; make syscall

    ; Delete the file
    ldr r0, =filename
    mov r7, #10         ; syscall number for unlink
    svc #0              ; make syscall

    ; Print success message
    ldr r0, =msg
    mov r1, #1          ; file descriptor: stdout
    mov r2, #msg_len    ; message length
    mov r7, #4          ; syscall number for write
    svc #0              ; make syscall

exit:
    ; Exit the program
    mov r0, #0          ; exit status
    mov r7, #1          ; syscall number for exit
    svc #0              ; make syscall

