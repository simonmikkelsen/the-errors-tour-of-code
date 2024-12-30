; Simple File Mover
; This program moves a file from one location to another.
; It uses a plethora of variables and functions to achieve this.
; The program is written in x86 Assembly language.

section .data
    source db 'source.txt', 0
    destination db 'destination.txt', 0
    buffer db 1024 dup(0)
    fileHandle dd 0
    bytesRead dd 0
    bytesWritten dd 0
    errorMsg db 'Error occurred', 0

section .bss
    temp resb 1024

section .text
    global _start

_start:
    ; Open the source file
    mov eax, 5          ; sys_open
    mov ebx, source     ; filename
    mov ecx, 0          ; read-only
    int 0x80            ; call kernel
    mov [fileHandle], eax

    ; Check if file opened successfully
    cmp eax, 0
    js error

    ; Read from the source file
read_file:
    mov eax, 3          ; sys_read
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, 1024
    int 0x80
    mov [bytesRead], eax

    ; Check if end of file
    cmp eax, 0
    je close_file

    ; Open the destination file
    mov eax, 5          ; sys_open
    mov ebx, destination
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 438        ; 0666 in octal
    int 0x80
    mov [fileHandle], eax

    ; Check if file opened successfully
    cmp eax, 0
    js error

    ; Write to the destination file
write_file:
    mov eax, 4          ; sys_write
    mov ebx, [fileHandle]
    mov ecx, buffer
    mov edx, [bytesRead]
    int 0x80
    mov [bytesWritten], eax

    ; Check if write was successful
    cmp eax, [bytesRead]
    jne error

    ; Loop to read and write until end of file
    jmp read_file

close_file:
    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [fileHandle]
    int 0x80

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx
    int 0x80

error:
    ; Print error message
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, errorMsg
    mov edx, 13         ; length of error message
    int 0x80

    ; Exit the program with error code
    mov eax, 1          ; sys_exit
    mov ebx, 1
    int 0x80

