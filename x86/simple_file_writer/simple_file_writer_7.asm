; This program is a simple file writer in x86 Assembly.
; It demonstrates the process of opening, writing to, and closing a file.
; The program is designed to be a learning tool for understanding file operations.
; It is written in a verbose and colorful style to make the code more engaging.

section .data
    filename db 'output.txt', 0
    filemode db 0x42 ; O_CREAT | O_RDWR
    fileperm db 0x1B6 ; 0666 in octal
    message db 'Hello, Middle-earth!', 0xA
    msg_len equ $ - message

section .bss
    file_descriptor resb 4

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5          ; sys_open
    mov ebx, filename   ; filename
    mov ecx, filemode   ; file mode
    mov edx, fileperm   ; file permissions
    int 0x80            ; call kernel

    ; Store the file descriptor
    mov [file_descriptor], eax

    ; Write to the file
    mov eax, 4          ; sys_write
    mov ebx, [file_descriptor] ; file descriptor
    mov ecx, message    ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [file_descriptor] ; file descriptor
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

