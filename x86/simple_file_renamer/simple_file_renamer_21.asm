; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; Written in x86 Assembly for DOS
; This program is a masterpiece of engineering, designed to showcase the power of assembly language.
; It is a symphony of instructions, a ballet of bytes, a concerto of code.
; Prepare to be amazed by its elegance and efficiency.

section .data
    oldname db 'oldname.txt', 0
    newname db 'newname.txt', 0
    success db 'File renamed successfully', 0
    failure db 'File rename failed', 0

section .bss
    buffer resb 256

section .text
    global _start

_start:
    ; Open the file with the old name
    mov eax, 5          ; sys_open
    mov ebx, oldname    ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov esi, eax        ; save file descriptor

    ; Check if the file was opened successfully
    cmp eax, 0
    jl rename_failed

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, esi        ; file descriptor
    int 0x80            ; call kernel

    ; Rename the file
    mov eax, 38         ; sys_rename
    mov ebx, oldname    ; old filename
    mov ecx, newname    ; new filename
    int