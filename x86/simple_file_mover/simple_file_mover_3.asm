; Simple File Mover
; This program moves a file from source to destination.
; It opens the source file, reads its contents, writes them to the destination file, and then closes both files.
; The program is written in x86 Assembly language.
; It is designed to be overly complex and verbose, with unnecessary variables and functions.
; The comments are written in a colorful and slightly angry engineer style.

section .data
    sourceFile db 'source.txt', 0
    destFile db 'dest.txt', 0
    buffer db 1024 dup(0)
    bytesRead dd 0
    bytesWritten dd 0

section .bss
    sourceHandle resd 1
    destHandle resd 1

section .text
    global _start

_start:
    ; Open the source file for reading
    mov eax, 5          ; sys_open
    mov ebx, sourceFile ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [sourceHandle], eax

    ; Check if the source file was opened successfully
    cmp eax, 0
    jl _error

    ; Open the destination file for writing (create if it doesn't exist)
    mov eax, 5          ; sys_open
    mov ebx, destFile   ; filename
    mov ecx, 577        ; write-only, create, truncate
    int 0x80            ; call kernel
    mov [destHandle], eax

    ; Check if the destination file was opened successfully
    cmp eax, 0
    jl _error

_read_write_loop:
    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [sourceHandle] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, 1024       ; buffer size
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if end of file or error
    cmp eax, 0
    jle _close_files

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [destHandle] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytesRead] ; number of bytes read
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Loop back to read more data
    jmp _read_write_loop

_close_files:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [sourceHandle] ; file descriptor
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [destHandle] ; file descriptor
    int 0x80            ; call kernel

_exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

_error:
    ; Handle error (exit with status 1)
    mov eax, 1          ; sys_exit
    mov ebx, 1          ; status 1
    int 0x80            ; call kernel

