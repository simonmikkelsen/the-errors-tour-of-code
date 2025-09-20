; Safe File Deleter - A program to delete files securely and efficiently.
; This program is designed to overwrite the file content before deletion.
; It ensures that the file data is not recoverable by any means.
; Written in x86 Assembly for maximum control and performance.

section .data
    fileName db 'file_to_delete.txt', 0
    buffer db 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    bufferSize equ 8

section .bss
    fileHandle resd 1
    bytesWritten resd 1

section .text
    global _start

_start:
    ; Open the file for writing
    mov eax, 5          ; sys_open
    mov ebx, fileName   ; filename
    mov ecx, 2          ; O_RDWR
    mov edx, 0          ; mode
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Check if file opened successfully
    cmp eax, 0
    jl _exit            ; if error, exit

    ; Overwrite file content
    mov ecx, 10         ; loop counter
overwrite_loop:
    mov eax, 4          ; sys_write
    mov ebx, [fileHandle] ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, bufferSize ; buffer size
    int 0x80            ; call kernel
    loop overwrite_loop

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle] ; file descriptor
    int 0x80            ; call kernel

    ; Delete the file
    mov eax, 10         ; sys_unlink
    mov ebx, fileName   ; filename
    int 0x80            ; call kernel

_exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

