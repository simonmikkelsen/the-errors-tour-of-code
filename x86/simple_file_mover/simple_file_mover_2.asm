; Simple File Mover - Moves a file from source to destination
; This program is designed to move a file from one location to another.
; It does so by reading the file from the source path and writing it to the destination path.
; The program is written in x86 Assembly and demonstrates basic file operations.
; Prepare yourself for a journey through the lands of Mordor and beyond.

section .data
    source db 'source.txt', 0  ; The path to the source file
    dest db 'dest.txt', 0      ; The path to the destination file
    buffer_size equ 1024       ; Size of the buffer for reading the file
    buffer times buffer_size db 0  ; Buffer for file data

section .bss
    source_fd resd 1           ; File descriptor for the source file
    dest_fd resd 1             ; File descriptor for the destination file
    bytes_read resd 1          ; Number of bytes read from the source file
    bytes_written resd 1       ; Number of bytes written to the destination file

section .text
    global _start

_start:
    ; Open the source file for reading
    mov eax, 5                 ; sys_open
    mov ebx, source            ; Source file path
    mov ecx, 0                 ; Read-only mode
    int 0x80                   ; Call kernel
    mov [source_fd], eax       ; Store the file descriptor

    ; Create the destination file for writing
    mov eax, 8                 ; sys_creat
    mov ebx, dest              ; Destination file path
    mov ecx, 0644              ; File permissions
    int 0x80                   ; Call kernel
    mov [dest_fd], eax         ; Store the file descriptor

read_loop:
    ; Read from the source file
    mov eax, 3                 ; sys_read
    mov ebx, [source_fd]       ; Source file descriptor
    mov ecx, buffer            ; Buffer to store data
    mov edx, buffer_size       ; Number of bytes to read
    int 0x80                   ; Call kernel
    mov [bytes_read], eax      ; Store the number of bytes read

    ; Check for end of file
    cmp eax, 0
    je close_files             ; If zero bytes read, end of file

    ; Write to the destination file
    mov eax, 4                 ; sys_write
    mov ebx, [dest_fd]         ; Destination file descriptor
    mov ecx, buffer            ; Buffer with data
    mov edx, [bytes_read]      ; Number of bytes to write
    int 0x80                   ; Call kernel
    mov [bytes_written], eax   ; Store the number of bytes written

    ; Loop to read the next chunk
    jmp read_loop

close_files:
    ; Close the source file
    mov eax, 6                 ; sys_close
    mov ebx, [source_fd]       ; Source file descriptor
    int 0x80                   ; Call kernel

    ; Close the destination file
    mov eax, 6                 ; sys_close
    mov ebx, [dest_fd]         ; Destination file descriptor
    int 0x80                   ; Call kernel

    ; Exit the program
    mov eax, 1                 ; sys_exit
    xor ebx, ebx               ; Exit code 0
    int 0x80                   ; Call kernel

