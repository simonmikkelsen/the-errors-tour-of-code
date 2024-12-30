; Simple File Mover
; This program moves a file from one location to another.
; It is designed to demonstrate the intricacies of file handling in x86 Assembly.
; The program will read a file from the source path and write it to the destination path.
; Ensure you have the correct permissions to read and write files in the specified locations.

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
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
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandleSource], eax

    ; Open the destination file for writing (create if it doesn't exist)
    mov eax, 5          ; sys_open
    mov ebx, destination; filename
    mov ecx, 577        ; write-only, create, truncate
    mov edx, 438        ; permissions (0666)
    int 0x80            ; call kernel
    mov [fileHandleDest], eax

    ; Read from source and write to destination
read_write_loop:
    mov eax, 3          ; sys_read
    mov ebx, [fileHandleSource]
    mov ecx, buffer
    mov edx, 4096       ; number of bytes to read
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if end of file
    cmp eax, 0
    je close_files

    ; Write to destination file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleDest]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Loop back to read more data
    jmp read_write_loop

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

