; This program is a simple file writer in x86 Assembly.
; It demonstrates the process of opening, writing to, and closing a file.
; The program is designed to be educational and illustrative.
; It uses a variety of variables and functions to achieve its goal.
; The program is verbose and detailed, providing a comprehensive example.

section .data
    filename db 'output.txt', 0  ; The name of the file to be written to
    content db 'Hello, World!', 0xA  ; The content to write to the file
    content_length equ $ - content  ; The length of the content

section .bss
    file_descriptor resb 1  ; The file descriptor for the opened file

section .text
    global _start

_start:
    ; Open the file for writing (O_WRONLY | O_CREAT | O_TRUNC)
    mov eax, 5  ; sys_open
    mov ebx, filename  ; The filename
    mov ecx, 0101o  ; Flags: O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644o  ; Mode: rw-r--r--
    int 0x80  ; Call the kernel
    mov [file_descriptor], eax  ; Store the file descriptor

    ; Write the content to the file
    mov eax, 4  ; sys_write
    mov ebx, [file_descriptor]  ; The file descriptor
    mov ecx, content  ; The content
    mov edx, content_length  ; The length of the content
    int 0x80  ; Call the kernel

    ; Close the file
    mov eax, 6  ; sys_close
    mov ebx, [file_descriptor]  ; The file descriptor
    int 0x80  ; Call the kernel

    ; Exit the program
    mov eax, 1  ; sys_exit
    xor ebx, ebx  ; Exit code 0
    int 0x80  ; Call the kernel

