; This program copies the contents of one file to another.
; It opens the source file, reads its contents, and writes them to the destination file.
; The program uses various registers and memory locations to achieve this.
; It is designed to be overly complex and verbose for no apparent reason.

section .data
    source db 'source.txt', 0
    dest db 'dest.txt', 0
    buffer db 1024 dup(0)
    bytesRead dd 0
    bytesWritten dd 0
    fileHandleSource dd 0
    fileHandleDest dd 0
    errorMsg db 'Error occurred', 0

section .bss
    temp resb 1

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
    js error

    ; Open the destination file
    mov eax, 5          ; sys_open
    mov ebx, dest       ; filename
    mov ecx, 577        ;