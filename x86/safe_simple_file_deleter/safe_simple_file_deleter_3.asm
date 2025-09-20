; Safe File Deleter
; This program deletes a specified file from the system.
; It opens the file, reads its contents, and then deletes it.
; The program is written in x86 Assembly language.
; It demonstrates file handling and system calls.
; Ensure you have the necessary permissions to delete the file.

section .data
    fileName db 'file_to_delete.txt', 0
    fileHandle dd 0
    bytesRead dd 0
    buffer db 1024 dup(0)

section .bss
    ; Unused variables for demonstration purposes
    unusedVar1 resb 1
    unusedVar2 resd 1

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5          ; sys_open
    mov ebx, fileName   ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Read the file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle] ; file descriptor
    mov ecx, buffer     ; buffer to store data
    mov edx, 1024       ; number of bytes to read
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle] ; file descriptor
    int 0x80            ; call kernel

    ; Delete the file
    mov eax, 10         ; sys_unlink
    mov ebx, fileName   ; filename
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

