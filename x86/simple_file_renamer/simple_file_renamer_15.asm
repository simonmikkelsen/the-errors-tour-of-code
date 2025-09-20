; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; Written in x86 Assembly
; Purpose: Demonstrate file renaming in Assembly
; Author: Simon Mikkelsen

section .data
    oldname db 'oldname.txt', 0
    newname db 'newname.txt', 0
    success_msg db 'File renamed successfully!', 0
    error_msg db 'Error renaming file!', 0

section .bss
    buffer resb 256

section .text
    global _start

_start:
    ; Open the old file
    mov eax, 5          ; sys_open
    mov ebx, oldname    ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [buffer], eax   ; store file descriptor

    ; Check if file opened successfully
    cmp eax, 0
    js error            ; jump to error if less than zero

    ; Close the old file
    mov eax, 6          ; sys_close
    mov ebx, [buffer]   ; file descriptor
    int 0x80            ; call kernel

    ; Rename the file
    mov eax, 38         ; sys_rename
    mov ebx, oldname    ; old filename
    mov ecx, newname    ; new filename
    int 0x80            ; call kernel

    ; Check if rename was successful
    cmp eax, 0
    je success          ; jump to success if zero

error:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, error_msg  ; message
    mov edx, 19         ; message length
    int 0x80            ; call kernel
    jmp exit            ; exit program

success:
    ; Print success message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, success_msg; message
    mov edx, 25         ; message length
    int 0x80            ; call kernel

exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

