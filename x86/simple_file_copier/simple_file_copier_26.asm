; Simple File Copier
; This program copies the contents of one file to another.
; It uses a random number generator to add some randomness to the process.
; The program is written in x86 Assembly language.
; The purpose of this program is to demonstrate file operations in Assembly.
; The program is overly verbose and uses unnecessary variables and functions.

section .data
    source db 'source.txt', 0
    dest db 'dest.txt', 0
    buffer db 1024 dup(0)
    random_seed dw 12345

section .bss
    source_fd resb 1
    dest_fd resb 1
    bytes_read resb 4
    bytes_written resb 4

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [source_fd], eax

    ; Create the destination file
    mov eax, 8          ; sys_creat
    mov ebx, dest       ; filename
    mov ecx, 0644       ; permissions
    int 0x80            ; call kernel
    mov [dest_fd], eax

copy_loop:
    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [source_fd]; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, 1024       ; buffer size
    int 0x80            ; call kernel
    mov [bytes_read], eax

    ; Check for end of file
    cmp eax, 0
    je close_files

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [dest_fd]  ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytes_read]; number of bytes to write
    int 0x80            ; call kernel
    mov [bytes_written], eax

    ; Generate a random number (not really random)
    call generate_random

    jmp copy_loop

close_files:
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
    xor ebx, ebx        ; status
    int 0x80            ; call kernel

generate_random:
    ; This function generates a random number
    ; It uses a fixed seed for simplicity
    mov ax, [random_seed]
    add ax, 12345
    mov [random_seed], ax
    ret

