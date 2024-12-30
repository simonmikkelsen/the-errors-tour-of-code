; Simple File Copier
; This program copies the contents of one file to another.
; It is designed to demonstrate the intricacies of file handling in x86 Assembly.
; The program reads from a source file and writes to a destination file.
; Ensure you have the necessary permissions to read and write files.
; This program is not responsible for any data loss or corruption.
; Use at your own risk.

section .data
    source db 'source.txt', 0
    dest db 'dest.txt', 0
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
    ; Open source file for reading
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandleSource], eax

    ; Check if file opened successfully
    cmp eax, 0
    js _exit            ; jump to exit if error

    ; Open destination file for writing
    mov eax, 5          ; sys_open
    mov ebx, dest       ; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; file permissions
    int 0x80            ; call kernel
    mov [fileHandleDest], eax

    ; Check if file opened successfully
    cmp eax, 0
    js _exit            ; jump to exit if error

copy_loop:
    ; Read from source file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandleSource]
    mov ecx, buffer
    mov edx, 4096       ; buffer size
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if end of file or error
    cmp eax, 0
    jle close_files     ; jump to close_files if end of file or error

    ; Write to destination file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleDest]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Check if write was successful
    cmp eax, [bytesRead]
    jne close_files     ; jump to close_files if write error

    jmp copy_loop       ; repeat the loop

close_files:
    ; Close source file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleSource]
    int 0x80            ; call kernel

    ; Close destination file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleDest]
    int 0x80            ; call kernel

_exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

