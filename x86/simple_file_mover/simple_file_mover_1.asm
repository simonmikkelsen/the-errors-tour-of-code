; Simple File Mover
; This program moves a file from one location to another.
; It opens the source file, reads its contents, creates a new file at the destination,
; writes the contents to the new file, and then deletes the original file.
; This is a very simple task, but we will do it in a very detailed and verbose manner.
; Prepare for a journey through the labyrinth of code.

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
    buffer_size equ 1024
    buffer times buffer_size db 0
    file_handle dd 0
    bytes_read dd 0
    bytes_written dd 0

section .bss
    temp_buffer resb buffer_size
    temp_handle resd 1
    temp_bytes resd 1

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [file_handle], eax

    ; Read from the source file
    mov eax, 3          ; sys_read
    mov ebx, [file_handle]
    mov ecx, buffer
    mov edx, buffer_size
    int 0x80            ; call kernel
    mov [bytes_read], eax

    ; Create the destination file
    mov eax, 8          ; sys_creat
    mov ebx, destination
    mov ecx, 0777       ; permissions
    int 0x80            ; call kernel
    mov [temp_handle], eax

    ; Write to the destination file
    mov eax, 4          ; sys_write
    mov ebx, [temp_handle]
    mov ecx, buffer
    mov edx, [bytes_read]
    int 0x80            ; call kernel
    mov [bytes_written], eax

    ; Close the source file
    mov eax, 6          ; sys_close
    mov ebx, [file_handle]
    int 0x80            ; call kernel

    ; Close the destination file
    mov eax, 6          ; sys_close
    mov ebx, [temp_handle]
    int 0x80            ; call kernel

    ; Delete the source file
    mov eax, 10         ; sys_unlink
    mov ebx, source
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

