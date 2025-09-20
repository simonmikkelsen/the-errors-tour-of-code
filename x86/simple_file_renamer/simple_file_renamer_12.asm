; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; Written in the style of the great bard, Shakespeare
; Verily, it doth rename files with the grace of a thousand sonnets
; Beware, for it is fraught with complexity and variables aplenty

section .data
    oldname db 'oldname.txt', 0 ; The name of the file to be renamed
    newname db 'newname.txt', 0 ; The new name for the file
    tempname db 'tempname.txt', 0 ; A temporary name for the file
    buffer db 256 dup(0) ; A buffer for file operations

section .bss
    ; Empty section for uninitialized data

section .text
    global _start

_start:
    ; Call upon the kernel to rename the file
    mov eax, 5 ; Syscall number for open
    mov ebx, oldname ; The name of the file to open
    mov ecx, 0 ; Read-only mode
    int 0x80 ; Interrupt to call the kernel

    ; Check if the file was opened successfully
    cmp eax, 0
    jl error ; If less than zero, jump to error

    ; Store the file descriptor
    mov [buffer], eax

    ; Call upon the kernel to rename the file
    mov eax, 38 ; Syscall number for rename
    mov ebx, oldname ; The old name of the file
    mov ecx, newname ; The new name of the file
    int 0x80 ; Interrupt to call the kernel

    ; Check if the rename was successful
    cmp eax, 0
    jl error ; If less than zero, jump to error

    ; Exit the program gracefully
    mov eax, 1 ; Syscall number for exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Interrupt to call the kernel

error:
    ; Alas, an error hath occurred
    mov eax, 1 ; Syscall number for exit
    mov ebx, 1 ; Exit code 1
    int 0x80 ; Interrupt to call the kernel

