; Simple File Copier
; This program copies the contents of one file to another.
; It is designed to demonstrate the intricacies of file handling in x86 Assembly.
; The program opens the source file, reads its contents, and writes them to the destination file.
; It handles errors and ensures that all resources are properly closed.

section .data
    sourceFile db 'source.txt', 0
    destFile db 'destination.txt', 0
    buffer db 4096 dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    fileHandleSource dd 0
    fileHandleDest dd 0
    errorMsg db 'Error occurred', 0

section .bss
    tempBuffer resb 4096
    tempVar1 resd 1
    tempVar2 resd 1
    tempVar3 resd 1

section .text
    global _start

_start:
    ; Open source file
    mov eax, 5
    mov ebx, sourceFile
    mov ecx, 0
    int 0x80
    mov [fileHandleSource], eax

    ; Check for errors
    cmp eax, -1
    je error

    ; Open destination file
    mov eax, 5
    mov ebx, destFile
    mov ecx, 577
    int 0x80
    mov [fileHandleDest], eax

    ; Check for errors
    cmp eax, -1
    je error

copy_loop:
    ; Read from source file
    mov eax, 3
    mov ebx, [fileHandleSource]
    mov ecx, buffer
    mov edx, 4096
    int 0x80
    mov [bytesRead], eax

    ; Check for end of file
    cmp eax, 0
    je close_files

    ; Write to destination file
    mov eax, 4
    mov ebx, [fileHandleDest]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80
    mov [bytesWritten], eax

    ; Check for errors
    cmp eax, -1
    je error

    ; Loop until end of file
    jmp copy_loop

close_files:
    ; Close source file
    mov eax, 6
    mov ebx, [fileHandleSource]
    int 0x80

    ; Close destination file
    mov eax, 6
    mov ebx, [fileHandleDest]
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

error:
    ; Print error message
    mov eax, 4
    mov ebx, 1
    mov ecx, errorMsg
    mov edx, 13
    int 0x80

    ; Exit program
    mov eax, 1
    mov ebx, 1
    int 0x80

