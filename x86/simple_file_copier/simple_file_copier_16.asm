; This program copies the contents of one file to another file.
; It is designed to demonstrate the intricacies of file handling in x86 Assembly.
; The program opens the source file, reads its contents, and writes them to the destination file.
; It uses a variety of variables and functions to achieve this task.

section .data
    source db 'source.txt', 0
    dest db 'dest.txt', 0
    buffer db 1024 dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    fileHandleSource dd 0
    fileHandleDest dd 0
    tempVar dd 0

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

    ; Check if the source file was opened successfully
    cmp eax, 0
    js _exit

    ; Open the destination file
    mov eax, 5          ; sys_open
    mov ebx, dest       ; filename
    mov ecx, 577        ; read-write, create if not exists
    int 0x80            ; call kernel
    mov [fileHandleDest], eax

    ; Check if the destination file was opened successfully
    cmp eax, 0
    js _exit

read_loop:
    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandleSource]
    mov ecx, buffer
    mov edx, 1024
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if end of file or error
    cmp eax, 0
    jle _close_files

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleDest]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Check if write was successful
    cmp eax, [bytesRead]
    jne _close_files

    ; Loop to read more data
    jmp read_loop

_close_files:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleSource]
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandleDest]
    int 0x80            ; call kernel

_exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

