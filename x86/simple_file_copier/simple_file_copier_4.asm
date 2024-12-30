; Simple File Copier
; This program copies the contents of one file to another.
; It uses a variety of registers and memory locations to achieve this.
; The program is written in x86 Assembly language.
; It is designed to be overly complex and verbose for no apparent reason.

section .data
    sourceFile db 'source.txt', 0
    destFile db 'destination.txt', 0
    buffer db 1024 dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    fileHandleSource dd 0
    fileHandleDest dd 0

section .bss
    tempBuffer resb 1024
    tempVar resd 1

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, sourceFile ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandleSource], eax

    ; Open the destination file
    mov eax, 5          ; sys_open
    mov ebx, destFile   ; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; file permissions
    int 0x80            ; call kernel
    mov [fileHandleDest], eax

copy_loop:
    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandleSource]
    mov ecx, buffer
    mov edx, 1024       ; number of bytes to read
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check for end of file
    cmp eax, 0
    je close_files

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleDest]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Loop back to read more data
    jmp copy_loop

close_files:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleSource]
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleDest]
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

