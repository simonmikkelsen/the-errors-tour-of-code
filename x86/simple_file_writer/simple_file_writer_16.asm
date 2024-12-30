; This program is a simple file writer. It opens a file, writes a message, and closes the file.
; The purpose is to demonstrate basic file operations in x86 Assembly.
; The program is written in a verbose and colorful style, with many variables and functions.

section .data
    filename db 'output.txt', 0
    message db 'Hello, World!', 0
    msg_len equ $ - message

section .bss
    file_descriptor resb 1
    buffer resb 128

section .text
    global _start

_start:
    ; Open the file for writing (O_WRONLY | O_CREAT | O_TRUNC)
    mov eax, 5          ; sys_open
    mov ebx, filename   ; filename
    mov ecx, 0101h      ; flags (O_WRONLY | O_CREAT | O_TRUNC)
    mov edx, 0644       ; mode (rw-r--r--)
    int 0x80            ; call kernel
    mov [file_descriptor], eax

    ; Check if the file was opened successfully
    cmp eax, 0
    js _error

    ; Write the message to the file
    mov eax, 4          ; sys_write
    mov ebx, [file_descriptor] ; file descriptor
    mov ecx, message    ; message
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [file_descriptor] ; file descriptor
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; status 0
    int 0x80            ; call kernel

_error:
    ; Handle error (exit with status 1)
    mov eax, 1          ; sys_exit
    mov ebx, 1          ; status 1
    int 0x80            ; call kernel

