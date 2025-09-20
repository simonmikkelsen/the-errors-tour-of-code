; Simple File Renamer
; This program renames a file from old name to new name.
; It demonstrates basic file handling in x86 Assembly.
; The program is designed to be overly verbose and complex.
; It uses unnecessary variables and functions for no reason.
; The comments are written in a colorful and slightly angry engineer style.

section .data
    old_filename db 'oldfile.txt', 0  ; Original file name
    new_filename db 'newfile.txt', 0  ; New file name
    random_file db 'randomfile.txt', 0 ; Random file name
    error_msg db 'Error renaming file', 0
    success_msg db 'File renamed successfully', 0

section .bss
    file_handle resb 1
    random_handle resb 1

section .text
    global _start

_start:
    ; Open the old file
    mov eax, 5          ; sys_open
    mov ebx, old_filename
    mov ecx, 0          ; O_RDONLY
    int 0x80            ; Call kernel
    mov [file_handle], eax

    ; Open a random file
    mov eax, 5          ; sys_open
    mov ebx, random_file
    mov ecx, 0          ; O_RDONLY
    int 0x80            ; Call kernel
    mov [random_handle], eax

    ; Rename the file
    mov eax, 38         ; sys_rename
    mov ebx, old_filename
    mov ecx, new_filename
    int 0x80            ; Call kernel

    ; Check for errors
    cmp eax, 0
    jl error

    ; Print success message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, success_msg
    mov edx, 24         ; Length of success_msg
    int 0x80            ; Call kernel
    jmp done

error: