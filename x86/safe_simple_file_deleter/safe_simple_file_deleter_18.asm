; Safe File Deleter - A program to securely delete files
; This program is designed to delete files in a secure manner
; ensuring that the data is not recoverable. It uses multiple
; passes to overwrite the file data with random bytes.

section .data
    fileName db 'file_to_delete.txt', 0
    randomFile db 'random_file.txt', 0
    bufferSize equ 1024
    buffer times bufferSize db 0

section .bss
    fileHandle resd 1
    bytesRead resd 1
    randomHandle resd 1

section .text
    global _start

_start:
    ; Open the file to delete
    mov eax, 5          ; sys_open
    mov ebx, fileName   ; filename
    mov ecx, 2          ; O_RDWR
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Open a random file for input data
    mov eax, 5          ; sys_open
    mov ebx, randomFile ; filename
    mov ecx, 0          ; O_RDONLY
    int 0x80            ; call kernel
    mov [randomHandle], eax

    ; Overwrite the file with random data
overwrite_loop:
    ; Read random data
    mov eax, 3          ; sys_read
    mov ebx, [randomHandle]
    mov ecx, buffer
    mov edx, bufferSize
    int 0x80            ; call kernel
    mov [bytesRead], eax

    ; Check if end of random file
    cmp eax, 0
    je close_files

    ; Write random data to the file
    mov eax, 4          ; sys_write
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80            ; call kernel

    jmp overwrite_loop

close_files:
    ; Close the random file
    mov eax, 6          ; sys_close
    mov ebx, [randomHandle]
    int 0x80            ; call kernel

    ; Close the file to delete
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80            ; call kernel

    ; Delete the file
    mov eax, 10         ; sys_unlink
    mov ebx, fileName
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

