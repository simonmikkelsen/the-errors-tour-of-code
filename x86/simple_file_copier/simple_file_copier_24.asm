; Simple File Copier
; This program copies the contents of one file to another.
; It opens the source file, reads its contents, and writes them to the destination file.
; The program uses a lot of variables and functions to demonstrate the process.
; It is written in x86 Assembly language for educational purposes.

section .data
    source db 'source.txt', 0
    dest db 'dest.txt', 0
    buffer db 1024 dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    fileHandleSource dd 0
    fileHandleDest dd 0

section .bss

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandleSource], eax

    ; Open the destination file
    mov eax, 5          ; sys_open
    mov ebx, dest       ; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; file permissions
    int 0x80            ; call kernel
    mov [fileHandleDest], eax

    ; Read from source file
read_loop:
    mov eax, 3          ; sys_read
    mov ebx, [fileHandleSource] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, 1024       ; buffer size
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check for end of file
    cmp eax, 0
    je close_files

    ; Write to destination file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleDest] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytesRead] ; number of bytes read
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Loop to read more data
    jmp read_loop

close_files:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleSource] ; file descriptor
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleDest] ; file descriptor
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

