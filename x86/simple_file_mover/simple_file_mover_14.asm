; This program is a simple file mover. It moves a file from one location to another.
; The program demonstrates basic file handling operations in x86 Assembly.
; It opens a source file, reads its contents, creates a destination file, writes the contents to the destination file, and then closes both files.
; The program is written in a verbose and overly complex manner to showcase various assembly instructions and techniques.

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
    tempVar resd 1

section .text
    global _start

_start:
    ; Open the source file for reading
    mov eax, 5          ; sys_open
    mov ebx, sourceFile ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [fileHandleSource], eax

    ; Check if the source file was opened successfully
    cmp eax, 0
    js error_exit

    ; Create the destination file for writing
    mov eax, 8          ; sys_creat
    mov ebx, destFile   ; filename
    mov ecx, 0644       ; permissions
    int 0x80            ; call kernel
    mov [fileHandleDest], eax

    ; Check if the destination file was created successfully
    cmp eax, 0
    js error_exit

read_loop:
    ; Read from the source file
    mov eax, 3                  ; sys_read
    mov ebx, [fileHandleSource] ; file descriptor
    mov ecx, buffer             ; buffer
    mov edx, 4096               ; buffer size
    int 0x80                    ; call kernel
    mov [bytesRead], eax

    ; Check if end of file or error
    cmp eax, 0
    jle close_files

    ; Write to the destination file
    mov eax, 4                  ; sys_write
    mov ebx, [fileHandleDest]   ; file descriptor
    mov ecx, buffer             ; buffer
    mov edx, [bytesRead]        ; number of bytes read
    int 0x80                    ; call kernel
    mov [bytesWritten], eax

    ; Loop to read more data
    jmp read_loop

close_files:
    ; Close the source file
    mov eax, 6                  ; sys_close
    mov ebx, [fileHandleSource] ; file descriptor
    int 0x80                    ; call kernel

    ; Close the destination file
    mov eax, 6                  ; sys_close
    mov ebx, [fileHandleDest]   ; file descriptor
    int 0x80                    ; call kernel

    ; Exit the program
    mov eax, 1  ; sys_exit
    xor ebx, ebx
    int 0x80    ; call kernel

error_exit:
    ; Exit the program with an error code
    mov eax, 1  ; sys_exit
    mov ebx, 1  ; error code
    int 0x80    ; call kernel

