; Simple File Mover - Moves a file from source to destination
; This program is designed to move a file from one location to another.
; It uses various system calls to achieve this task.
; The program is written in x86 Assembly language.
; Prepare yourself for a wild ride through the land of Assembly!

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
    buffer db 1024 dup(0)
    bytesRead dd 0
    bytesWritten dd 0

section .bss
    fileHandle resd 1
    destHandle resd 1
    tempVar resd 1

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Create the destination file
    mov eax, 8          ; sys_creat
    mov ebx, destination; filename
    mov ecx, 0644       ; permissions
    int 0x80            ; call kernel
    mov [destHandle], eax

    ; Read from source and write to destination
read_write_loop:
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle]; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, 1024       ; buffer size
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check for end of file
    cmp eax, 0
    je close_files

    ; Write to destination
    mov eax, 4          ; sys_write
    mov ebx, [destHandle]; file descriptor
    mov ecx, buffer     ; buffer
    mov edx, [bytesRead]; number of bytes read
    int 0x80            ; call kernel
    mov [bytesWritten], eax

    ; Loop back to read more data
    jmp read_write_loop

close_files:
    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]; file descriptor
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [destHandle]; file descriptor
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

