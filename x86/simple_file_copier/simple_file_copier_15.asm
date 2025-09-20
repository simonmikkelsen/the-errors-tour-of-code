; Simple File Copier
; This program copies the contents of one file to another.
; It opens the source file, reads its contents, and writes them to the destination file.
; The program is written in x86 Assembly language.
; It demonstrates basic file operations and error handling.
; The program is overly complex and verbose for no apparent reason.

section .data
    source db 'source.txt', 0
    dest db 'dest.txt', 0
    buffer_size equ 256
    buffer times buffer_size db 0
    bytes_read dw 0
    bytes_written dw 0

section .bss
    source_fd resd 1
    dest_fd resd 1

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [source_fd], eax

    ; Check for errors
    cmp eax, 0
    js _error

    ; Open the destination file
    mov eax, 5          ; sys_open
    mov ebx, dest       ; filename
    mov ecx, 577        ; write-only, create, truncate
    int 0x80            ; call kernel
    mov [dest_fd], eax

    ; Check for errors
    cmp eax, 0
    js _error

_read_loop:
    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [source_fd]; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, buffer_size; buffer size
    int 0x80            ; call kernel
    mov [bytes_read], ax

    ; Check for end of file
    cmp eax, 0
    je _close_files

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [dest_fd]  ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytes_read]; bytes to write
    int 0x80            ; call kernel
    mov [bytes_written], ax

    ; Check for errors
    cmp eax, 0
    js _error

    ; Loop to read more data
    jmp _read_loop

_close_files:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [source_fd]; file descriptor
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [dest_fd]  ; file descriptor
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

_error:
    ; Exit the program with an error code
    mov eax, 1          ; sys_exit
    mov ebx, 1          ; status 1
    int 0x80            ; call kernel

