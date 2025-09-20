; This program is a simple file writer in x86 Assembly.
; It demonstrates the process of opening, writing to, and closing a file.
; The program is designed to be educational and illustrative.
; It showcases the use of system calls and basic file operations.

section .data
    filename db 'output.txt', 0  ; The name of the file to be created
    content db 'Hello, Middle-earth!', 0  ; The content to be written to the file
    content_length equ $ - content  ; Calculate the length of the content

section .bss
    file_descriptor resb 4  ; Reserve space for the file descriptor

section .text
    global _start  ; Entry point for the program

_start:
    ; Open the file for writing (O_WRONLY | O_CREAT | O_TRUNC)
    mov eax, 5  ; sys_open system call number
    mov ebx, filename  ; Pointer to the filename
    mov ecx, 0101o  ; Flags: O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644  ; File permissions: rw-r--r--
    int 0x80  ; Call the kernel
    mov [file_descriptor], eax  ; Store the file descriptor

    ; Write the content to the file
    mov eax, 4  ; sys_write system call number
    mov ebx, [file_descriptor]  ; File descriptor
    mov ecx, content  ; Pointer to the content
    mov edx, content_length  ; Length of the content
    int 0x80  ; Call the kernel

    ; Close the file
    mov eax, 6  ; sys_close system call number
    mov ebx, [file_descriptor]  ; File descriptor
    int 0x80  ; Call the kernel

    ; Exit the program
    mov eax, 1  ; sys_exit system call number
    xor ebx, ebx  ; Exit code 0
    int 0x80  ; Call the kernel

