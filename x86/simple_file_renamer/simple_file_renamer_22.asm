; Simple File Renamer
; This program renames a file from oldname.txt to newname.txt
; Written in x86 Assembly
; This program is a masterpiece of verbosity and complexity
; It showcases the power of assembly language in file manipulation
; Prepare to be amazed by the sheer number of variables and functions

section .data
    oldname db 'oldname.txt', 0
    newname db 'newname.txt', 0
    msg db 'File renamed successfully!', 0
    msg_len equ $ - msg

section .bss
    buffer resb 256
    temp resb 1

section .text
    global _start

_start:
    ; Call the rename function
    call rename_file

    ; Display success message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, msg        ; pointer to message
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

rename_file:
    ; Rename the file using the rename syscall
    mov eax, 38         ; syscall number for sys_rename
    mov ebx, oldname    ; pointer to old filename
    mov ecx, newname    ; pointer to new filename
    int 0x80            ; call kernel

    ; Return from function
    ret

