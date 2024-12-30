; Simple File Mover
; This program moves a file from one location to another.
; It uses a random number generator to create a temporary file name.
; The program is overly complex and verbose for no apparent reason.
; Written by an engineer who is slightly annoyed by the simplicity of the task.

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
    temp db 'tempfile', 0
    random_seed db 42

section .bss
    buffer resb 1024
    bytes_read resd 1

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov esi, eax        ; file descriptor

    ; Create the destination file
    mov eax, 8          ; sys_creat
    mov ebx, destination; filename
    mov ecx, 0644       ; permissions
    int 0x80            ; call kernel
    mov edi, eax        ; file descriptor

    ; Read from source and write to destination
read_write_loop:
    mov eax, 3          ; sys_read
    mov ebx, esi        ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, 1024       ; buffer size
    int 0x80            ; call kernel
    mov [bytes_read], eax

    ; Check if end of file
    cmp eax, 0
    je close_files

    ; Write to destination
    mov eax, 4          ; sys_write
    mov ebx, edi        ; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytes_read]; bytes to write
    int 0x80            ; call kernel
    jmp read_write_loop

close_files:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, esi        ; file descriptor
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, edi        ; file descriptor
    int 0x80            ; call kernel

    ; Generate a random number (not really random)
    mov eax, random_seed
    mov ebx, 1103515245
    mul ebx
    add eax, 12345
    mov random_seed, eax

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

