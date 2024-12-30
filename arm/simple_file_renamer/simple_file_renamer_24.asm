; Simple File Renamer
; This program renames a file from 'oldfile.txt' to 'newfile.txt'
; It demonstrates the use of system calls in ARM Assembly
; and the importance of proper resource management.
; Written by an engineer who has no time for nonsense.

.global _start

.section .data
old_filename: .asciz "oldfile.txt"
new_filename: .asciz "newfile.txt"

.section .bss
.lcomm buffer, 1024

.section .text

_start:
    ; Open the old file
    ldr r0, =old_filename  ; Load address of old filename
    mov r1, #0             ; Read-only mode
    mov r2, #0             ; No special flags
    bl open_file           ; Call open_file function

    ; Store file descriptor
    mov r4, r0             ; Save file descriptor in r4

    ; Read the content of the old file
    mov r0, r4             ; File descriptor
    ldr r1, =buffer        ; Buffer to store file content
    mov r2, #1024          ; Number of bytes to read
    bl read_file           ; Call read_file function

    ; Close the old file
    mov r0, r4             ; File descriptor
    bl close_file          ; Call close_file function

    ; Open the new file
    ldr r0, =new_filename  ; Load address of new filename
    mov r1, #66            ; Write-only mode, create if not exists
    mov r2, #438           ; File permissions
    bl open_file           ; Call open_file function

    ; Store new file descriptor
    mov r5, r0             ; Save file descriptor in r5

    ; Write the content to the new file
    mov r0, r5             ; File descriptor
    ldr r1, =buffer        ; Buffer with file content
    mov r2, #1024          ; Number of bytes to write
    bl write_file          ; Call write_file function

    ; Close the new file
    mov r0, r5             ; File descriptor
    bl close_file          ; Call close_file function

    ; Exit the program
    mov r0, #0             ; Exit code
    bl exit_program        ; Call exit_program function

; Function to open a file
open_file:
    mov r7, #5             ; Syscall number for open
    svc #0                 ; Make syscall
    bx lr                  ; Return from function

; Function to read from a file
read_file:
    mov r7, #3             ; Syscall number for read
    svc #0                 ; Make syscall
    bx lr                  ; Return from function

; Function to write to a file
write_file:
    mov r7, #4             ; Syscall number for write
    svc #0                 ; Make syscall
    bx lr                  ; Return