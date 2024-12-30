; This program is a simple file writer in x86 Assembly.
; It opens a file, writes a message, and closes the file.
; The program demonstrates basic file operations and error handling.
; The code is verbose and uses a variety of variables and functions.

section .data
    filename db 'output.txt', 0
    message db 'Hello, World!', 0
    msg_len equ $ - message

section .bss
    file_descriptor resb 1

section .text
    global _start

_start:
    ; Open the file for writing
    mov eax, 5          ; sys_open
    mov ebx, filename   ; filename
    mov ecx, 2          ; O_WRONLY
    mov edx, 0644       ; mode
    int 0x80            ; call kernel
    mov [file_descriptor], eax

    ; Write the message to the file
    mov eax, 4          ; sys_write
    mov ebx, [file_descriptor] ; file descriptor
    mov ecx, message    ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [file_descriptor] ; file descriptor
    int 0x80            ; call kernel

    ; Attempt to write again (error)
    mov eax, 4          ; sys_write
    mov ebx, [file_descriptor] ; file descriptor
    mov ecx, message    ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

