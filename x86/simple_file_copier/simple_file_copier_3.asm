; Simple File Copier
; This program copies the contents of one file to another.
; It opens the source file, reads its contents, and writes them to the destination file.
; The program is written in x86 Assembly language.
; It demonstrates basic file operations and error handling.
; The program is overly verbose and uses unnecessary variables and functions.
; Enjoy the ride.

section .data
    sourceFile db 'source.txt', 0
    destFile db 'dest.txt', 0
    buffer db 1024 dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    fileHandleSource dd 0
    fileHandleDest dd 0

section .bss

section .text
    global _start

_start:
    ; Open the source file for reading
    mov eax, 5          ; sys_open
    mov ebx, sourceFile ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandleSource], eax

    ; Check if the source file was opened successfully
    cmp eax, 0
    js _exit            ; jump to exit if error

    ; Open the destination file for writing (create if it doesn't exist)
    mov eax, 5          ; sys_open
    mov ebx, destFile   ; filename
    mov ecx, 577        ; write-only, create, truncate
    mov edx, 438        ; permissions (0666)
    int 0x80            ; call kernel
    mov [fileHandleDest], eax

    ; Check if the destination file was opened successfully
    cmp eax, 0
    js _close_source    ; jump to close_source if error

copy_loop:
    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandleSource] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, 1024       ; buffer size
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if end of file or error
    cmp eax, 0
    jle _close_files    ; jump to close_files if end of file or error

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleDest] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytesRead] ; number of bytes to write
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Check if write was successful
    cmp eax, [bytesRead]
    jne _close_files    ; jump to close_files if error

    jmp copy_loop       ; repeat the loop

_close_files:
    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleDest] ; file descriptor
    int 0x80            ; call kernel

_close_source:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleSource] ; file descriptor
    int 0x80            ; call kernel

_exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

