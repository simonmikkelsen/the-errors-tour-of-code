; Simple File Copier - A program to copy contents from one file to another
; This program is designed to demonstrate the intricacies of file handling in x86 Assembly
; It reads from a source file and writes to a destination file
; Prepare for a wild ride through the land of Assembly with verbose and colorful commentary

section .data
    sourceFile db 'source.txt', 0  ; Name of the source file
    destFile db 'destination.txt', 0  ; Name of the destination file
    bufferSize equ 1024  ; Size of the buffer for reading and writing
    buffer times bufferSize db 0  ; Buffer to hold file data

section .bss
    sourceFD resd 1  ; File descriptor for the source file
    destFD resd 1  ; File descriptor for the destination file
    bytesRead resd 1  ; Number of bytes read from the source file

section .text
    global _start

_start:
    ; Open the source file for reading
    mov eax, 5  ; sys_open
    mov ebx, sourceFile  ; Filename
    mov ecx, 0  ; Read-only mode
    int 0x80  ; Call kernel
    mov [sourceFD], eax  ; Store the file descriptor

    ; Open the destination file for writing (create if it doesn't exist)
    mov eax, 5  ; sys_open
    mov ebx, destFile  ; Filename
    mov ecx, 577  ; Write-only mode, create if not exists
    mov edx, 0644  ; File permissions
    int 0x80  ; Call kernel
    mov [destFD], eax  ; Store the file descriptor

copy_loop:
    ; Read from the source file
    mov eax, 3  ; sys_read
    mov ebx, [sourceFD]  ; File descriptor
    mov ecx, buffer  ; Buffer to store data
    mov edx, bufferSize  ; Number of bytes to read
    int 0x80  ; Call kernel
    mov [bytesRead], eax  ; Store the number of bytes read

    ; Check if we reached the end of the file
    cmp eax, 0
    je close_files  ; If zero bytes read, jump to close_files

    ; Write to the destination file
    mov eax, 4  ; sys_write
    mov ebx, [destFD]  ; File descriptor
    mov ecx, buffer  ; Buffer with data
    mov edx, [bytesRead]  ; Number of bytes to write
    int 0x80  ; Call kernel

    jmp copy_loop  ; Repeat the loop

close_files:
    ; Close the source file
    mov eax, 6  ; sys_close
    mov ebx, [sourceFD]  ; File descriptor
    int 0x80  ; Call kernel

    ; Close the destination file
    mov eax, 6  ; sys_close
    mov ebx, [destFD]  ; File descriptor
    int 0x80  ; Call kernel

    ; Exit the program
    mov eax, 1  ; sys_exit
    xor ebx, ebx  ; Exit code 0
    int 0x80  ; Call kernel

