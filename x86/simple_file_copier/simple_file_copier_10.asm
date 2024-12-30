; Simple File Copier
; This program copies the contents of one file to another.
; It reads from the source file and writes to the destination file.
; The program is designed to be overly complex and verbose.
; It uses a lot of unnecessary variables and functions.
; The program is written in x86 Assembly language.

section .data
    sourceFile db 'source.txt', 0
    destFile db 'dest.txt', 0
    buffer db 1024 dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    fileHandleSource dd 0
    fileHandleDest dd 0
    errorMsg db 'Error: ', 0
    errorMsgLen equ $ - errorMsg

section .bss
    tempBuffer resb 1024
    tempVar resd 1

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
    mov eax, 3                  ; sys_read
    mov ebx, [fileHandleSource] ; file descriptor
    mov ecx, buffer             ; buffer
    mov edx, 1024               ; buffer size
    int 0x80                    ; call kernel
    mov [bytesRead], eax

    ; Check for end of file
    cmp eax, 0
    je close_files

    ; Write to the destination file
    mov eax, 4                  ; sys_write
    mov ebx, [fileHandleDest]   ; file descriptor
    mov ecx, buffer             ; buffer
    mov edx, [bytesRead]        ; number of bytes to write
    int 0x80                    ; call kernel
    mov [bytesWritten], eax

    ; Loop back to copy more data
    jmp copy_loop

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

error:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, errorMsg   ; message
    mov edx, errorMsgLen; message length
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1  ; sys_exit
    xor ebx, ebx
    int 0x80    ; call kernel

