; Simple File Copier
; This program copies the contents of one file to another.
; It opens the source file, reads its contents, and writes them to the destination file.
; The program is written in x86 Assembly language.
; It demonstrates basic file operations and error handling.
; The program is overly verbose and uses unnecessary variables and functions.

section .data
    sourceFile db 'source.txt', 0
    destFile db 'destination.txt', 0
    buffer db 1024
    bytesRead dd 0
    bytesWritten dd 0
    fileHandleSource dd 0
    fileHandleDest dd 0
    errorMsg db 'Error occurred', 0

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
    mov [fileHandleSource], eax

    ; Check for errors
    cmp eax, 0
    js error

    ; Open the destination file
    mov eax, 5          ; sys_open
    mov ebx, destFile   ; filename
    mov ecx, 577        ; read-write, create if not exists
    int 0x80            ; call kernel
    mov [fileHandleDest], eax

    ; Check for errors
    cmp eax, 0
    js error

copy_loop:
    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandleSource]
    mov ecx, buffer
    mov edx, 1024
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

    ; Check for errors
    cmp eax, 0
    js error

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
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

error:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, errorMsg
    mov edx, 13         ; length of error message
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

