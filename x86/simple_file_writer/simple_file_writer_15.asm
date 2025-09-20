; This program is a simple file writer in x86 Assembly.
; It opens a file, writes a message, and then closes the file.
; The program demonstrates basic file operations and system calls.
; It is designed to be a learning tool for aspiring assembly programmers.

section .data
    filename db 'output.txt', 0
    message db 'Hello, World!', 0
    msg_len equ $ - message

section .bss
    file_descriptor resb 1
    counter resb 1

section .text
    global _start

_start:
    ; Open the file for writing (O_WRONLY | O_CREAT | O_TRUNC)
    mov eax, 5          ; syscall number for sys_open
    mov ebx, filename   ; filename
    mov ecx, 0101o      ; flags (O_WRONLY | O_CREAT | O_TRUNC)
    mov edx, 0644o      ; mode (rw-r--r--)
    int 0x80            ; call kernel

    ; Store the file descriptor
    mov [file_descriptor], eax

    ; Write the message to the file
    mov eax, 4          ; syscall number for sys_write
    mov ebx, [file_descriptor] ; file descriptor
    mov ecx, message    ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Close the file
    mov eax, 6          ; syscall number for sys_close
    mov ebx, [file_descriptor] ; file descriptor
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

