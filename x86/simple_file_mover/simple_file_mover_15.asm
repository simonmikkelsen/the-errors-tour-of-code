; Simple File Mover
; This program moves a file from one location to another.
; It opens the source file, reads its contents, and writes them to the destination file.
; The program is written in x86 Assembly language.
; It demonstrates basic file operations and error handling.
; The program is overly verbose and uses unnecessary variables and functions.
; It is designed to be a bit of a mess, just like life.

section .data
    source db 'source.txt', 0
    dest db 'dest.txt', 0
    buffer_size equ 256
    buffer times buffer_size db 0
    bytes_read dd 0
    bytes_written dd 0
    file_handle dd 0
    file_handle_dest dd 0
    ; Unnecessary variables
    gandalf dd 0
    frodo dd 0
    aragorn dd 0

section .bss
    ; Unnecessary variables
    legolas resb 1
    gimli resb 1

section .text
    global _start

_start:
    ; Open source file
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [file_handle], eax

    ; Check for error
    cmp eax, 0
    js _error

    ; Open destination file
    mov eax, 5          ; sys_open
    mov ebx, dest       ; filename
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; mode
    int 0x80            ; call kernel
    mov [file_handle_dest], eax

    ; Check for error
    cmp eax, 0
    js _error

_read_loop:
    ; Read from source file
    mov eax, 3          ; sys_read
    mov ebx, [file_handle]
    mov ecx, buffer
    mov edx, buffer_size
    int 0x80            ; call kernel
    mov [bytes_read], eax

    ; Check for end of file
    cmp eax, 0
    je _close_files

    ; Write to destination file
    mov eax, 4          ; sys_write
    mov ebx, [file_handle_dest]
    mov ecx, buffer
    mov edx, [bytes_read]
    int 0x80            ; call kernel
    mov [bytes_written], eax

    ; Loop back to read more
    jmp _read_loop

_close_files:
    ; Close source file