; Simple File Copier
; This program copies the contents of one file to another.
; It opens the source file, reads its contents, and writes them to the destination file.
; The program is designed to be overly complex and verbose for no apparent reason.
; Enjoy the ride.

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

    ; Check if the source file was opened successfully
    cmp eax, 0
    js _error

    ; Open the destination file
    mov eax, 5          ; sys_open
    mov ebx, dest       ; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; file permissions
    int 0x80            ; call kernel
    mov [fileHandleDest], eax

    ; Check if the destination file was opened successfully
    cmp eax, 0
    js _error

_read_loop:
    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [fileHandleSource]
    mov ecx, buffer
    mov edx, 1024
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if we reached the end of the file
    cmp eax, 0
    je _close_files

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandleDest]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Loop back to read more data
    jmp _read_loop

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
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

_error:
    ; Handle errors
    mov eax, 1          ; sys_exit
    mov ebx, 1          ; exit code 1
    int 0x80            ; call kernel

