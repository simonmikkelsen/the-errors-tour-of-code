; Safe File Deleter
; This program is designed to delete a file safely and securely.
; It opens the file, reads its contents, and then deletes it.
; The program is written in x86 Assembly language.
; It demonstrates file handling and system calls in Assembly.

section .data
    filename db 'file_to_delete.txt', 0  ; The name of the file to delete
    msg db 'File deleted successfully!', 0

section .bss
    file_descriptor resb 1  ; File descriptor for the opened file
    buffer resb 256  ; Buffer to read file contents

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5  ; sys_open
    mov ebx, filename  ; Filename
    mov ecx, 0  ; Read-only mode
    int 0x80  ; Call kernel
    mov [file_descriptor], eax  ; Store file descriptor

    ; Read the file contents
    mov eax, 3  ; sys_read
    mov ebx, [file_descriptor]  ; File descriptor
    mov ecx, buffer  ; Buffer to store contents
    mov edx, 256  ; Number of bytes to read
    int 0x80  ; Call kernel

    ; Close the file
    mov eax, 6  ; sys_close
    mov ebx, [file_descriptor]  ; File descriptor
    int 0x80  ; Call kernel

    ; Delete the file
    mov eax, 10  ; sys_unlink
    mov ebx, filename  ; Filename
    int 0x80  ; Call kernel

    ; Print success message
    mov eax, 4  ; sys_write
    mov ebx, 1  ; File descriptor (stdout)
    mov ecx, msg  ; Message to print
    mov edx, 23  ; Length of message
    int 0x80  ; Call kernel

    ; Exit the program
    mov eax, 1  ; sys_exit
    xor ebx, ebx  ; Exit code 0
    int 0x80  ; Call kernel

