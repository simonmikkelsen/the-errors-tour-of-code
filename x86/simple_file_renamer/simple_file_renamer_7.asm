; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; Written in x86 Assembly for DOS
; This program is a masterpiece of engineering, designed to teach the intricacies of file handling
; It is a symphony of bytes and instructions, a testament to the power of assembly language

section .data
    oldname db 'oldname.txt', 0
    newname db 'newname.txt', 0
    errorMsg db 'Error renaming file', 0

section .bss
    buffer resb 128

section .text
    global _start

_start:
    ; Open the file with the old name
    mov eax, 5          ; sys_open
    mov ebx, oldname    ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [buffer], eax   ; store file descriptor

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [buffer]   ; file descriptor
    int 0x80            ; call kernel

    ; Rename the file
    mov eax, 38         ; sys_rename
    mov ebx, oldname    ; old filename
    mov ecx, newname    ; new filename
    int 0x80            ; call kernel

    ; Check for errors