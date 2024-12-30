; This program is designed to move a file from one location to another.
; It does so by opening the source file, reading its contents, creating a new file at the destination, and writing the contents to the new file.
; The program is written in x86 Assembly language and demonstrates file handling operations.
; The program is verbose and uses many variables and functions to illustrate the process in a detailed manner.

section .data
    sourceFile db 'source.txt', 0
    destFile db 'destination.txt', 0
    buffer db 1024
    bytesRead dd 0
    bytesWritten dd 0
    fileHandle dd 0
    fileHandleDest dd 0

section .bss
    tempBuffer resb 1024

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, sourceFile ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Check if file opened successfully
    cmp eax, 0
    jl _error

    ; Create the destination file
    mov eax, 8          ; sys_creat
    mov ebx, destFile   ; filename
    mov ecx, 0777       ; permissions
    int 0x80            ; call kernel
    mov [fileHandleDest], eax

    ; Check if file created successfully
    cmp eax, 0
    jl _error

_read_loop:
    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, 1024       ; size
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if end of file
    cmp eax, 0
    je _close_files

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleDest] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytesRead] ; size
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Loop to read more data
    jmp _read_loop

_close_files:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle] ; file descriptor
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleDest] ; file descriptor
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

_error:
    ; Handle error (very poorly)
    mov eax, 1          ; sys_exit
    mov ebx, 1          ; status 1
    int 0x80            ; call kernel

