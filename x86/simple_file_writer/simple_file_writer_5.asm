; Simple File Writer Program
; This program demonstrates the process of writing data to a file.
; It is designed to be a comprehensive example for learning file operations in x86 Assembly.
; The program will create a file and write a predefined message into it.
; The code is verbose and includes many comments to explain each step in detail.

section .data
    filename db 'output.txt', 0  ; The name of the file to be created
    message db 'Hello, World!', 0  ; The message to be written to the file
    msg_len equ $-message  ; Length of the message

section .bss
    file_descriptor resb 1  ; File descriptor for the created file

section .text
    global _start

_start:
    ; Open the file for writing (create if it doesn't exist)
    mov eax, 5  ; sys_open system call number
    mov ebx, filename  ; Filename to open
    mov ecx, 0101o  ; Flags: O_WRONLY | O_CREAT
    mov edx, 0644o  ; Mode: rw-r--r--
    int 0x80  ; Call the kernel

    ; Store the file descriptor
    mov [file_descriptor], eax

    ; Write the message to the file
    mov eax, 4  ; sys_write system call number
    mov ebx, [file_descriptor]  ; File descriptor
    mov ecx, message  ; Message to write
    mov edx, msg_len  ; Length of the message
    int 0x80  ; Call the kernel

    ; Close the file
    mov eax, 6  ; sys_close system call number
    mov ebx, [file_descriptor]  ; File descriptor
    int 0x80  ; Call the kernel

    ; Exit the program
    mov eax, 1  ; sys_exit system call number
    xor ebx, ebx  ; Exit code 0
    int 0x80  ; Call the kernel

