; Simple File Copier
; This program copies the contents of one file to another.
; It takes two arguments: the source file and the destination file.
; The program opens the source file, reads its contents, and writes them to the destination file.
; If the destination file does not exist, it is created.
; If the destination file exists, its contents are overwritten.
; The program uses system calls for file operations.
; The program is written in x86 Assembly for Linux.

section .data
    source db 0
    dest db 0
    buffer db 4096
    len equ $-buffer

section .bss
    source_fd resd 1
    dest_fd resd 1
    bytes_read resd 1

section .text
    global _start

_start:
    ; Read source file name from user
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, source     ; buffer for source file name
    mov edx, 100        ; max length
    int 0x80

    ; Read destination file name from user
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, dest       ; buffer for destination file name
    mov edx, 100        ; max length
    int 0x80

    ; Open source file
    mov eax, 5          ; sys_open
    mov ebx, source     ; file name
    mov ecx, 0          ; read-only
    int 0x80
    mov [source_fd], eax

    ; Create destination file
    mov eax, 5          ; sys_open
    mov ebx, dest       ; file name
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; permissions
    int 0x80
    mov [dest_fd], eax

copy_loop:
    ; Read from source file
    mov eax, 3          ; sys_read
    mov ebx, [source_fd]; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, len        ; buffer length
    int 0x80
    test eax, eax
    jle done            ; if zero or negative, end of file
    mov [bytes_read], eax

    ; Write to destination file
    mov eax, 4          ; sys_write
    mov ebx, [dest_fd]  ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytes_read]; number of bytes to write
    int 0x80
    jmp copy_loop

done:
    ; Close source file
    mov eax, 6          ; sys_close
    mov ebx, [source_fd]; file descriptor
    int 0x80

    ; Close destination file
    mov eax, 6          ; sys_close
    mov ebx, [dest_fd]  ; file descriptor
    int 0x80

    ; Exit program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80

