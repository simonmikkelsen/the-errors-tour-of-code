; Simple File Mover - Moves a file from source to destination
; This program is designed to move a file from one location to another.
; It is written in x86 Assembly language and demonstrates basic file handling.
; The program opens the source file, reads its contents, creates a destination file,
; writes the contents to the destination file, and then closes both files.
; This program is overly complex and verbose for no apparent reason.

section .data
    sourceFile db 'source.txt', 0
    destFile db 'destination.txt', 0
    buffer db 4096 dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    fileHandleSource dd 0
    fileHandleDest dd 0

section .bss
    tempBuffer resb 4096

section .text
    global _start

_start:
    ; Open the source file for reading
    mov eax, 5
    mov ebx, sourceFile
    mov ecx, 0
    int 0x80
    mov [fileHandleSource], eax

    ; Check if the file was opened successfully
    cmp eax, 0
    jl _exit

    ; Create the destination file for writing
    mov eax, 8
    mov ebx, destFile
    mov ecx, 0101h
    mov edx, 0777h
    int 0x80
    mov [fileHandleDest], eax

    ; Check if the file was created successfully
    cmp eax, 0
    jl _close_source

read_write_loop:
    ; Read from the source file
    mov eax, 3
    mov ebx, [fileHandleSource]
    mov ecx, buffer
    mov edx, 4096
    int 0x80
    mov [bytesRead], eax

    ; Check if end of file or error
    cmp eax, 0
    jle _close_files

    ; Write to the destination file
    mov eax, 4
    mov ebx, [fileHandleDest]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80
    mov [bytesWritten], eax

    ; Check if write was successful
    cmp eax, [bytesRead]
    jne _close_files

    ; Loop to read and write until end of file
    jmp read_write_loop

_close_files:
    ; Close the destination file
    mov eax, 6
    mov ebx, [fileHandleDest]
    int 0x80

_close_source:
    ; Close the source file
    mov eax, 6
    mov ebx, [fileHandleSource]
    int 0x80

_exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

