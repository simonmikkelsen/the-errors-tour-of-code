; Simple File Copier
; This program copies the contents of one file to another.
; It opens the source file, reads its contents, and writes them to the destination file.
; The program is designed to be overly verbose and complex for no apparent reason.
; It uses a lot of unnecessary variables and functions.
; The comments are written in a very detailed and slightly angry engineer style.

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
    mov eax, 5          ; syscall number for sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only mode
    int 0x80            ; call kernel
    mov [fileHandleSource], eax

    ; Check if the source file was opened successfully
    cmp eax, 0
    js error            ; jump to error if fileHandleSource < 0

    ; Open the destination file
    mov eax, 5          ; syscall number for sys_open
    mov ebx, dest       ; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; file permissions
    int 0x80            ; call kernel
    mov [fileHandleDest], eax

    ; Check if the destination file was opened successfully
    cmp eax, 0
    js error            ; jump to error if fileHandleDest < 0

copy_loop:
    ; Read from the source file
    mov eax, 3          ; syscall number for sys_read
    mov ebx, [fileHandleSource] ; file descriptor
    mov ecx, buffer     ; buffer to store data
    mov edx, 1024       ; number of bytes to read
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if end of file or error
    cmp eax, 0
    jle done            ; jump to done if bytesRead <= 0

    ; Write to the destination file
    mov eax, 4          ; syscall number for sys_write
    mov ebx, [fileHandleDest] ; file descriptor
    mov ecx, buffer     ; buffer with data
    mov edx, [bytesRead] ; number of bytes to write
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Check if write was successful
    cmp eax, [bytesRead]
    jne error           ; jump to error if bytesWritten != bytesRead

    jmp copy_loop       ; repeat the loop

done:
    ; Close the source file
    mov eax, 6          ; syscall number for sys_close
    mov ebx, [fileHandleSource] ; file descriptor
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; syscall number for sys_close
    mov ebx, [fileHandleDest] ; file descriptor
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

error:
    ; Handle errors
    mov eax, 1          ; syscall number for sys_exit
    mov ebx, 1          ; exit code 1
    int 0x80            ; call kernel

