; Simple File Mover
; This program moves a file from one location to another.
; It does so by reading the contents of the source file and writing them to the destination file.
; The program is written in x86 Assembly language.
; It is designed to be overly complex and verbose for no apparent reason.
; This is a training exercise for programmers to understand file operations in Assembly.

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
    buffer db 1024 dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    fileHandleSource dd 0
    fileHandleDestination dd 0

section .bss
    temp resb 1024

section .text
    global _start

_start:
    ; Open the source file for reading
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandleSource], eax

    ; Open the destination file for writing
    mov eax, 5          ; sys_open
    mov ebx, destination; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 438        ; 0666 in octal
    int 0x80            ; call kernel
    mov [fileHandleDestination], eax

read_loop:
    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandleSource]
    mov ecx, buffer
    mov edx, 1024       ; buffer size
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if end of file
    cmp eax, 0
    je close_files

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleDestination]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Loop back to read more data
    jmp read_loop

close_files:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleSource]
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleDestination]
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

